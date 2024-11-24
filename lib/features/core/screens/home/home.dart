import 'package:dalkor/common/widgets/custom_filter_chip.dart';
import 'package:dalkor/features/core/screens/home/widgets/dashboard_widget.dart';
import 'package:dalkor/utils/constants/app_colors.dart';
import 'package:dalkor/utils/constants/app_sizes.dart';
import 'package:dalkor/utils/constants/app_text.dart';
import 'package:dalkor/utils/enum/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ChartFilter _chartFilter = ChartFilter.daily;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppText.appName,
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
              padding: const EdgeInsets.all(AppSizes.md),
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
                          data: "1.5",
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
              padding: const EdgeInsets.all(AppSizes.md),
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
                        padding: const EdgeInsets.all(AppSizes.xs),
                        decoration: BoxDecoration(
                            color: AppColors.grey.withOpacity(0.65),
                            border: Border.all(
                                color: AppColors.darkGrey.withOpacity(0.25)),
                            borderRadius: BorderRadius.circular(100)),
                        child: Row(
                          children: [
                            KFilterChip(
                              label: "Today",
                              isSelected: _chartFilter == ChartFilter.daily,
                              onSelected: () {
                                setState(() {
                                  _chartFilter = ChartFilter.daily;
                                });
                              },
                            ),
                            KFilterChip(
                              label: "Weekly",
                              isSelected: _chartFilter == ChartFilter.weekly,
                              onSelected: () {
                                setState(() {
                                  _chartFilter = ChartFilter.weekly;
                                });
                              },
                            ),
                            KFilterChip(
                              label: "Monthly",
                              isSelected: _chartFilter == ChartFilter.monthly,
                              onSelected: () {
                                setState(() {
                                  _chartFilter = ChartFilter.monthly;
                                });
                              },
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
                    child: _chartFilter == ChartFilter.daily
                        ? buildChartDaily()
                        : _chartFilter == ChartFilter.weekly
                            ? buildChartWeekly()
                            : buildChartMonthly(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChart buildChartDaily() {
    return BarChart(
      BarChartData(
        maxY: 10,
        barGroups: [
          makeGroupData(0, 6, 5),
          makeGroupData(1, 5, 3),
          makeGroupData(2, 2, 1),
          makeGroupData(3, 8, 6),
          makeGroupData(4, 4, 2),
          makeGroupData(5, 7, 5),
          makeGroupData(6, 5, 4),
        ],
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false), // Hide top numbers
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(
                  '\$${value.toInt()}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                );
              },
              interval: 2,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const days = [
                  '00:00',
                  '03:25',
                  '06:50',
                  '10:15',
                  '13:40',
                  '17:05',
                  '20:30'
                ];
                return Text(
                  days[value.toInt()],
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                );
              },
            ),
          ),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barTouchData: BarTouchData(enabled: false), // Disable tooltips
      ),
    );
  }

  BarChart buildChartWeekly() {
    return BarChart(
      BarChartData(
        maxY: 50,
        barGroups: [
          makeGroupData(0, 40, 30),
          makeGroupData(1, 40, 35),
          makeGroupData(2, 40, 35),
          makeGroupData(3, 30, 40),
          makeGroupData(4, 45, 40),
          makeGroupData(5, 35, 25),
          makeGroupData(6, 40, 30),
        ],
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false), // Hide top numbers
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(
                  '\$${value.toInt()}',
                  style: const TextStyle(
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
                const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
                return Text(
                  days[value.toInt()],
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                );
              },
            ),
          ),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barTouchData: BarTouchData(enabled: false), // Disable tooltips
      ),
    );
  }

  BarChart buildChartMonthly() {
    return BarChart(
      BarChartData(
        maxY: 90,
        barGroups: [
          makeGroupData(0, 65, 55),
          makeGroupData(1, 70, 80),
          makeGroupData(2, 40, 35),
          makeGroupData(3, 50, 40),
          makeGroupData(4, 65, 50),
          makeGroupData(5, 65, 75),
          makeGroupData(6, 60, 50),
        ],
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false), // Hide top numbers
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(
                  '\$${value.toInt()}',
                  style: const TextStyle(
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
                const days = ['May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov'];

                return Text(
                  days[value.toInt()],
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                );
              },
            ),
          ),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barTouchData: BarTouchData(enabled: false), // Disable tooltips
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
