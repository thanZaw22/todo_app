import 'package:drift_todos/database/todos_dao.dart';

import 'package:drift_todos/screens/todos_screen.dart';
import '../database/todos_dao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

TodosDao todosDao = Get.find();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                todosDao.deleteAllTodos();
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red[700],
              ),
            ),
          ],
          centerTitle: true,
          title: const Text('Tasks'),
          bottom: const TabBar(indicatorSize: TabBarIndicatorSize.label, tabs: [
            Tab(
              text: 'My Tasks',
            ),
            Tab(
              text: 'Todo',
            ),
            Tab(
              text: '+ New List',
            ),
          ]),
        ),
        drawer: Drawer(
          backgroundColor: Colors.blue,
          child: SafeArea(
              child: Container(
            color: Colors.white,
            child: const Text('Drawer'),
          )),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        body: const TabBarView(children: [
          Center(
              child: Text(
            'My Task',
          )),
          TodosScreen(),
          Center(
              child: Text(
            'New List',
          )),
        ]),
      ),
    );
  }
}
