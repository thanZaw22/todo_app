import 'package:drift_todos/database/todos_dao.dart';
import 'package:drift/drift.dart' as drift;
import 'package:drift_todos/screens/add_todo.dart';
import 'package:drift_todos/screens/update_todo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../database/todos_database.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  TodosDao todosDao = Get.find();

  bool checkValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Todos>>(
          stream: todosDao.getAllTodos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              debugPrint(snapshot.data.toString());
              return _showData(snapshot.data ?? []);
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AddTodo(), fullscreenDialog: true),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
      ),
    );
  }

  Widget _showData(List<Todos> todos) {
    return ListView.builder(
        shrinkWrap: true,
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 70),
        itemCount: todos.length,
        itemBuilder: (context, index) {
          var todo = todos[index];
          bool changeValue = todo.compleate ?? false;
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return UpdateTodo(todos: todo);
              }));
            },
            child: Card(
              child: ListTile(
                trailing: IconButton(
                  onPressed: () {
                    todosDao.deletTodo(todo);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red[700],
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Checkbox(
                    value: changeValue,
                    onChanged: (val) async {
                      if (val != null) {
                        changeValue = val;
                        todosDao.updateTodo(TodosTableCompanion(
                          id: drift.Value(todo.id),
                          title: drift.Value(todo.title),
                          datetime: drift.Value(todo.datetime),
                          compleate: drift.Value(changeValue),
                        ));
                      }

                      debugPrint(todo.compleate.toString());
                    },
                  ),
                ),
                title: Text(
                  todo.title,
                  style: TextStyle(
                    decorationColor: Colors.red,
                    decorationThickness: 3,
                    decoration: changeValue
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                subtitle: Text(
                  todo.datetime,
                  style: TextStyle(
                    decorationColor: Colors.red,
                    decorationThickness: 3,
                    decoration: changeValue
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
