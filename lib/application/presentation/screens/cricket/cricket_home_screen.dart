import 'package:distinct_assignment/application/controller/match/match_controller.dart';
import 'package:distinct_assignment/application/controller/profile/profile_controller.dart';
import 'package:distinct_assignment/application/presentation/screens/cricket/widget/current_match_list.dart';
import 'package:distinct_assignment/application/presentation/screens/cricket/widget/series_info_list.dart';
import 'package:distinct_assignment/application/presentation/screens/profile/widgets/profile_picture_builder.dart';
import 'package:distinct_assignment/core/utils/colors.dart';
import 'package:distinct_assignment/core/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ScreenCricketHome extends StatelessWidget {
  const ScreenCricketHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _homeAppbar(context),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              adjustHieght(10.h),
              TabBar(
                dividerColor: knill,
                labelColor: Theme.of(context).colorScheme.primary,
                unselectedLabelColor: kgrey,
                indicatorColor: Theme.of(context).colorScheme.primary,
                tabs: [
                  _createTabHeadlline(context, 'Current Matches'),
                  _createTabHeadlline(context, 'Series'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    RefreshIndicator(
                      onRefresh: () async {
                        Get.find<ProfileController>().getUserProfile();
                        Get.find<MatchController>().fetchCurrentMatches();
                      },
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [CurrentMatchesList(), adjustHieght(90.h)],
                        ),
                      ),
                    ),
                    RefreshIndicator(
                      onRefresh: () async {
                        Get.find<MatchController>().fetchSeriesInfoList();
                      },
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [SeriesInfoList(), adjustHieght(90.h)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Tab _createTabHeadlline(BuildContext context, String title) {
    return Tab(
      child: Text(
        title,
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  AppBar _homeAppbar(BuildContext context) {
    final profileController = Get.find<ProfileController>();

    return AppBar(
      actions: [
        // notification button
        GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              Container(
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: klightgrey),
                  color: Theme.of(context).colorScheme.onTertiary,
                ),
                child: const Center(
                  child: Icon(Iconsax.notification, size: 22),
                ),
              ),
            ],
          ),
        ),
        adjustWidth(15.w),
      ],
      centerTitle: false,
      title: GestureDetector(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Text(
                'Hi, ${profileController.userData.value.name ?? 'User'}',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            Obx(
              () => Text(
                profileController.userData.value.username ?? '',
                style: Theme.of(
                  context,
                ).textTheme.displaySmall?.copyWith(color: kgrey),
              ),
            ),
          ],
        ),
      ),
      leadingWidth: 70,
      leading: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                adjustWidth(20),
                const ProfilePictureBuilder(radius: 25),
              ],
            ),
          );
        },
      ),
    );
  }
}
