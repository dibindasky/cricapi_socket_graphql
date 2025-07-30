import 'dart:io';
import 'package:distinct_assignment/application/controller/odd/odd_controller.dart';
import 'package:distinct_assignment/core/utils/colors.dart';
import 'package:distinct_assignment/core/utils/const.dart';
import 'package:distinct_assignment/core/utils/toast/custom_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

class ScreenOdds extends StatelessWidget {
  const ScreenOdds({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OddController());
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Cricket Trading", style: theme.textTheme.titleLarge),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "🔴 Live Odds",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                controller.oddsText.value,
                style: theme.textTheme.displaySmall,
              ),

              SizedBox(height: 24),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "📈 Odds Trend",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: true),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          getTitlesWidget:
                              (value, meta) => Text(
                                value.toStringAsFixed(1),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: kgrey,
                                ),
                              ),
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 32,
                          getTitlesWidget:
                              (value, meta) => Text(
                                value.toInt().toString(),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: kgrey,
                                ),
                              ),
                        ),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: controller.chartData,
                        isCurved: true,
                        barWidth: 2,
                        color: theme.colorScheme.primary,
                        dotData: FlDotData(show: false),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24),
              Text(
                "📷 Pitch/Scoreboard Image",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 8),
              controller.imagePath.isEmpty
                  ? Text(
                    kIsWeb
                        ? "This feature is not available on the web."
                        : "No image selected",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
                  )
                  : kIsWeb
                  ? Icon(Icons.image, size: 100, color: Colors.grey)
                  : Image.file(
                    File(controller.imagePath.value),
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),

              SizedBox(height: 16),
              Text(controller.stats.value, style: theme.textTheme.bodyLarge),

              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (!kIsWeb) {
                          controller.pickImage();
                        } else {
                          showCustomToast(
                            message: "Scoreboard data extraction is not available on web.",
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                      ),
                      child: Text(
                        "Upload Scoreboard Image",
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                  if (controller.imagePath.isNotEmpty) adjustWidth(10),
                  if (controller.imagePath.isNotEmpty)
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: controller.removeImage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.error,
                        ),
                        icon: Icon(Icons.delete, color: kblack),
                        label: Text(
                          "Remove Image",
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: kblack,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              adjustHieght(90.h),
            ],
          ),
        ),
      ),
    );
  }
}
