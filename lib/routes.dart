import 'package:get/get.dart';
import 'package:trust_edge_task/views/home_view.dart';
import 'package:trust_edge_task/views/login_view.dart';
import 'package:trust_edge_task/views/register_view.dart';
import 'package:trust_edge_task/views/update_user_info_view.dart';
import 'package:trust_edge_task/views/welcome_view.dart';

class AppRoutes {
  static const String welcome = '/';
  static const String login = '/Login';
  static const String register = '/Register';
  static const String home = '/Home';
  static const String updateUserInformation = '/UpdateUserInformationView';

  static final routes = [
    GetPage(name: welcome, page: () => const WelcomeView()),
    GetPage(name: register, page: () => RegisterView()),
    GetPage(name: login, page: () => LoginView()),
    GetPage(name: home, page: () => const HomeView()),
    GetPage(
        name: updateUserInformation, page: () => UpdateUserInfoView()),
  ];
}
