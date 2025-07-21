import 'package:distinct_assignment/application/presentation/screens/auth/login_screen.dart';
import 'package:distinct_assignment/application/presentation/screens/navbar/navbar_screen.dart';
import 'package:distinct_assignment/application/presentation/screens/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'routes.dart';

class RouteGenerator {
  static const Duration animationDuration = Duration(milliseconds: 500);
  // Route onGenerateRoute(RouteSettings settings) {}
  static final routes = [
    GetPage(name: Routes.initial, page: () => const ScreenSplash()),
    GetPage(
      name: Routes.login,
      page: () => const ScreenLoginPage(),
      transition: Transition.fadeIn,
      transitionDuration: animationDuration,
    ),

    GetPage(
      name: Routes.navbar,
      page: () => const ScreenNavBar(),
      transition: Transition.fadeIn,
      transitionDuration: animationDuration,
    ),
  ];
}
