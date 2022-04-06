import 'package:drift_todos/database/todos_database.dart';

import '/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  MyDatabase myDatabase = MyDatabase();
  Get.put(
    myDatabase.todosDao,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
