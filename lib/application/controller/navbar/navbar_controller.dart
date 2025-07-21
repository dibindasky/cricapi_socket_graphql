import 'package:get/get.dart';

class NavbarController extends GetxController {
  /// selected bottom bar index
  RxInt selectedIndex = 0.obs;

  /// change the selected bottom bar index
  void chageBottomBarIndex(int index) {
    selectedIndex.value = index;
  }
}
