import 'package:flutter/material.dart';
import 'package:trust_edge_task/controllers/navigation_controller.dart';
import 'package:trust_edge_task/routes.dart';
import 'package:trust_edge_task/shared/constants.dart';
import 'package:trust_edge_task/shared/shared_widgets.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 30),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              appLogoAndTitle(text: "Welcome to the app"),
              const Spacer(),
              defaultButton(
                  btnText: "Login",
                  onTap: () {
                    NavigationController.pushRoute(
                      routeName: AppRoutes.login,
                    );
                  },
                  backgroundColor: darkPurpleColor,
                  textColor: whiteColor),
              defaultButton(
                  btnText: "Register",
                  onTap: () {
                    NavigationController.pushRoute(routeName: AppRoutes.register);
                  },
                  backgroundColor: whiteColor,
                  textColor: darkPurpleColor),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
