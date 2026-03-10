import 'dart:convert';

import 'package:drena_conversa/core/services/storage_service.dart';
import 'package:drena_conversa/features/auth/data/models/user_model.dart';
import 'package:drena_conversa/features/auth/data/repositories/auth_repository.dart';
import 'package:drena_conversa/features/auth/domain/auth_exception.dart' as ex;
import 'package:drena_conversa/features/auth/presentation/providers/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.read(authRepositoryProvider));
});

// Provider para aceder ao utilizador atual diretamente
final currentUserProvider = Provider((ref) {
  final state = ref.watch(authNotifierProvider);
  if (state is AuthSuccess) return state.user;
  return null;
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repository;

  AuthNotifier(this._repository) : super(const AuthInitial()) {
    _tryRestoreSession();
  }

  // Ao arrancar a app —  restaurar sessão a partir do token guardado~
  // sem token, fica em AuthInitial
  // token expirado, limpa
  // Token válido — extrai o nut do payload JWT e restaura sessão

  Future<void> _tryRestoreSession() async {
    final token = await StorageService.getToken();
    if (token == null) return; 

    if (_isTokenExpired(token)) {
      await StorageService.deleteToken(); 
      return;
    }

    final nut = _extractNutFromToken(token);
    if (nut != null) {
      state = AuthSuccess(UserModel(nut: nut, token: token));
    }
  }

  // Tenta fazer login com as credenciais fornecidas
  Future<void> login({required String nut, required String ppa}) async {
    state = const AuthLoading();
    try {
      final user = await _repository.login(nut: nut, ppa: ppa);
      await StorageService.saveToken(user.token); 
      state = AuthSuccess(user);
    } on ex.AuthException catch (e) {
      if (e.error == ex.AuthError.emailNotConfirmed) {
        state = const AuthEmailNotConfirmed();
      } else {
        state = AuthError(e.message);
      }
    }
  }

  // Limpa a sessão atual
  Future<void> logout() async {
    await StorageService.clear(); 
    state = const AuthInitial();
  }

  void reset() => state = const AuthInitial();

  // Verifica se o token JWT expirou
  // Descodifica o payload (parte do meio) e compara o campo "exp" com o tempo atual
  // se falhar a leitura, trata como expirado
  
  bool _isTokenExpired(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return true;

      final payload = jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))),
      ) as Map<String, dynamic>;

      final exp = payload['exp'] as int?;
      if (exp == null) return true;

      return DateTime.now().millisecondsSinceEpoch > exp * 1000;
    } catch (_) {
      return true; 
    }
  }

  /// Extrai o username (sub) do payload JWT
  String? _extractNutFromToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;

      final payload = jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))),
      ) as Map<String, dynamic>;

      return payload['sub'] as String?;
    } catch (_) {
      return null;
    }
  }
}