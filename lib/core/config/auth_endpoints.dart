import 'app_env.dart';

class AuthEndpoints {
  AuthEndpoints._();

  static String get login => '${AppEnv.baseUrl}/entrar';
}