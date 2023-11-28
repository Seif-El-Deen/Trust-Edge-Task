import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trust_edge_task/controllers/api_controller.dart';
import 'package:trust_edge_task/models/user_model.dart';
import 'package:trust_edge_task/routes.dart';
import 'package:trust_edge_task/shared/shared_functions.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> emailEditingController =
      TextEditingController().obs;
  Rx<TextEditingController> passwordEditingController =
      TextEditingController().obs;

  var passwordVisible = true.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void suffixPressed() {
    passwordVisible.value = !passwordVisible.value;
  }

  void validateUserLogin() {
    if (formKey.currentState!.validate()) {
      closeKeyboard();

      ApiController.loginUser(
              email: emailEditingController.value.text,
              password: passwordEditingController.value.text)
          .then((value) {
        //todo: assign the data to the user
        // todo get the user unique id
        // todo get the user fullName, phoneNumber before login

        UserModel.user = UserModel(
          id: -1,
          fullName: value["name"],
          phoneNumber: value["phone"],
          countryCode: value["country_code"],
          emailAddress: emailEditingController.value.text,
          password: passwordEditingController.value.text,
        );

        pushReplacementRoute(routeName: AppRoutes.home);
      });
    }
  }
}
