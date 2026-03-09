/// Erros mapeados diretamente da API
class AuthException implements Exception {
  final String message;
  final AuthError error;

  const AuthException({required this.message, required this.error});
}

enum AuthError {
  nutEmpty,         // nut: 1 — username vazio
  nutNotFound,      // nut: 2 — utilizador não encontrado ou desativado
  ppaEmpty,         // ppa: 1 — password vazia
  ppaWrong,         // ppa: 3 — password errada
  emailNotConfirmed, // est: registo — email não confirmado
  unknown,
}