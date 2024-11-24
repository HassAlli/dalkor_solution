import 'package:dalkor/features/core/screens/history/history_screen.dart';
import 'package:dalkor/features/core/screens/home/home.dart';
import 'package:dalkor/features/core/screens/payment/payment.dart';
import 'package:dalkor/features/core/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dalkor/utils/constants/app_colors.dart';
import 'package:dalkor/utils/helpers/helper_functions.dart';

class AppNavScreen extends StatelessWidget {
  const AppNavScreen({
    super.key,
    this.initialIndex = 0,
  });

  final int? initialIndex;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(_NavigationController());
    final isDark = KHelperFunctions.isDarkMode(context);
    //  controller.selectedIndex.value = initialIndex!;

    return Scaffold(
      bottomNavigationBar: Obx(
        () {
          return NavigationBar(
            height: 80,
            elevation: 0,
            backgroundColor: isDark ? AppColors.black : AppColors.white,
            indicatorColor: isDark
                ? AppColors.white.withOpacity(0.1)
                : AppColors.black.withOpacity(0.1),
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) {
              controller.selectedIndex.value = index;
            },
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Iconsax.electricity), label: 'Purchase'),
              NavigationDestination(
                  icon: Icon(Iconsax.calendar), label: 'History'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ],
          );
        },
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class _NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const PurchaseScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];
}
