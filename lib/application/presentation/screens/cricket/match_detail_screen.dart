import 'package:distinct_assignment/application/controller/match/match_controller.dart';
import 'package:distinct_assignment/application/presentation/screens/cricket/widget/match_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchDetailScreen extends StatelessWidget {
  const MatchDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final matchController = Get.find<MatchController>();

    return PopScope(
      onPopInvokedWithResult: (_, _) {
        matchController.cancelDetailTimer();
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Match Details')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [MatchCard(match: matchController.currentMatch.value)],
          ),
        ),
      ),
    );
  }
}
