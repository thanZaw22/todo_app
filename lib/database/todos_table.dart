import 'package:drift/drift.dart';

@DataClassName('Todos')
class TodosTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get datetime => text()();
  BoolColumn get compleate => boolean().nullable()();
}
