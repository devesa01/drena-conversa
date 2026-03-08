import 'package:drena_conversa/core/constants/app_strings.dart';
import 'package:drena_conversa/core/theme/app_theme.dart';
import 'package:drena_conversa/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: AppTheme.dark,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}

