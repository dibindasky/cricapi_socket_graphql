import 'dart:io';

import 'package:distinct_assignment/application/controller/navbar/navbar_controller.dart';
import 'package:distinct_assignment/application/presentation/screens/cricket/cricket_home_screen.dart';
import 'package:distinct_assignment/application/presentation/screens/navbar/widgets/custom_navbar.dart';
import 'package:distinct_assignment/application/presentation/screens/navbar/widgets/exit_dialoge.dart';
import 'package:distinct_assignment/application/presentation/screens/odds/odd_screen.dart';
import 'package:distinct_assignment/application/presentation/screens/profile/profile_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenNavBar extends StatelessWidget {
  const ScreenNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavbarController>();
    List<Widget> screens = [ScreenCricketHome(), ScreenOdds(), ScreenProfile()];
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        } else {
          if (kIsWeb) {
            return;
          } else if (controller.selectedIndex.value == 1 ||
              controller.selectedIndex.value == 2 ||
              controller.selectedIndex.value == 3) {
            controller.chageBottomBarIndex(0);
          } else {
            showExitDialog(context);
          }
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Obx(() {
                return screens[controller.selectedIndex.value];
              }),
              CustomBottomNavBar(),
            ],
          ),
        ),
        // bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}
