import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sql/db/functions/db_functions.dart';
import 'package:sql/db/model/data_model.dart';

void updater(StudentModel data) {
  final formKey = GlobalKey<FormState>();
  final _newNameController = TextEditingController(text: data.name);
  final _newAgeController = TextEditingController(text: data.age);
  final _newClassController = TextEditingController(text: data.classInSchool);
  dynamic byte64String = data.image64bit;
  Get.bottomSheet(SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Text('Name:'),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextFormField(
                    controller: _newNameController,
                    validator: (value) {
                      RegExp regx = RegExp(r'^[A-Za-z]*(\s+[A-Za-z]*)*$');
                      if (!regx.hasMatch(value as String)) {
                        return 'Enter a name without any special characters or numbers';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Text('Age:'),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextFormField(
                    controller: _newAgeController,
                    validator: (value) {
                      RegExp regx = RegExp(r'^([5-9]|1[0-9])$');
                      if (!regx.hasMatch(value as String)) {
                        return 'Enter valid age';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Start of the second row
            Row(
              children: [
                const Text('Adm No:'),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextFormField(
                    initialValue: data.admno,
                    readOnly: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Text('Class:'),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextFormField(
                    controller: _newClassController,
                    validator: (value) {
                      RegExp regx = RegExp(r'^([1-9]|1[0-2])$');
                      if (!regx.hasMatch(value as String)) {
                        return 'Enter a class between 1 and 12';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.green),
                        foregroundColor:
                            MaterialStatePropertyAll(Colors.black87)),
                    onPressed: () async {
                      byte64String = (await pickImage()) ?? byte64String;
                    },
                    icon: const Icon(Icons.image),
                    label: const Text('Choose another image')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        updateField(
                            admno: data.admno,
                            name: _newNameController.text.trim(),
                            age: _newAgeController.text.trim(),
                            classInSchool: _newClassController.text.trim(),
                            image64bit: byte64String);
                        getAllStudents();
                        Get.back();

                        StudentModel student = await getThisStudent(data.admno);
                        Get.toNamed("/details", arguments: student);
                        Get.showSnackbar(
                            const GetSnackBar(title: "Student Updated"));
                      }
                    },
                    icon: Icon(
                      Icons.update_rounded,
                      color: Colors.purple[700],
                    ),
                    label: const Text('Update')),
                ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.cancel,
                      color: Colors.red,
                    ),
                    label: const Text('Cancel'))
              ],
            ),
          ],
        ),
      ),
    ),
  ));
}
