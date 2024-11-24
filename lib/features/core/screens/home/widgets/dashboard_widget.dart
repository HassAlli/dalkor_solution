import 'package:dalkor/utils/constants/app_colors.dart';
import 'package:dalkor/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({
    super.key,
    required this.icon,
    required this.data,
    this.unit = "",
    required this.label,
    required this.statusText,
    required this.statusColor,
  });

  final IconData icon;
  final String data;
  final String unit;
  final String label;
  final String statusText;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.grey.withOpacity(0.65),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.darkGrey.withOpacity(0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card Header
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                // padding: EdgeInsets.all(AppSizes.xs),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border.all(color: AppColors.darkGrey.withOpacity(0.3)),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: AppColors.primary,
                    size: 22,
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(data, style: Theme.of(context).textTheme.headlineLarge),
                  if (unit.isNotEmpty) ...[
                    const SizedBox(width: 2),
                    Text(
                      unit,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              fontSize: 16,
                              height: 1.8,
                              color: AppColors.textSecondary),
                    ),
                  ]
                ],
              ),
            ],
          ),
          const SizedBox(height: AppSizes.xs),
          Text.rich(
            TextSpan(
                text: label,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.textSecondary,
                    ),
                children: [
                  TextSpan(
                    text: "  $statusText",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
