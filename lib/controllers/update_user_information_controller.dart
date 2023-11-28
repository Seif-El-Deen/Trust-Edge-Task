import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trust_edge_task/controllers/api_controller.dart';
import 'package:trust_edge_task/models/user_model.dart';
import 'package:trust_edge_task/shared/shared_functions.dart';

class UpdateUserInformationController extends GetxController {
  Rx<TextEditingController> fullNameEditingController =
      TextEditingController(text: UserModel.user?.fullName).obs;
  Rx<TextEditingController> countryCodeEditingController =
      TextEditingController().obs;

  Rx<TextEditingController> phoneNumberEditingController =
      TextEditingController(text: UserModel.user?.phoneNumber).obs;
  Rx<TextEditingController> emailEditingController =
      TextEditingController(text: UserModel.user?.emailAddress).obs;


  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  void changeCountryCode (String? countryCode){
    countryCodeEditingController.value.text = countryCode!;
  }


  void validateUserUpdateInformation() {
    if (formKey.currentState!.validate()) {
      closeKeyboard();

      //call the api to update  the user data
      ApiController.updateUser(name: fullNameEditingController.value.text,
          email: emailEditingController.value.text,
          phone: phoneNumberEditingController.value.text,
          countryCode: countryCodeEditingController.value.text==""?"+971":countryCodeEditingController.value.text).then((value) {
        UserModel.user?.fullName = fullNameEditingController.value.text;
        UserModel.user?.phoneNumber = phoneNumberEditingController.value.text;
        UserModel.user?.emailAddress = emailEditingController.value.text;
      });
      //navigate to the Home View
      pop();
      showSnackBar(
          title: "Success",
          body: "your information is updated successfully");
    }
  }
}
