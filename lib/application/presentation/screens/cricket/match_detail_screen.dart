import 'package:distinct_assignment/application/controller/match/match_controller.dart';
import 'package:distinct_assignment/application/presentation/screens/cricket/widget/match_card.dart';
import 'package:distinct_assignment/application/presentation/widgets/custom_widgets/text_from_field.dart';
import 'package:distinct_assignment/core/utils/colors.dart';
import 'package:distinct_assignment/core/utils/const.dart';
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
            children: [
              MatchCard(match: matchController.currentMatch.value),
              const SizedBox(height: 20),
              CustomTextFormField(
                labelText: 'Search Player',
                onChanaged: (value) {
                  matchController.searchPlayer(value);
                },
              ),adjustHieght(10),
              Expanded(
                child: Obx(() {
                  if (matchController.playerSearchListLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (matchController.playerSearchList.isEmpty) {
                    return const Center(child: Text('No players found'));
                  }
                  return ListView.builder(
                    itemCount: matchController.playerSearchList.length,
                    itemBuilder: (context, index) {
                      final player = matchController.playerSearchList[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: kprimary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          title: Text(
                            player.name ?? 'Unknown Player',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          subtitle: Text(
                            player.country ?? 'Unknown Country',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: kprimary.withOpacity(0.7)),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
