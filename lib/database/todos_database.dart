import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_todos/database/todos_dao.dart';
import 'package:drift_todos/database/todos_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'todos_database.g.dart';

LazyDatabase _database() {
  return LazyDatabase(
    () async {
      final dbFile = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFile.path, 'todos.db'));
      return NativeDatabase(file);
    },
  );
}

@DriftDatabase(tables: [TodosTable], daos: [TodosDao])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_database());

  @override
  int get schemaVersion => 1;
}
