import 'package:get/get.dart';
import 'package:sql/controller/db_list_controller.dart';
import 'package:sql/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:sql/screens/widgets/gridview/grid_view.dart';
import 'package:sql/screens/widgets/listview/list_view.dart';
// import 'package:sql/screens/screen_home.dart';
// import 'package:sql/screens/widgets/details_student.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homeController) {
        // final DbListController dbListController = Get.find<DbListController>();
        // dbListController

        return GetBuilder<DbListController>(builder: (controller) {
          controller.dataListMap.clear();

          return ((homeController.isListOn)
              ? DbListView(
                  dbListController: controller,
                )
              : DbGridView(
                  dbListController: controller,
                ));
        });
      },
    );
  }
}
