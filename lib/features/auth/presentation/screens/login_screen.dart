import 'package:drena_conversa/app.dart';
import 'package:drena_conversa/core/constants/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/validators.dart';
import '../../../../shared/widgets/custom_login_input.dart';
import '../providers/auth_notifier.dart';
import '../providers/auth_state.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nutController = TextEditingController();
  final _ppaController = TextEditingController();

  @override
  void dispose() {
    _nutController.dispose();
    _ppaController.dispose();
    super.dispose();
  }

  Future<void> _onLoginPressed() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    await ref
        .read(authNotifierProvider.notifier)
        .login(nut: _nutController.text.trim(), ppa: _ppaController.text);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authNotifierProvider, (_, state) {
      if (state is AuthSuccess) {
        Navigator.pushReplacementNamed(context, AppRoutes.chatMenu);
      }
      if (state is AuthEmailNotConfirmed) {
        // TODO: navegar para o ecrã de confirmação de email
        // context.go('/confirmar-email');
      }
      if (state is AuthError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.message),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    });

    final authState = ref.watch(authNotifierProvider);
    final isLoading = authState is AuthLoading;

    final screenPadding = Responsive.value<double>(
      context,
      mobile: AppDimensions.screenPaddingMobile,
      tablet: AppDimensions.screenPaddingTablet,
      desktop: AppDimensions.screenPaddingDesktop,
    );

    final formMaxWidth = Responsive.value<double>(
      context,
      mobile: AppDimensions.formMaxWidthMobile,
      tablet: AppDimensions.formMaxWidthTablet,
      desktop: AppDimensions.formMaxWidthDesktop,
    );

    return Scaffold(
      backgroundColor: AppColors.backgroundBase,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: AppColors.backgroundGradient,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(screenPadding),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: formMaxWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: AppDimensions.spacingS),
                      _buildTitle(),
                      const SizedBox(height: AppDimensions.spacingS),
                      _buildForm(isLoading),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Overlay de loading por cima de tudo
          if (isLoading)
            const Positioned.fill(
              child: ColoredBox(
                color: Colors.black38,
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
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

  Widget _buildForm(bool isLoading) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomLoginInput(
            label: AppStrings.loginUsername,
            controller: _nutController,
            validator: Validators.username,
            textInputAction: TextInputAction.next,
            enabled: !isLoading,
          ),
          const SizedBox(height: AppDimensions.spacingS),
          CustomLoginInput(
            label: AppStrings.loginPassword,
            controller: _ppaController,
            validator: Validators.password,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            enabled: !isLoading,
          ),
          const SizedBox(height: AppDimensions.spacingM),
          _buildLoginButton(isLoading),
        ],
      ),
    );
  }

  Widget _buildLoginButton(bool isLoading) {
    return ElevatedButton(
      onPressed: isLoading ? null : _onLoginPressed,
      child: const Text(AppStrings.loginButton),
    );
  }
}
