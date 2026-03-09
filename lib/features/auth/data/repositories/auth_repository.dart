import 'dart:convert';
import 'package:drena_conversa/core/config/auth_endpoints.dart';
import 'package:drena_conversa/features/auth/data/models/user_model.dart';
import 'package:drena_conversa/features/auth/domain/auth_exception.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final http.Client _client;

  AuthRepository({http.Client? client}) : _client = client ?? http.Client();

  Future<UserModel> login({
    required String nut,
    required String ppa,
  }) async {
    try {
      final response = await _client.post(
        Uri.parse(AuthEndpoints.login),
        body: {'nut': nut, 'ppa': ppa},
      );

      final json = jsonDecode(response.body) as Map<String, dynamic>;

      // Erros da API → {"avi": {"nut": X, "ppa": X}}
      if (json.containsKey('avi')) {
        final avi = json['avi'] as Map<String, dynamic>;
        final nutErr = avi['nut'];
        final ppaErr = avi['ppa'];

        if (nutErr == 1) throw const AuthException(message: 'Username obrigatório.', error: AuthError.nutEmpty);
        if (nutErr == 2) throw const AuthException(message: 'Utilizador não encontrado ou desativado.', error: AuthError.nutNotFound);
        if (ppaErr == 1) throw const AuthException(message: 'Password obrigatória.', error: AuthError.ppaEmpty);
        if (ppaErr == 3) throw const AuthException(message: 'Password incorreta.', error: AuthError.ppaWrong);
        throw const AuthException(message: 'Erro desconhecido.', error: AuthError.unknown);
      }

      final est = json['est'] as String?;

      // Email não confirmado → {"est": "registo"}
      if (est == 'registo') {
        throw const AuthException(
          message: 'O teu email ainda não foi confirmado.',
          error: AuthError.emailNotConfirmed,
        );
      }

      // Sucesso → {"est": "sucesso", "token": "..."}
      if (est == 'sucesso') {
        return UserModel.fromJson(json, nut);
      }

      throw const AuthException(message: 'Resposta inesperada do servidor.', error: AuthError.unknown);
    } on AuthException {
      rethrow;
    } catch (e) {
      throw const AuthException(message: 'Erro de ligação ao servidor.', error: AuthError.unknown);
    }
  }
}