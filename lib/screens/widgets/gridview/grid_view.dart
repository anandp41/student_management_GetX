import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sql/controller/db_list_controller.dart';
import 'package:sql/db/functions/db_functions.dart';
import 'package:sql/db/model/data_model.dart';
import 'package:sql/functions/image_processor.dart';

class DbGridView extends StatelessWidget {
  final DbListController dbListController;
  const DbGridView({
    super.key,
    required this.dbListController,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: dbListController.studentList.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 165,
            mainAxisExtent: 211,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (ctx, index) {
          final data = dbListController.studentList[index];
          return InkResponse(
            onTap: () async {
              StudentModel student = await getThisStudent(data.admno);
              Get.toNamed("/details", arguments: student);
            },
            child: Card(
              color: Colors.blueGrey,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: GridTile(
                child: SizedBox(
                  width: 50,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        // width: 100,
                        child: Image(
                          image: imageProcessor(data.image64bit),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'Name: ${data.name}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
