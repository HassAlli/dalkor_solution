import 'package:dalkor/features/auth/screens/meter/meter_screen.dart';
import 'package:dalkor/utils/constants/app_colors.dart';
import 'package:dalkor/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProvidersScreen extends StatefulWidget {
  const ProvidersScreen({super.key});

  @override
  State<ProvidersScreen> createState() => _ProvidersScreenState();
}

class _ProvidersScreenState extends State<ProvidersScreen> {
  int _selectedProvider = -1;
  final List providers = [
    {
      'name': 'BECO',
      'location': 'Mogadishu, Somalia',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhqYqxE6dzgbgz2_GeTzSVOtXan0YNwuOM1Q&s',
    },
    {
      'name': 'Mogadishu Power',
      'location': 'Mogadishu, Somalia',
      'image': 'https://i.postimg.cc/28Ptx5PS/LOGOFOLIO-09.png',
    },
    {
      'name': 'BECO',
      'location': 'Hargaisa, Somalia',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhqYqxE6dzgbgz2_GeTzSVOtXan0YNwuOM1Q&s',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(AppSizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSizes.appBarHeight),
          Text(
            'Select Your Provider',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedProvider = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(AppSizes.sm),
                  decoration: BoxDecoration(
                    color: _selectedProvider == index
                        ? AppColors.primary.withOpacity(0.1)
                        : AppColors.grey.withOpacity(0.2),
                    border: Border.all(
                        color: _selectedProvider == index
                            ? AppColors.primary
                            : AppColors.grey.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(AppSizes.sm),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(AppSizes.sm),
                          image: DecorationImage(
                            image: NetworkImage(
                              providers[index]['image'],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: AppSizes.md),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            providers[index]['name'],
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            providers[index]['location'],
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) =>
                const SizedBox(height: AppSizes.md),
            itemCount: providers.length,
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_selectedProvider != -1) {
                  Get.to(MeterScreen());
                }
              },
              child: const Text("Continue"),
            ),
          ),
          const SizedBox(height: AppSizes.lg),
        ],
      ),
    ));
  }
}
