import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/validators.dart';
import '../../../../shared/widgets/custom_login_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: chamar auth_provider / cubit
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fundo base preto
      backgroundColor: AppColors.backgroundBase,
      body: Container(
        // Gradiente por cima do fundo
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppDimensions.spacingS),
                _buildTitle(),
                const SizedBox(height: AppDimensions.spacingS),
                _buildForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      AppStrings.loginTitle,
      style: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomLoginInput(
            label: AppStrings.loginUsername,
            controller: _usernameController,
            validator: Validators.username,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: AppDimensions.spacingS),
          CustomLoginInput(
            label: AppStrings.loginPassword,
            controller: _passwordController,
            validator: Validators.password,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: AppDimensions.spacingM),
          _buildLoginButton(),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: _onLoginPressed,
      child: const Text(AppStrings.loginButton),
    );
  }
}