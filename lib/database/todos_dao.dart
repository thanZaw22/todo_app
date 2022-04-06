import 'package:drift/drift.dart';
import 'package:drift_todos/database/todos_database.dart';
import 'package:drift_todos/database/todos_table.dart';

part 'todos_dao.g.dart';

@DriftAccessor(tables: [TodosTable])
class TodosDao extends DatabaseAccessor<MyDatabase> with _$TodosDaoMixin {
  TodosDao(MyDatabase todosDatabase) : super(todosDatabase);

  Future<int> insertTodo(TodosTableCompanion todo) async {
    return await into(todosTable).insert(todo);
  }

  Stream<List<Todos>> getAllTodos() {
    return (select(todosTable)
          ..orderBy([
            (tbl) => OrderingTerm(expression: tbl.id, mode: OrderingMode.desc)
          ]))
        .watch();
  }

  Future<bool> updateTodo(TodosTableCompanion todo) async {
    return await update(todosTable).replace(todo);
  }

  Future<int> deletTodo(Todos todo) async {
    return await delete(todosTable).delete(todo);
  }

  Future<int> deleteAllTodos() async {
    return await (delete(todosTable)
          ..where((tbl) => tbl.id.isBiggerThanValue(0)))
        .go();
  }
}
