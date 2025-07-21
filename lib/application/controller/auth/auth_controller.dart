import 'package:distinct_assignment/application/controller/profile/profile_controller.dart';
import 'package:distinct_assignment/core/routes/routes.dart';
import 'package:distinct_assignment/core/utils/toast/custom_toast.dart';
import 'package:distinct_assignment/data/api_service/auth/auth_service.dart';
import 'package:distinct_assignment/data/local_storage_service/local_storage_pref_service.dart';
import 'package:distinct_assignment/domain/model/auth/login_modal/login_modal.dart';
import 'package:distinct_assignment/domain/model/auth/token_model/token_model.dart';
import 'package:distinct_assignment/domain/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo = AuthService();

  // login
  final TextEditingController loginEmailController = TextEditingController(
    text: 'eve.holt@reqres.in',
  );
  final TextEditingController loginPasswordController = TextEditingController(
    text: 'pistol',
  );
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
      Get.find<ProfileController>().getUserProfile();
      Get.offAndToNamed(Routes.navbar);
    } else {
      Get.offAndToNamed(Routes.login);
    }
  }

  /// login user using email and pasword
  void login() async {
    if (formKeyLogin.currentState?.validate() ?? false) {
      loginLoading.value = true;
      final loginModel = LoginModal(
        email: loginEmailController.text.trim(),
        password: loginPasswordController.text.trim(),
      );
      final response = await authRepo.login(loginModel: loginModel);
      if (response.success ?? false) {
        await LocalStoragePrefService.setLogin();
        await LocalStoragePrefService.saveTokens(
          tokenModel: response.data as TokenModel? ?? TokenModel(token: ''),
        );
        Get.find<ProfileController>().getUserProfile();
        Get.offAllNamed(Routes.navbar);
      } else {
        showCustomToast(message: response.error ?? 'Login failed');
      }
      loginLoading.value = false;
    }
  }
}
