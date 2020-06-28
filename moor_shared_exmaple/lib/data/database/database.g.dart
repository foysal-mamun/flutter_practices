part of 'database.dart';

class TodoEntry extends DataClass implements Insertable<TodoEntry> {
  final int id;
  final String content;
  final DateTime targetDate;
  final int category;

  TodoEntry({ @required this.id, @required this.content, this.targetDate, this.category });

  factory TodoEntry.fromData(Map<String, dynamic> data, GeneratedDatabase db, {String prefix}) {

    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();

    return TodoEntry(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      content: stringType.mapFromDatabaseResponse(data['${effectivePrefix}content']),
      targetDate: dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}target_data']),
      category: intType.mapFromDatabaseResponse(data['${effectivePrefix}category'])
    );
  }

  factory TodoEntry.fromJson(
    Map<String, dynamic> json, 
    {ValueSerializer serializer = const ValueSerializer.defaults() }) {

    return TodoEntry(
      id: serializer.toJson<int>(json['id']),
      content: serializer.fromJson<String>(json['content']),
      targetDate: serializer.fromJson<DateTime>(json['targetData']),
      category: serializer.fromJson<int>(json['category'])
    );
  }

  @override
  TodosCompanion createCompanion(bool nullToAbsent) {
    return TodosCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      content: content == null && nullToAbsent ? const Value.absent() : Value(content),
      targetDate: targetDate == null && nullToAbsent ? const Value.absent() : Value(targetDate),
      category: category == null && nullToAbsent ? const Value.absent() : Value(category)
    );
  }

  TodoEntry copyWith({
    int id, String content, DateTime targetDate, int category
  }) => TodoEntry(
    id: id ?? this.id,
    content: content ?? this.content,
    targetDate: targetDate ?? this.targetDate,
    category: category ?? this.category
  );

  @override
  String toString() {
    return (
      StringBuffer('TodoEntry( ')
      ..write('id: $id, ')
      ..write('content: $content, ')
      ..write('targetDate: $targetDate, ')
      ..write('category: $category ')
      ..write(' )')
    ).toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, $mrjc(content.hashCode, $mrjc(targetDate.hashCode, category.hashCode))));

  @override
  bool operator ==(other) =>
    identical(this, other) || (other is TodoEntry && 
      other.id == this.id &&
      other.content == this.content &&
      other.targetDate == this.targetDate &&
      other.category == this.category
    );

}

class TodosCompanion extends UpdateCompanion<TodoEntry> {
  
  final Value<int> id;
  final Value<String> content;
  final Value<DateTime> targetDate;
  final Value<int> category;

  const TodosCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.targetDate = const Value.absent(),
    this.category = const Value.absent()
  });

  TodosCompanion.insert({
    this.id = const Value.absent(),
    @required String content,
    this.targetDate = const Value.absent(),
    this.category = const Value.absent(),
  }) : content = Value(content);

  TodosCompanion copyWith({
    Value<int> id,
    Value<String> content,
    Value<DateTime> targetDate,
    Value<int> category
  }) {
    return TodosCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
      targetDate: targetDate ?? this.targetDate,
      category: category ?? this.category
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    // TODO: implement toColumns
    throw UnimplementedError();
  }
}

class $TodosTable extends Todos with TableInfo<$TodosTable, TodoEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $TodosTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  GeneratedTextColumn _content;
  @override
  GeneratedTextColumn get content => _content ??= _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    );
  }

  final VerificationMeta _targetDateMeta = const VerificationMeta('targetDate');
  GeneratedDateTimeColumn _targetDate;
  @override
  GeneratedDateTimeColumn get targetDate =>
      _targetDate ??= _constructTargetDate();
  GeneratedDateTimeColumn _constructTargetDate() {
    return GeneratedDateTimeColumn(
      'target_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  GeneratedIntColumn _category;
  @override
  GeneratedIntColumn get category => _category ??= _constructCategory();
  GeneratedIntColumn _constructCategory() {
    return GeneratedIntColumn('category', $tableName, true,
        $customConstraints: 'NULLABLE REFERENCES categories(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, content, targetDate, category];
  @override
  $TodosTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'todos';
  @override
  final String actualTableName = 'todos';
  @override
  VerificationContext validateIntegrity(TodosCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.content.present) {
      context.handle(_contentMeta,
          content.isAcceptableValue(d.content.value, _contentMeta));
    } else if (content.isRequired && isInserting) {
      context.missing(_contentMeta);
    }
    if (d.targetDate.present) {
      context.handle(_targetDateMeta,
          targetDate.isAcceptableValue(d.targetDate.value, _targetDateMeta));
    } else if (targetDate.isRequired && isInserting) {
      context.missing(_targetDateMeta);
    }
    if (d.category.present) {
      context.handle(_categoryMeta,
          category.isAcceptableValue(d.category.value, _categoryMeta));
    } else if (category.isRequired && isInserting) {
      context.missing(_categoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TodoEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TodosCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.content.present) {
      map['content'] = Variable<String, StringType>(d.content.value);
    }
    if (d.targetDate.present) {
      map['target_date'] = Variable<DateTime, DateTimeType>(d.targetDate.value);
    }
    if (d.category.present) {
      map['category'] = Variable<int, IntType>(d.category.value);
    }
    return map;
  }

  @override
  $TodosTable createAlias(String alias) {
    return $TodosTable(_db, alias);
  }
}


class $TodosTable extends Todos with TableInfo<$TodosTable, TodoEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $TodosTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  GeneratedTextColumn _content;
  @override
  GeneratedTextColumn get content => _content ??= _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    );
  }

  final VerificationMeta _targetDateMeta = const VerificationMeta('targetDate');
  GeneratedDateTimeColumn _targetDate;
  @override
  GeneratedDateTimeColumn get targetDate =>
      _targetDate ??= _constructTargetDate();
  GeneratedDateTimeColumn _constructTargetDate() {
    return GeneratedDateTimeColumn(
      'target_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  GeneratedIntColumn _category;
  @override
  GeneratedIntColumn get category => _category ??= _constructCategory();
  GeneratedIntColumn _constructCategory() {
    return GeneratedIntColumn('category', $tableName, true,
        $customConstraints: 'NULLABLE REFERENCES categories(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, content, targetDate, category];
  @override
  $TodosTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'todos';
  @override
  final String actualTableName = 'todos';
  @override
  VerificationContext validateIntegrity(TodosCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.content.present) {
      context.handle(_contentMeta,
          content.isAcceptableValue(d.content.value, _contentMeta));
    } else if (content.isRequired && isInserting) {
      context.missing(_contentMeta);
    }
    if (d.targetDate.present) {
      context.handle(_targetDateMeta,
          targetDate.isAcceptableValue(d.targetDate.value, _targetDateMeta));
    } else if (targetDate.isRequired && isInserting) {
      context.missing(_targetDateMeta);
    }
    if (d.category.present) {
      context.handle(_categoryMeta,
          category.isAcceptableValue(d.category.value, _categoryMeta));
    } else if (category.isRequired && isInserting) {
      context.missing(_categoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TodoEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TodosCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.content.present) {
      map['content'] = Variable<String, StringType>(d.content.value);
    }
    if (d.targetDate.present) {
      map['target_date'] = Variable<DateTime, DateTimeType>(d.targetDate.value);
    }
    if (d.category.present) {
      map['category'] = Variable<int, IntType>(d.category.value);
    }
    return map;
  }

  @override
  $TodosTable createAlias(String alias) {
    return $TodosTable(_db, alias);
  }
}