import 'package:distinct_assignment/application/controller/profile/profile_controller.dart';
import 'package:distinct_assignment/application/presentation/widgets/network_image/cached_network_image.dart';
import 'package:distinct_assignment/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePictureBuilder extends StatelessWidget {
  const ProfilePictureBuilder({super.key, this.radius = 40});
  final double radius;

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    return Obx(() {
      return CircleAvatar(
        backgroundColor: kprimary.withOpacity(0.5),
        radius: radius,
        child: NetworkImageWithLoader(
          profileController.userData.value.name ?? '',
          radius: 360,
          errorWidget: Text(
            profileController.userData.value.name
                    ?.substring(0, 2)
                    .toUpperCase() ??
                '!',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: 19.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    });
  }
}
