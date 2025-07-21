import 'package:animate_do/animate_do.dart';
import 'package:distinct_assignment/application/controller/auth/auth_controller.dart';
import 'package:distinct_assignment/core/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _navigate(context);
      },
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInUpBig(
              child: SizedBox(
                width: 200.w,
                child: Hero(tag: appLogo, child: Image.asset(appLogo)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigate(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 2000), () {
      Get.find<AuthController>().chekuserLoginAndShowScreen();
    });
  }
}
