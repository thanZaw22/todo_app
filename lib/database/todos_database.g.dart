// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Todos extends DataClass implements Insertable<Todos> {
  final int id;
  final String title;
  final String datetime;
  final bool? compleate;
  Todos(
      {required this.id,
      required this.title,
      required this.datetime,
      this.compleate});
  factory Todos.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Todos(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      datetime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}datetime'])!,
      compleate: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}compleate']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['datetime'] = Variable<String>(datetime);
    if (!nullToAbsent || compleate != null) {
      map['compleate'] = Variable<bool?>(compleate);
    }
    return map;
  }

  TodosTableCompanion toCompanion(bool nullToAbsent) {
    return TodosTableCompanion(
      id: Value(id),
      title: Value(title),
      datetime: Value(datetime),
      compleate: compleate == null && nullToAbsent
          ? const Value.absent()
          : Value(compleate),
    );
  }

  factory Todos.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Todos(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      datetime: serializer.fromJson<String>(json['datetime']),
      compleate: serializer.fromJson<bool?>(json['compleate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'datetime': serializer.toJson<String>(datetime),
      'compleate': serializer.toJson<bool?>(compleate),
    };
  }

  Todos copyWith({int? id, String? title, String? datetime, bool? compleate}) =>
      Todos(
        id: id ?? this.id,
        title: title ?? this.title,
        datetime: datetime ?? this.datetime,
        compleate: compleate ?? this.compleate,
      );
  @override
  String toString() {
    return (StringBuffer('Todos(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('datetime: $datetime, ')
          ..write('compleate: $compleate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, datetime, compleate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todos &&
          other.id == this.id &&
          other.title == this.title &&
          other.datetime == this.datetime &&
          other.compleate == this.compleate);
}

class TodosTableCompanion extends UpdateCompanion<Todos> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> datetime;
  final Value<bool?> compleate;
  const TodosTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.datetime = const Value.absent(),
    this.compleate = const Value.absent(),
  });
  TodosTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String datetime,
    this.compleate = const Value.absent(),
  })  : title = Value(title),
        datetime = Value(datetime);
  static Insertable<Todos> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? datetime,
    Expression<bool?>? compleate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (datetime != null) 'datetime': datetime,
      if (compleate != null) 'compleate': compleate,
    });
  }

  TodosTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? datetime,
      Value<bool?>? compleate}) {
    return TodosTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      datetime: datetime ?? this.datetime,
      compleate: compleate ?? this.compleate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (datetime.present) {
      map['datetime'] = Variable<String>(datetime.value);
    }
    if (compleate.present) {
      map['compleate'] = Variable<bool?>(compleate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('datetime: $datetime, ')
          ..write('compleate: $compleate')
          ..write(')'))
        .toString();
  }
}

class $TodosTableTable extends TodosTable
    with TableInfo<$TodosTableTable, Todos> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodosTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _datetimeMeta = const VerificationMeta('datetime');
  @override
  late final GeneratedColumn<String?> datetime = GeneratedColumn<String?>(
      'datetime', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _compleateMeta = const VerificationMeta('compleate');
  @override
  late final GeneratedColumn<bool?> compleate = GeneratedColumn<bool?>(
      'compleate', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (compleate IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [id, title, datetime, compleate];
  @override
  String get aliasedName => _alias ?? 'todos_table';
  @override
  String get actualTableName => 'todos_table';
  @override
  VerificationContext validateIntegrity(Insertable<Todos> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('datetime')) {
      context.handle(_datetimeMeta,
          datetime.isAcceptableOrUnknown(data['datetime']!, _datetimeMeta));
    } else if (isInserting) {
      context.missing(_datetimeMeta);
    }
    if (data.containsKey('compleate')) {
      context.handle(_compleateMeta,
          compleate.isAcceptableOrUnknown(data['compleate']!, _compleateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Todos map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Todos.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TodosTableTable createAlias(String alias) {
    return $TodosTableTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TodosTableTable todosTable = $TodosTableTable(this);
  late final TodosDao todosDao = TodosDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todosTable];
}
