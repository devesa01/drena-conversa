import 'package:drena_conversa/core/constants/app_strings.dart';
import 'package:drena_conversa/core/theme/app_theme.dart';
import 'package:drena_conversa/features/auth/presentation/screens/login_screen.dart';
import 'package:drena_conversa/shared/widgets/main_shell.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();

  static const String login = '/login';
  static const String chatMenu = '/chatmenu';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: AppTheme.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.chatMenu: (context) => const MainShell(),
      },
    );
  }
}