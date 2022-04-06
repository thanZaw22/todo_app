import 'package:drift_todos/database/todos_dao.dart';
import 'package:drift_todos/database/todos_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:drift/drift.dart' as drift;
import 'package:intl/intl.dart';

class UpdateTodo extends StatefulWidget {
  const UpdateTodo({Key? key, required this.todos}) : super(key: key);
  final Todos todos;

  @override
  State<UpdateTodo> createState() => _UpdateTodoState();
}

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String? dateTime, newTime, newDate, title;
bool compleate = false;

TextEditingController dateController = TextEditingController();

TodosDao todosDao = Get.find();

class _UpdateTodoState extends State<UpdateTodo> {
  @override
  void initState() {
    super.initState();
    dateController.text = widget.todos.datetime;
    dateTime = dateController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Update Todo'),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 80),
            child: ListView(
              padding: const EdgeInsets.only(bottom: 80),
              children: [
                // Title
                const SizedBox(height: 10),
                const Text(
                  'Title:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: widget.todos.title,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your title';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    title = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'Enter Title',
                    labelText: 'Title',
                  ),
                ),
                // DateTime
                const SizedBox(height: 10),
                const Text(
                  'Date Time:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: dateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your datetime';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    dateTime = value;
                  },
                  onTap: () async {
                    DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100));

                    if (date != null) {
                      // Time
                      TimeOfDay? time = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      if (time != null) {
                        setState(() {
                          newTime = time.format(context).toString();
                        });
                      }

                      newDate = DateFormat('dd/MM/yyyy').format(date);

                      if (newDate != null) {
                        setState(() {
                          dateController.text = '$newDate  $newTime';
                          dateTime = dateController.text;
                        });
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Date is not selected')));
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'Enter Datetime',
                    labelText: 'DateTime',
                  ),
                ),

                const SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        todosDao.updateTodo(TodosTableCompanion(
                          id: drift.Value(widget.todos.id),
                          title: drift.Value(title ?? ''),
                          datetime: drift.Value(dateTime ?? ''),
                          compleate: drift.Value(compleate),
                        ));

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const MyApp(),
                        //   ),
                        // );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Add'))
              ],
            ),
          )),
    );
  }
}
