import 'package:distinct_assignment/application/controller/match/match_controller.dart';
import 'package:distinct_assignment/application/presentation/screens/cricket/widget/match_card.dart';
import 'package:distinct_assignment/application/presentation/widgets/loading_indecators/shimmer/shimmer_loader.dart';
import 'package:distinct_assignment/core/routes/routes.dart';
import 'package:distinct_assignment/core/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CurrentMatchesList extends StatelessWidget {
  const CurrentMatchesList({super.key});

  @override
  Widget build(BuildContext context) {
    final matchController = Get.find<MatchController>();

    return Obx(() {
      if (matchController.currentMatchLoading.value) {
        return ShimmerLoader(
          height: 150,
          itemCount: 10,
          width: double.infinity,
          seprator: adjustHieght(10),
        );
      }
      if (matchController.currentMatches.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              adjustHieght(30.h),
              Image.asset(messageTemplate, height: 300.h),
              adjustHieght(10.h),
              Text(
                'No matches available at the moment',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }
      return ListView.builder(
        itemBuilder: (context, index) {
          final match = matchController.currentMatches[index];

          return GestureDetector(
            onTap: () {
              matchController.fetchMatchDetail(match.id ?? '', match: match);
              Get.toNamed(Routes.matchDetail);
            },
            child: MatchCard(match: match),
          );
        },
        itemCount: matchController.currentMatches.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      );
    });
  }
}
