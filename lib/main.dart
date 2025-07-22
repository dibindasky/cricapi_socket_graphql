import 'package:distinct_assignment/application/controller/theme/theme_controller.dart';
import 'package:distinct_assignment/core/dependency/binding/all_controller_binding.dart';
import 'package:distinct_assignment/core/dependency/di/dependency_injection.dart';
import 'package:distinct_assignment/core/routes/route_generator.dart';
import 'package:distinct_assignment/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await configuteInjection();
  runApp(const DistinctAssignmentApp());
}

class DistinctAssignmentApp extends StatelessWidget {
  const DistinctAssignmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: 'Assignment App',
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.noScaling),
            child: widget!,
          );
        },

        initialBinding: AllControllerBinding(),
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme(),
        darkTheme: AppThemes.darkTheme(),
        themeMode: themeController.themeMode,
        getPages: RouteGenerator.routes,
      ),
    );
  }
}
