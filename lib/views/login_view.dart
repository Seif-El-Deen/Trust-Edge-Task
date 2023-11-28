import 'package:flutter/material.dart';
import 'package:trust_edge_task/controllers/login_controller.dart';
import 'package:trust_edge_task/routes.dart';
import 'package:trust_edge_task/shared/constants.dart';
import 'package:trust_edge_task/shared/shared_functions.dart';
import 'package:trust_edge_task/shared/shared_widgets.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController>   {
  LoginView({super.key});

  final LoginController loginController = Get.put(LoginController());

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
              key: loginController.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  defaultSizedBox(height: 20),
                  appLogoAndTitle(text: "Login"),
                  defaultSizedBox(height: 50),
                  defaultTextFormField(
                    textEditingController:
                        loginController.emailEditingController.value,
                    hintText: "Email Address",

                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => validateEmail(value),
                  ),
                  Obx(() => defaultTextFormField(
                    textEditingController:
                    loginController.passwordEditingController.value,
                    suffixPressed: () {
                      // print("Suffix Pressed");
                      // print(loginController.passwordVisible.value);
                      loginController.suffixPressed();
                    },
                    hintText: "Password",
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !loginController.passwordVisible.value,
                    isPassword: true,
                    suffixIcon: loginController.passwordVisible.value? Icons.visibility_sharp:Icons.visibility_off,
                    validator: (value) =>validatePassword(value),
                  ),),
                  defaultSizedBox(height: 20),
                  defaultButton(
                      btnText: "Login",
                      onTap: () => loginController.validateUserLogin(),
                      backgroundColor: darkPurpleColor,
                      textColor: whiteColor),
                  defaultSizedBox(height: 20),
                  defaultQuestionTextButton(
                      questionText: "Don't have an account?",
                      btnText: "Register",
                      onPressed: () {
                        pushReplacementRoute(routeName: AppRoutes.register);
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
