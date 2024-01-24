import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sql/controller/db_list_controller.dart';
import 'package:sql/db/functions/db_functions.dart';
import 'package:sql/db/model/data_model.dart';
import 'package:sql/functions/image_processor.dart';

class DbListView extends StatelessWidget {
  final DbListController dbListController;
  const DbListView({
    super.key,
    required this.dbListController,
  });

  @override
  Widget build(BuildContext context) {
    // final DbListController dbListController = Get.find<DbListController>();
    return ListView.separated(
        itemBuilder: (ctx, index) {
          final data = dbListController.studentList[index];
          dbListController.dataListMap
              .add({'name': data.name, 'admno': data.admno});
          return Card(
            color: Colors.blueGrey,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: ListTile(
              onTap: () async {
                StudentModel student = await getThisStudent(data.admno);
                Get.toNamed("/details", arguments: student);
              },
              leading: CircleAvatar(
                backgroundImage: imageProcessor(data.image64bit),
              ),
              title: Text(
                'Name: ${data.name}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
          );
        },
        separatorBuilder: (ctx, index) {
          return const Divider(
            color: Colors.red,
          );
        },
        itemCount: dbListController.studentList.length);
  }
}
