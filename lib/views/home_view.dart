import 'package:flutter/material.dart';
import 'package:trust_edge_task/models/user_model.dart';
import 'package:trust_edge_task/routes.dart';
import 'package:trust_edge_task/shared/shared_functions.dart';
import 'package:trust_edge_task/shared/shared_widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "Home Page"),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 30),
        child: Column(
          children: [
            homeViewDetailsItem(
                icon: Icons.person_2_outlined, detailsText: UserModel.user!.fullName),
            homeViewDetailsItem(
                icon: Icons.phone_android, detailsText: "${UserModel.user!.countryCode} \t${UserModel.user!.phoneNumber}"),
            homeViewDetailsItem(
                icon: Icons.mail_outline, detailsText: UserModel.user!.emailAddress),
            homeViewButton(
                btnText: "Update Information",
                onTap: () {
                  pushRoute(routeName: AppRoutes.updateUserInformation);
                }),
            homeViewButton(btnText: "Change Password", onTap: () {}),
            homeViewButton(btnText: "Delete Account", onTap: () {}),
            homeViewButton(btnText: "Logout", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
