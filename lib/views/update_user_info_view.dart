import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trust_edge_task/controllers/update_user_information_controller.dart';
import 'package:trust_edge_task/shared/constants.dart';
import 'package:trust_edge_task/shared/shared_functions.dart';
import 'package:trust_edge_task/shared/shared_widgets.dart';

class UpdateUserInfoView extends GetView<UpdateUserInformationController> {
  UpdateUserInfoView({super.key});

  final UpdateUserInformationController updateController =
      Get.put(UpdateUserInformationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "Update Information"),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 30),
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Form(
              key: updateController.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  defaultTextFormField(
                    textEditingController:
                        updateController.fullNameEditingController.value,
                    validator: (fullName) => validateName(fullName),

                  ),
                  defaultTextFormField(
                    textEditingController:
                        updateController.phoneNumberEditingController.value,
                    validator: (phoneNumber) =>
                        validatePhoneNumber(phoneNumber),

                    keyboardType: TextInputType.phone,
                      prefixIcon: countryCodePicker(
                        onChanged: (countryCode) => updateController
                            .changeCountryCode(countryCode.dialCode ),
                      )
                  ),
                  defaultTextFormField(
                      textEditingController:
                          updateController.emailEditingController.value,

                      keyboardType: TextInputType.emailAddress),
                  defaultButton(
                      btnText: "Save",
                      onTap: () =>
                          updateController.validateUserUpdateInformation(),
                      backgroundColor: darkPurpleColor,
                      textColor: whiteColor),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
