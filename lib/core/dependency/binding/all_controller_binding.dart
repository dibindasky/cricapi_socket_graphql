import 'package:distinct_assignment/application/controller/auth/auth_controller.dart';
import 'package:distinct_assignment/application/controller/match/match_controller.dart';
import 'package:distinct_assignment/application/controller/navbar/navbar_controller.dart';
import 'package:distinct_assignment/application/controller/profile/profile_controller.dart';
import 'package:get/get.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    // Registering controllers with GetX dependency injection
    Get.put(AuthController(), permanent: true);
    Get.put(NavbarController(), permanent: true);
    Get.put(ProfileController(), permanent: true);
    Get.put(MatchController(), permanent: true);
  }
}
