import 'package:distinct_assignment/application/controller/match/match_controller.dart';
import 'package:distinct_assignment/application/presentation/widgets/loading_indecators/shimmer/shimmer_loader.dart';
import 'package:distinct_assignment/core/routes/routes.dart';
import 'package:distinct_assignment/core/utils/colors.dart';
import 'package:distinct_assignment/core/utils/const.dart';
import 'package:distinct_assignment/domain/model/match/series_info/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SeriesInfoList extends StatelessWidget {
  const SeriesInfoList({super.key});

  @override
  Widget build(BuildContext context) {
    final matchController = Get.find<MatchController>();

    return Obx(() {
      if (matchController.seriesInfoListLoading.value) {
        return ShimmerLoader(
          height: 150,
          itemCount: 10,
          width: double.infinity,
          seprator: adjustHieght(10),
        );
      }
      if (matchController.seriesInfoList.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              adjustHieght(30.h),
              Image.asset(messageTemplate, height: 300.h),
              adjustHieght(10.h),
              Text(
                'No series available at the moment',
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
          final match = matchController.seriesInfoList[index];

          return GestureDetector(
            onTap: () {
              matchController.fetchSeriesInfo(match.id ?? '');
              Get.toNamed(Routes.seriesDetail);
            },
            child: SeriesTile(match: match),
          );
        },
        itemCount: matchController.seriesInfoList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      );
    });
  }
}

class SeriesTile extends StatelessWidget {
  const SeriesTile({super.key, required this.match, this.isDetailPage = false});

  final Info match;
  final bool isDetailPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onTertiary,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ListTile(
        title: Text(
          match.name ?? 'Unknown Match',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Row(
          children: [
            Text(
              isDetailPage
                  ? match.startdate ?? match.startDate ?? 'N/A'
                  : match.startDate ?? 'N/A',
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(color: kgrey),
            ),
            adjustWidth(10),
            Text('-'),
            adjustWidth(10),
            Text(
              isDetailPage
                  ? match.enddate ?? match.endDate ?? 'N/A'
                  : match.endDate ?? 'N/A',
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(color: kgrey),
            ),
          ],
        ),
        // trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
