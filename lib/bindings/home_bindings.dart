import 'package:get/get.dart';
import 'package:sql/controller/db_list_controller.dart';
import 'package:sql/controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(DbListController());
  }
}
