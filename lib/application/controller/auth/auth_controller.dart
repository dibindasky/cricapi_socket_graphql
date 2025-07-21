import 'package:distinct_assignment/core/routes/routes.dart';
import 'package:distinct_assignment/data/local_storage_service/local_storage_pref_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // login
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final formKeyLogin = GlobalKey<FormState>();

  RxBool saveLoginInfo = false.obs;

  /// login loading value
  RxBool loginLoading = false.obs;

  /// change remember me
  void changeRememberMe(bool value) {
    saveLoginInfo.value = value;
  }

  /// check user login or not and show the appropriate screen
  void chekuserLoginAndShowScreen() async {
    final userLogin = await LocalStoragePrefService.getLogin();
    if (userLogin) {
      Get.offAndToNamed(Routes.navbar);
    } else {
      Get.offAndToNamed(Routes.login);
    }
  }

  /// login user using email and pasword
  void login() async {
    if (formKeyLogin.currentState?.validate() ?? false) {
      loginLoading.value = true;
      await Future.delayed(Duration(seconds: 2));
      loginLoading.value = false;
      Get.offAllNamed(Routes.navbar);
    }
  }
}
