import 'package:drena_conversa/core/constants/app_colors.dart';
import 'package:drena_conversa/core/constants/app_dimensions.dart';
import 'package:drena_conversa/core/constants/app_fonts.dart';
import 'package:drena_conversa/features/auth/presentation/providers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatMenuScreen extends ConsumerWidget {
  const ChatMenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

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
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.screenPaddingMobile),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(user?.nut),
                  // TODO: resto do conteúdo
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String? nut) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppDimensions.spacingS),
        Text(
          'Conversas',
          style: AppFonts.title,
        ),
        Text(
          nut ?? '',
          style: AppFonts.body,
        ),
        const SizedBox(height: AppDimensions.spacingM),
      ],
    );
  }
}