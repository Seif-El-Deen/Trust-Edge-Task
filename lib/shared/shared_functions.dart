import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trust_edge_task/shared/constants.dart';

void pushRoute({required String routeName}) {
  Get.toNamed(routeName);
}

// void pushOff({required Widget screen}) {
//   Get.off(screen);
// }

void pushReplacementRoute({required String routeName}) {
  Get.offNamed(routeName);
}

void pop() {
  Get.back();
}


void closeKeyboard(){
  Get.focusScope?.unfocus();

}




void showSnackBar({
  required String title,
  required String body,
}) {
  Get.snackbar(
    title,
    body,
    colorText: whiteColor,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green,
    borderRadius: 20,
    margin: const EdgeInsets.all(10),
    duration: const Duration(seconds: 2),
    isDismissible: true, // Set to false if you want the user to wait until it disappears
    // dismissDirection: SnackDismissDirection.HORIZONTAL,
    forwardAnimationCurve: Curves.easeInOut,
    reverseAnimationCurve: Curves.easeInOut,
    animationDuration: const Duration(milliseconds: 200),
    // backgroundGradient:
    // const LinearGradient(colors: [Colors.red, Colors.blue]), // Example gradient
    // boxShadows: [
    //   const BoxShadow(
    //     color: Colors.black45,
    //     offset: Offset(0, 2),
    //     blurRadius: 4.0,
    //   ),
    // ],
  );
}




String? validateEmail(String? email) {
  if (!(email!.contains("@") && email.contains("."))) {
    return "Please enter a valid email";
  }

  return null;
}


String? validatePassword(String? password) {
  if (password!.length < 5) {
    return "Please enter password greater than 5 characters";
  }

  return null;
}

String? validatePhoneNumber(String? phoneNumber) {
  if (phoneNumber!.length != 7) {
    return "Please enter a valid phone number";
  }

  return null;
}


String? validateName(String? name) {
  if (name!.length < 3 ||
      name.contains("@") ||
      name.contains("#") ||
      name.contains("\$") ||
      name.contains("&") ||
      name.contains("!") ||
      name.contains("%")) {
    return "Full name must be > 3 characters must not contain !@#\$%&";
  }

  return null;
}