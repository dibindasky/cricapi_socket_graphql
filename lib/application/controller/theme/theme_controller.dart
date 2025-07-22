import 'package:distinct_assignment/data/local_storage_service/local_storage_pref_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppThemeMode { system, light, dark }

class ThemeController extends GetxController {
  final Rx<AppThemeMode> currentTheme = AppThemeMode.system.obs;
  final RxString themeModeString = 'Same as device settings'.obs;

  @override
  onInit() {
    super.onInit();
    loadTheme();
  }

  ThemeMode get themeMode {
    switch (currentTheme.value) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> loadTheme() async {
    final saved = await LocalStoragePrefService.getThemeMode();

    switch (saved) {
      case 'light':
        currentTheme.value = AppThemeMode.light;
        break;
      case 'dark':
        currentTheme.value = AppThemeMode.dark;
        break;
      default:
        currentTheme.value = AppThemeMode.system;
    }

    Get.changeThemeMode(themeMode);
  }

  Future<void> setTheme(AppThemeMode mode) async {
    currentTheme.value = mode;
    Get.changeThemeMode(themeMode);
    themeModeString.value =
        mode == AppThemeMode.system
            ? "Same as device settings"
            : mode.toString().split('.').last;
    await LocalStoragePrefService.setThemeMode(mode.toString().split('.').last);
  }
}
