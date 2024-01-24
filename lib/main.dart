import 'dart:io';

import 'package:get/get.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sql/bindings/home_bindings.dart';
import 'package:sql/db/functions/db_functions.dart';
import 'package:sql/screens/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:sql/screens/widgets/details_student.dart';

Future<void> main() async {
  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDataBase();
  // makeDB();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomeBinding(),
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ScreenHome(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: "/",
          page: () => const ScreenHome(),
        ),
        GetPage(name: "/details", page: () => ScreenDetails())
      ],
    );
  }
}
