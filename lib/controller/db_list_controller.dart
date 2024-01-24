import 'package:get/get.dart';
import 'package:sql/db/model/data_model.dart';

class DbListController extends GetxController {
  List<StudentModel> studentList = <StudentModel>[];
  List<Map<String, Object?>> dataListMap = [];
  void clearStudentList() {
    studentList.clear();
    update();
  }

  void addToStudList(StudentModel newStudent) {
    studentList.add(newStudent);
    update();
  }
}
