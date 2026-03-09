enum AppEnvironment { dev, prod }

class AppEnv {
  AppEnv._();

  static const AppEnvironment current = AppEnvironment.dev;

  // codigo pronto para alterar a url de acordo com o ambiente, caso seja necessário
  
  static String get baseUrl {
    switch (current) {
      case AppEnvironment.dev:
        return 'https://drena.pt/api';
      case AppEnvironment.prod:
        return 'https://drena.pt/api';
    }
  }
}