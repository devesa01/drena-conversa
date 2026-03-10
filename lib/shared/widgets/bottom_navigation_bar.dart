import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      height: AppDimensions.bottomNavHeight,
      backgroundColor: AppColors.backgroundBase,
      indicatorColor: AppColors.navIndicator,
      elevation: 0,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      destinations: const [
        NavigationDestination(
          icon: Icon(LucideIcons.messageCircle, color: AppColors.navInactive),
          selectedIcon: Icon(
            LucideIcons.messageCircle,
            color: AppColors.navActive,
          ),
          label: '',
        ),
        NavigationDestination(
          icon: Icon(LucideIcons.user, color: AppColors.navInactive),
          selectedIcon: Icon(LucideIcons.user, color: AppColors.navActive),
          label: '',
        ),
      ],
    );
  }
}
