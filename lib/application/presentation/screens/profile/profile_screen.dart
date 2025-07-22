import 'package:distinct_assignment/application/controller/profile/profile_controller.dart';
import 'package:distinct_assignment/application/presentation/screens/profile/widgets/profile_picture_builder.dart';
import 'package:distinct_assignment/application/presentation/widgets/loading_indecators/loading_animations.dart';
import 'package:distinct_assignment/application/presentation/widgets/loading_indecators/shimmer/shimmer_loader.dart';
import 'package:distinct_assignment/core/utils/colors.dart';
import 'package:distinct_assignment/core/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(() {
          if (profileController.prfileDetailLoading.value) {
            return LoadingBallRotateChaseAnimation(
              colors: [klightgrey],
              width: 60.h,
            );
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                adjustWidth(double.infinity),

                /// name and profile pic
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    adjustHieght(20.h),
                    const ProfilePictureBuilder(),
                    adjustHieght(10),
                    Obx(
                      () => Text(
                        profileController.userData.value.name ?? '',
                        style: Theme.of(
                          context,
                        ).textTheme.displaySmall?.copyWith(fontSize: 22.sp),
                      ),
                    ),
                    adjustHieght(3),
                    Obx(
                      () => Text(
                        profileController.userData.value.username ?? '',
                        style: Theme.of(
                          context,
                        ).textTheme.labelSmall?.copyWith(color: kgrey),
                      ),
                    ),
                    adjustHieght(30.h),
                  ],
                ),

                /// Personal informations
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profile Information',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    _OptionsListTile(
                      label: 'Email',
                      subLabel: profileController.userData.value.email ?? '',
                      onTap: () {},
                    ),
                    _OptionsListTile(
                      label: 'Phone',
                      subLabel: profileController.userData.value.phone ?? '',
                      onTap: () {},
                    ),
                    _OptionsListTile(
                      label: 'Website',
                      subLabel: profileController.userData.value.website ?? '',
                      onTap: () {},
                    ),
                  ],
                ),

                /// address
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    adjustHieght(20),
                    Text(
                      'Address',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    _OptionsListTile(
                      label: 'Street',
                      subLabel:
                          profileController.userData.value.address?.street ??
                          '',
                      onTap: () {},
                    ),
                    _OptionsListTile(
                      label: 'City',
                      subLabel:
                          profileController.userData.value.address?.city ?? '',
                      onTap: () {},
                    ),
                    _OptionsListTile(
                      label: 'Zip Code',
                      subLabel:
                          profileController.userData.value.address?.zipcode ??
                          '',
                      onTap: () {},
                    ),
                  ],
                ),

                /// app settings and policy
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    adjustHieght(20),
                    Text(
                      'App',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    _OptionsListTile(label: 'Privacy Policy', onTap: () {}),
                    _OptionsListTile(label: 'Delete Account', onTap: () {}),
                    _OptionsListTile(
                      label: 'Logout',
                      onTap: () {
                        profileController.logout();
                      },
                    ),
                  ],
                ),
                adjustHieght(50.h),
              ],
            ),
          );
        }),
      ),
    );
  }
}

/// options list tile commen for personal and app sections
class _OptionsListTile extends StatelessWidget {
  const _OptionsListTile({
    required this.label,
    required this.onTap,
    this.subLabel,
  });

  final Function onTap;
  final String label;
  final String? subLabel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: Theme.of(
                    context,
                  ).textTheme.displaySmall?.copyWith(fontSize: 14.sp),
                ),
                if (subLabel != null)
                  Text(
                    subLabel!,
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall?.copyWith(color: kgrey),
                  )
                else
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: klightgrey),
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
                    child: const Icon(
                      Iconsax.arrow_right_3,
                      color: kblack,
                      size: 16,
                    ),
                  ),
              ],
            ),
          ),
          adjustHieght(0.h),
        ],
      ),
    );
  }
}

/// tile with switches
class _SwitchTile extends StatelessWidget {
  const _SwitchTile({
    required this.label,
    required this.onChanged,
    required this.value,
  });

  final String label;
  final bool value;
  final Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(fontSize: 14.sp),
          ),
          Switch(value: value, onChanged: (value) {}),
        ],
      ),
    );
  }
}
