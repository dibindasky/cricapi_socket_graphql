import 'package:animate_do/animate_do.dart';
import 'package:distinct_assignment/application/controller/match/match_controller.dart';
import 'package:distinct_assignment/application/presentation/screens/cricket/widget/series_info_list.dart';
import 'package:distinct_assignment/application/presentation/widgets/loading_indecators/loading_animations.dart';
import 'package:distinct_assignment/core/utils/colors.dart';
import 'package:distinct_assignment/core/utils/const.dart';
import 'package:distinct_assignment/domain/model/match/series_info/info.dart';
import 'package:distinct_assignment/domain/model/match/series_info/match_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SeriesDetailScreen extends StatelessWidget {
  const SeriesDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final matchController = Get.find<MatchController>();

    return PopScope(
      onPopInvokedWithResult: (_, _) {
        matchController.cancelDetailTimer();
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Series Details')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Obx(() {
            if (matchController.seriesInfoLoading.value) {
              return Center(child: LoadingLineSpinFadeLoaderAnimation());
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SeriesTile(
                  match: matchController.seriesInfo.value.info ?? Info(),
                  isDetailPage: true,
                ),
                adjustHieght(10.h),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final matchList =
                          matchController.seriesInfo.value.matchList ?? [];
                      if (constraints.maxWidth > 600) {
                        // Use GridView for wider screens
                        int crossAxisCount = constraints.maxWidth > 900 ? 3 : 2;
                        return GridView.builder(
                          itemCount: matchList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 2.8,
                              ),
                          itemBuilder: (context, index) {
                            final match = matchList[index];
                            return _matchTile(index, context, match);
                          },
                        );
                      } else {
                        // Use ListView for smaller screens
                        return ListView.builder(
                          itemCount: matchList.length,
                          itemBuilder: (context, index) {
                            final match = matchList[index];
                            return _matchTile(index, context, match);
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  SlideInRight _matchTile(int index, BuildContext context, MatchList? match) {
    return SlideInRight(
      from: 350,
      delay: Duration(milliseconds: 10 * index),
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            isThreeLine: true,
            titleAlignment: ListTileTitleAlignment.top,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            leading: FittedBox(
              child: Column(
                children: [
                  Text(
                    index + 1 == 1 ? '1st Match' : '${index + 1}th Match',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Tada(
                    delay: animationDuration * index,
                    child: Icon(Icons.sports_cricket, size: 36, color: kprimary),
                  ),
                ],
              ),
            ),
            title: Text(
              match?.name ?? 'Match Name',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4),
                Text(
                  'Date: ${match?.date ?? 'N/A'}',
                  style: Theme.of(
                    context,
                  ).textTheme.displaySmall?.copyWith(fontSize: 13),
                ),
                SizedBox(height: 2),
                Text(
                  'Venue: ${match?.venue ?? 'N/A'}',
                  style: Theme.of(
                    context,
                  ).textTheme.displaySmall?.copyWith(fontSize: 13),
                ),
              ],
            ),
            // trailing: Icon(Icons.arrow_forward_ios, size: 18),
          ),
        ),
      ),
    );
  }
}
