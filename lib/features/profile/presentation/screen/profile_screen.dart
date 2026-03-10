import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_fonts.dart';
import '../../../../features/auth/presentation/providers/auth_notifier.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

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
                  const SizedBox(height: AppDimensions.spacingS),
                  Text('Perfil', style: AppFonts.title),
                  const SizedBox(height: AppDimensions.spacingS),
                  Text(user?.nut ?? '', style: AppFonts.body),
                  // TODO: resto do perfil
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}