import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trust_edge_task/controllers/api_controller.dart';
import 'package:trust_edge_task/models/user_model.dart';
import 'package:trust_edge_task/routes.dart';
import 'package:trust_edge_task/shared/shared_functions.dart';

class RegisterController extends GetxController {
  Rx<TextEditingController> fullNameEditingController =
      TextEditingController().obs;

  Rx<TextEditingController> countryCodeEditingController =
      TextEditingController(text: "+971").obs;

  Rx<TextEditingController> phoneEditingController =
      TextEditingController().obs;

  Rx<TextEditingController> emailEditingController =
      TextEditingController().obs;

  Rx<TextEditingController> passwordEditingController =
      TextEditingController().obs;

  Rx<TextEditingController> confirmPasswordEditingController =
      TextEditingController().obs;

  var passwordVisible = true.obs;
  var confirmPasswordVisible = true.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void passwordSuffixPressed() {
    passwordVisible.value = !passwordVisible.value;
  }

  void confirmPasswordSuffixPressed() {
    confirmPasswordVisible.value = !confirmPasswordVisible.value;
  }


  String? validateConfirmPassword(String? confirmPassword) {
    if (confirmPassword!.isEmpty) {
      return "Please enter password greater than 5 characters";
    } else if (confirmPassword != passwordEditingController.value.text) {
      return "Don't match with the password";
    }

    return null;
  }

  void changeCountryCode (String countryCode){
    countryCodeEditingController.value.text = countryCode;
  }


  Future<void> validateUserRegister() async{
    if (formKey.currentState!.validate()) {
      closeKeyboard();

      // print(fullNameEditingController.value.text);


      //call the api to register the user
      await ApiController.registerUser(
          name: fullNameEditingController.value.text.toString(),
          email: emailEditingController.value.text.toString(),
          phone: phoneEditingController.value.text.toString(),
          password: passwordEditingController.value.text.toString(),
          countryCode: countryCodeEditingController.value.text.toString(),
          passwordConfirm: confirmPasswordEditingController.value.text.toString()).then((value) {
        // todo give the user unique id

        UserModel.user = UserModel(
          id: -1,
          fullName: fullNameEditingController.value.text,
          phoneNumber: phoneEditingController.value.text,
          countryCode: countryCodeEditingController.value.text,
          emailAddress: emailEditingController.value.text,
          password: passwordEditingController.value.text,
        );
        //navigate to the Home View
        pushRoute(routeName: AppRoutes.home);
      });

    }
  }
}
