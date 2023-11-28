import 'package:get/get.dart';
import 'package:trust_edge_task/controllers/update_user_information_controller.dart';

class UpdateUserInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateUserInformationController());
  }
}
