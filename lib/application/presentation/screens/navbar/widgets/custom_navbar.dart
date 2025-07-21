import 'package:animate_do/animate_do.dart';
import 'package:distinct_assignment/application/controller/navbar/navbar_controller.dart';
import 'package:distinct_assignment/core/utils/colors.dart';
import 'package:distinct_assignment/core/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavbarController>();

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 0),
        decoration: BoxDecoration(
          color: kblack,
          borderRadius: kBorderRadius12,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
            child: Obx(() {
              final labels = ['Home', 'Dealers', 'Sales Target', 'Profile'];
              final currentSelectedIcons = [
                Icons.home_filled,
                Iconsax.personalcard5,
                Iconsax.graph5,
                Icons.person,
              ];
              final currentIcons = [
                Icons.home_outlined,
                Iconsax.personalcard,
                Iconsax.graph,
                Icons.person_outline,
              ];
              return GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Theme.of(context).colorScheme.onPrimary,
                iconSize: 24,
                tabBorderRadius: 10,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
                duration: animationDuration,
                tabBackgroundColor: Theme.of(context).colorScheme.primary,
                tabs: List.generate(labels.length, (index) {
                  bool isSelected = index == controller.selectedIndex.value;
                  return GButton(
                    iconColor: Theme.of(context).colorScheme.secondary,
                    icon:
                        isSelected
                            ? currentSelectedIcons[index]
                            : currentIcons[index],
                    text: labels[index],
                    leading:
                        isSelected
                            ? FlipInX(
                              animate: true,
                              child: Icon(
                                currentSelectedIcons[index],
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                            )
                            : Icon(
                              currentIcons[index],
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                    textStyle: Theme.of(
                      context,
                    ).textTheme.displayMedium?.copyWith(fontSize: 10.sp),
                  );
                }),
                selectedIndex: controller.selectedIndex.value,
                onTabChange: (index) {
                  controller.chageBottomBarIndex(index);
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
