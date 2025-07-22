import 'dart:io';
import 'package:distinct_assignment/application/controller/odd/odd_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

class ScreenOdds extends StatelessWidget {
  final controller = Get.put(OddController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
      title: Text(
        "Live Cricket Trading",
        style: theme.textTheme.titleLarge,
      ),
      ),
      body: SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Text(
          "🔴 Live Odds",
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          controller.oddsText.value,
          style: theme.textTheme.displaySmall,
        ),

        SizedBox(height: 24),
        Text(
          "📈 Odds Trend",
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: LineChart(LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
            spots: controller.chartData,
            isCurved: true,
            barWidth: 2,
            color: theme.colorScheme.primary,
            dotData: FlDotData(show: false),
            )
          ],
          )),
        ),

        SizedBox(height: 24),
        Text(
          "📷 Pitch/Scoreboard Image",
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        controller.imagePath.isEmpty
          ? Text(
            "No image selected",
            style: theme.textTheme.bodyMedium,
          )
          : Image.file(File(controller.imagePath.value), height: 200),

        SizedBox(height: 16),
        Text(
          controller.stats.value,
          style: theme.textTheme.bodyLarge,
        ),

        SizedBox(height: 16),
        ElevatedButton(
          onPressed: controller.pickImage,
          child: Text(
          "Upload Scoreboard Image",
          style: theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.onPrimary),
          ),
          style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          ),
        ),
        ],
      )),
      ),
    );
  }
}
