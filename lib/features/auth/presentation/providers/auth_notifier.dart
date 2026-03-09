import 'package:drena_conversa/features/auth/data/repositories/auth_repository.dart';
import 'package:drena_conversa/features/auth/domain/auth_exception.dart' as ex;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_state.dart';

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

  AuthNotifier(this._repository) : super(const AuthInitial());

  Future<void> login({required String nut, required String ppa}) async {
    state = const AuthLoading();
    try {
      final user = await _repository.login(nut: nut, ppa: ppa);
      state = AuthSuccess(user);
    } on ex.AuthException catch (e) {
      if (e.error == ex.AuthError.emailNotConfirmed) {
        state = const AuthEmailNotConfirmed();
      } else {
        state = AuthError(e.message);
      }
    }
  }

  void reset() => state = const AuthInitial();
}