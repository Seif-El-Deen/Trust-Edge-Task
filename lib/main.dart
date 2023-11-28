import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trust_edge_task/controllers/api_controller.dart';
import 'package:trust_edge_task/controllers/login_controller.dart';
import 'package:trust_edge_task/controllers/register_controller.dart';
import 'package:trust_edge_task/controllers/update_user_information_controller.dart';
import 'package:trust_edge_task/routes.dart';
import 'package:trust_edge_task/shared/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Trust Edge Task',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: darkPurpleColor,
          foregroundColor: whiteColor,
        ),
        scaffoldBackgroundColor: Colors.white,
        // Set the main background color
        primaryColor: darkPurpleColor,
        colorScheme: ColorScheme.fromSeed(seedColor: whiteColor),
        fontFamily: 'AlexandriaFLF',
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.welcome,
      getPages: AppRoutes.routes,
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<ApiController>(() => ApiController());
        Get.lazyPut<LoginController>(() => LoginController());
        Get.lazyPut<RegisterController>(() => RegisterController());
        Get.lazyPut<UpdateUserInformationController>(() => UpdateUserInformationController());
      }),
    );
  }
}
