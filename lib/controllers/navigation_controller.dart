import 'package:get/get.dart';

class NavigationController extends GetxController{


  static void pushRoute({required String routeName}) {
    Get.toNamed(routeName);
  }

// void pushOff({required Widget screen}) {
//   Get.off(screen);
// }

  static void pushReplacementRoute({required String routeName}) {
    Get.offAllNamed(routeName);
  }

  static void pop() {
    Get.back();
  }



}