import 'package:dalkor/common/widgets/custom_filter_chip.dart';
import 'package:dalkor/utils/constants/app_colors.dart';
import 'package:dalkor/utils/constants/app_sizes.dart';
import 'package:dalkor/utils/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppText.appName.split(' ').first,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cards
            Padding(
              padding: EdgeInsets.all(AppSizes.md),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: DashboardWidget(
                          data: "855",
                          unit: "kWh",
                          icon: PhosphorIcons.batteryFull(
                              PhosphorIconsStyle.bold),
                          label: "Current Balance",
                          statusText: "-4.8%",
                          statusColor: AppColors.success,
                        ),
                      ),
                      const SizedBox(width: AppSizes.sm),
                      Expanded(
                        child: DashboardWidget(
                          data: "375",
                          unit: "kWh",
                          icon: PhosphorIcons.chartBar(PhosphorIconsStyle.bold),
                          label: "Weekly Usage",
                          statusText: "-3.6%",
                          statusColor: AppColors.success,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.sm),
                  Row(
                    children: [
                      Expanded(
                        child: DashboardWidget(
                          data: "1.25",
                          unit: "USD",
                          icon: PhosphorIcons.currencyCircleDollar(
                              PhosphorIconsStyle.bold),
                          label: "AVG Daily Cost",
                          statusText: "+2.4%",
                          statusColor: Colors.redAccent,
                        ),
                      ),
                      const SizedBox(width: AppSizes.sm),
                      Expanded(
                        child: DashboardWidget(
                          data: "12",
                          unit: "Days",
                          icon: PhosphorIcons.timer(PhosphorIconsStyle.bold),
                          label: "Days Remaining",
                          statusText: "+1.6%",
                          statusColor: AppColors.success,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: AppColors.grey.withOpacity(0.65)),
            Padding(
              padding: EdgeInsets.all(AppSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Overview",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Container(
                        padding: EdgeInsets.all(AppSizes.xs),
                        decoration: BoxDecoration(
                            color: AppColors.grey.withOpacity(0.65),
                            border: Border.all(
                                color: AppColors.darkGrey.withOpacity(0.25)),
                            borderRadius: BorderRadius.circular(100)),
                        child: Row(
                          children: [
                            KFilterChip(
                              label: "Today",
                              isSelected: false,
                              onSelected: () {},
                            ),
                            KFilterChip(
                              label: "Weekly",
                              isSelected: true,
                              onSelected: () {},
                            ),
                            KFilterChip(
                              label: "Monthly",
                              isSelected: false,
                              onSelected: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.md),
                  SizedBox(
                    height: Get.width * 0.8,
                    width: Get.width,
                    child: BarChart(
                      BarChartData(
                        maxY: 80,
                        barGroups: [
                          makeGroupData(0, 60, 50),
                          makeGroupData(1, 40, 35),
                          makeGroupData(2, 65, 55),
                          makeGroupData(3, 50, 40),
                          makeGroupData(4, 70, 60),
                          makeGroupData(5, 55, 45),
                          makeGroupData(6, 65, 50),
                        ],
                        titlesData: FlTitlesData(
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(
                                showTitles: false), // Hide top numbers
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                return Text(
                                  '\$${value.toInt()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                );
                              },
                              interval: 20,
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                const days = [
                                  'Sun',
                                  'Mon',
                                  'Tue',
                                  'Wed',
                                  'Thu',
                                  'Fri',
                                  'Sat'
                                ];
                                return Text(
                                  days[value.toInt()],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                );
                              },
                            ),
                          ),
                        ),
                        gridData: FlGridData(show: false),
                        borderData: FlBorderData(show: false),
                        barTouchData:
                            BarTouchData(enabled: false), // Disable tooltips
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: Colors.blue,
          width: 8,
        ),
        BarChartRodData(
          toY: y2,
          color: Colors.lightBlueAccent,
          width: 8,
        ),
      ],
    );
  }
}

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
