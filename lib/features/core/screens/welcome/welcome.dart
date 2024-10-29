import 'package:dalkor/features/core/screens/provider/providers_screen.dart';
import 'package:dalkor/utils/constants/app_assets.dart';
import 'package:dalkor/utils/constants/app_colors.dart';
import 'package:dalkor/utils/constants/app_sizes.dart';
import 'package:dalkor/utils/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSizes.md),
          SizedBox(
            height: Get.width,
            child: Image.asset(
              AppAssets.welcomeImage,
              fit: BoxFit.cover,
            ),
          ),
           const SizedBox(height: AppSizes.xl),
           Padding(
             padding: const EdgeInsets.all(AppSizes.md),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(AppText.welcomeTitle, style: Theme.of(context).textTheme.headlineLarge),
                 Text(AppText.appName, style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: AppColors.primary,
                 )),
                 const SizedBox(height: 4),
             
                 const SizedBox(height: AppSizes.xl),
                 SizedBox(width: double.infinity, child: 
                 ElevatedButton(onPressed: () => Get.to(const ProvidersScreen()) , child: const Text("Continue")),
                 ),
               ],
             ),
           ),
        ],
      ),
    );
  }
}