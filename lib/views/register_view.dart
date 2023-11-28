import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trust_edge_task/controllers/register_controller.dart';
import 'package:trust_edge_task/routes.dart';
import 'package:trust_edge_task/shared/constants.dart';
import 'package:trust_edge_task/shared/shared_functions.dart';
import 'package:trust_edge_task/shared/shared_widgets.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({super.key});

  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 30),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Form(
              key: registerController.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  appLogoAndTitle(text: "Register"),
                  defaultSizedBox(height: 50),
                  defaultTextFormField(
                    textEditingController:
                        registerController.fullNameEditingController.value,
                    hintText: "Full Name",
                    validator: (name) => validateName(name),
                  ),
                  Obx(
                    () => defaultTextFormField(
                      textEditingController:
                          registerController.phoneEditingController.value,
                      hintText: "55994435",
                      keyboardType: TextInputType.phone,
                      prefixIcon: countryCodePicker(
                        onChanged: (countryCode) => registerController
                            .changeCountryCode(countryCode.dialCode ?? "+971"),
                      ),
                      validator: (phoneNumber) =>
                          validatePhoneNumber(phoneNumber),
                    ),
                  ),
                  defaultTextFormField(
                    textEditingController:
                        registerController.emailEditingController.value,
                    hintText: "Email Address",
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) => validateEmail(email),
                  ),
                  Obx(
                    () => defaultTextFormField(
                      textEditingController:
                          registerController.passwordEditingController.value,
                      hintText: "Password",
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: registerController.passwordVisible.value,
                      isPassword: true,
                      suffixPressed: () =>
                          registerController.passwordSuffixPressed(),
                      suffixIcon: registerController.passwordVisible.value
                          ? Icons.visibility_sharp
                          : Icons.visibility_off,
                      validator: (password) => validatePassword(password),
                    ),
                  ),
                  Obx(
                    () => defaultTextFormField(
                      textEditingController: registerController
                          .confirmPasswordEditingController.value,
                      hintText: "Confirm Password",
                      keyboardType: TextInputType.visiblePassword,
                      obscureText:
                          registerController.confirmPasswordVisible.value,
                      isPassword: true,
                      suffixPressed: () =>
                          registerController.confirmPasswordSuffixPressed(),
                      suffixIcon:
                          registerController.confirmPasswordVisible.value
                              ? Icons.visibility_sharp
                              : Icons.visibility_off,
                      validator: (confirmPassword) => registerController
                          .validateConfirmPassword(confirmPassword),
                    ),
                  ),
                  defaultSizedBox(height: 20),
                  defaultButton(
                      btnText: "Register",
                      onTap: () async=> await registerController.validateUserRegister(),
                      backgroundColor: darkPurpleColor,
                      textColor: whiteColor),
                  defaultSizedBox(height: 20),
                  defaultQuestionTextButton(
                      questionText: "Already have an account?",
                      btnText: "Login",
                      onPressed: () {
                        pushReplacementRoute(routeName: AppRoutes.login);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
