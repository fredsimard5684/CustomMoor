// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CategoriesTableCompanion extends UpdateCompanion<Categories> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> fs;
  final Value<bool> isActive;
  final Value<double> reals;
  final Value<List<Te>?> t;
  final Value<DateTime> time;
  final Value<DateTime?> tyime;
  final Value<dynamic> test;
  const CategoriesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.fs = const Value.absent(),
    this.isActive = const Value.absent(),
    this.reals = const Value.absent(),
    this.t = const Value.absent(),
    this.time = const Value.absent(),
    this.tyime = const Value.absent(),
    this.test = const Value.absent(),
  });
  CategoriesTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.fs = const Value.absent(),
    required bool isActive,
    required double reals,
    this.t = const Value.absent(),
    required DateTime time,
    this.tyime = const Value.absent(),
    required dynamic test,
  })  : name = Value(name),
        isActive = Value(isActive),
        reals = Value(reals),
        time = Value(time),
        test = Value(test);
  static Insertable<Categories> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String?>? fs,
    Expression<bool>? isActive,
    Expression<double>? reals,
    Expression<List<Te>?>? t,
    Expression<DateTime>? time,
    Expression<DateTime?>? tyime,
    Expression<dynamic>? test,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (fs != null) 'fs': fs,
      if (isActive != null) 'is_active': isActive,
      if (reals != null) 'reals': reals,
      if (t != null) 't': t,
      if (time != null) 'time': time,
      if (tyime != null) 'tyime': tyime,
      if (test != null) 'test': test,
    });
  }

  CategoriesTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? fs,
      Value<bool>? isActive,
      Value<double>? reals,
      Value<List<Te>?>? t,
      Value<DateTime>? time,
      Value<DateTime?>? tyime,
      Value<dynamic>? test}) {
    return CategoriesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      fs: fs ?? this.fs,
      isActive: isActive ?? this.isActive,
      reals: reals ?? this.reals,
      t: t ?? this.t,
      time: time ?? this.time,
      tyime: tyime ?? this.tyime,
      test: test ?? this.test,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (fs.present) {
      map['fs'] = Variable<String?>(fs.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (reals.present) {
      map['reals'] = Variable<double>(reals.value);
    }
    if (t.present) {
      final converter = $CategoriesTableTable.$converter0;
      map['t'] = Variable<String?>(converter.mapToSql(t.value));
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    if (tyime.present) {
      map['tyime'] = Variable<DateTime?>(tyime.value);
    }
    if (test.present) {
      final converter = $CategoriesTableTable.$converter1;
      map['test'] = Variable<int>(converter.mapToSql(test.value)!);
    }
    return map;
  }

  CategoriesTableCompanion setCategoriesTableCompanion(Categories from) {
    return CategoriesTableCompanion(
      id: Value(from.id),
      name: Value(from.name),
      fs: Value(from.fs),
      isActive: Value(from.isActive),
      reals: Value(from.reals),
      t: Value(from.t),
      time: Value(from.time),
      tyime: Value(from.tyime),
      test: Value(from.test),
    );
  }

  factory CategoriesTableCompanion.fromRowClass(Categories object,
      {bool nullToAbsent = false}) {
    return CategoriesTableCompanion();
  }
  static Map<String, Expression> fromRowClassToColumns(Categories object,
      {bool nullToAbsent = false}) {
    return CategoriesTableCompanion.fromRowClass(object,
            nullToAbsent: nullToAbsent)
        .toColumns(nullToAbsent);
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('fs: $fs, ')
          ..write('isActive: $isActive, ')
          ..write('reals: $reals, ')
          ..write('t: $t, ')
          ..write('time: $time, ')
          ..write('tyime: $tyime, ')
          ..write('test: $test')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTableTable extends CategoriesTable
    with TableInfo<$CategoriesTableTable, Categories> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CategoriesTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _fsMeta = const VerificationMeta('fs');
  late final GeneratedColumn<String?> fs = GeneratedColumn<String?>(
      'fs', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _isActiveMeta = const VerificationMeta('isActive');
  late final GeneratedColumn<bool?> isActive = GeneratedColumn<bool?>(
      'is_active', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_active IN (0, 1))');
  final VerificationMeta _realsMeta = const VerificationMeta('reals');
  late final GeneratedColumn<double?> reals = GeneratedColumn<double?>(
      'reals', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _tMeta = const VerificationMeta('t');
  late final GeneratedColumnWithTypeConverter<List<Te>, String?> t =
      GeneratedColumn<String?>('t', aliasedName, true,
              typeName: 'TEXT', requiredDuringInsert: false)
          .withConverter<List<Te>>($CategoriesTableTable.$converter0);
  final VerificationMeta _timeMeta = const VerificationMeta('time');
  late final GeneratedColumn<DateTime?> time = GeneratedColumn<DateTime?>(
      'time', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _tyimeMeta = const VerificationMeta('tyime');
  late final GeneratedColumn<DateTime?> tyime = GeneratedColumn<DateTime?>(
      'tyime', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _testMeta = const VerificationMeta('test');
  late final GeneratedColumnWithTypeConverter<dynamic, int?> test =
      GeneratedColumn<int?>('test', aliasedName, false,
              typeName: 'INTEGER', requiredDuringInsert: true)
          .withConverter<dynamic>($CategoriesTableTable.$converter1);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, fs, isActive, reals, t, time, tyime, test];
  @override
  String get aliasedName => _alias ?? 'categories_table';
  @override
  String get actualTableName => 'categories_table';
  @override
  VerificationContext validateIntegrity(Insertable<Categories> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('fs')) {
      context.handle(_fsMeta, fs.isAcceptableOrUnknown(data['fs']!, _fsMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    if (data.containsKey('reals')) {
      context.handle(
          _realsMeta, reals.isAcceptableOrUnknown(data['reals']!, _realsMeta));
    } else if (isInserting) {
      context.missing(_realsMeta);
    }
    context.handle(_tMeta, const VerificationResult.success());
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('tyime')) {
      context.handle(
          _tyimeMeta, tyime.isAcceptableOrUnknown(data['tyime']!, _tyimeMeta));
    }
    context.handle(_testMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Categories map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Categories.fromDb(
      const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      const StringType().mapFromDatabaseResponse(data['${effectivePrefix}fs']),
      const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_active'])!,
      const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}reals'])!,
      $CategoriesTableTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}t'])),
      const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time'])!,
      const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tyime']),
      $CategoriesTableTable.$converter1.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}test']))!,
    );
  }

  @override
  $CategoriesTableTable createAlias(String alias) {
    return $CategoriesTableTable(_db, alias);
  }

  static TypeConverter<List<Te>, String> $converter0 =
      const ListConverter<Te>();
  static TypeConverter<dynamic, int> $converter1 =
      const EConverter<Test<int>>();
}

class Recipe extends DataClass implements Insertable<Recipe> {
  final int id;
  final String title;
  final String instructions;
  final int? category;
  Recipe(
      {required this.id,
      required this.title,
      required this.instructions,
      this.category});
  factory Recipe.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Recipe(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      instructions: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}instructions'])!,
      category: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['instructions'] = Variable<String>(instructions);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int?>(category);
    }
    return map;
  }

  RecipesCompanion toCompanion(bool nullToAbsent) {
    return RecipesCompanion(
      id: Value(id),
      title: Value(title),
      instructions: Value(instructions),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
    );
  }

  factory Recipe.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Recipe(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      instructions: serializer.fromJson<String>(json['instructions']),
      category: serializer.fromJson<int?>(json['category']),
    );
  }
  factory Recipe.fromJsonString(String encodedJson,
          {ValueSerializer? serializer}) =>
      Recipe.fromJson(DataClass.parseJson(encodedJson) as Map<String, dynamic>,
          serializer: serializer);
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'instructions': serializer.toJson<String>(instructions),
      'category': serializer.toJson<int?>(category),
    };
  }

  Recipe copyWith(
          {int? id,
          String? title,
          String? instructions,
          Value<int?> category = const Value.absent()}) =>
      Recipe(
        id: id ?? this.id,
        title: title ?? this.title,
        instructions: instructions ?? this.instructions,
        category: category.present ? category.value : this.category,
      );
  @override
  String toString() {
    return (StringBuffer('Recipe(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('instructions: $instructions, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(title.hashCode, $mrjc(instructions.hashCode, category.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Recipe &&
          other.id == this.id &&
          other.title == this.title &&
          other.instructions == this.instructions &&
          other.category == this.category);
}

class RecipesCompanion extends UpdateCompanion<Recipe> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> instructions;
  final Value<int?> category;
  const RecipesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.instructions = const Value.absent(),
    this.category = const Value.absent(),
  });
  RecipesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String instructions,
    this.category = const Value.absent(),
  })  : title = Value(title),
        instructions = Value(instructions);
  static Insertable<Recipe> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? instructions,
    Expression<int?>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (instructions != null) 'instructions': instructions,
      if (category != null) 'category': category,
    });
  }

  RecipesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? instructions,
      Value<int?>? category}) {
    return RecipesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      instructions: instructions ?? this.instructions,
      category: category ?? this.category,
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
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (category.present) {
      map['category'] = Variable<int?>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('instructions: $instructions, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

class $RecipesTable extends Recipes with TableInfo<$RecipesTable, Recipe> {
  final GeneratedDatabase _db;
  final String? _alias;
  $RecipesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 16),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _instructionsMeta =
      const VerificationMeta('instructions');
  late final GeneratedColumn<String?> instructions = GeneratedColumn<String?>(
      'instructions', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  late final GeneratedColumn<int?> category = GeneratedColumn<int?>(
      'category', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, title, instructions, category];
  @override
  String get aliasedName => _alias ?? 'recipes';
  @override
  String get actualTableName => 'recipes';
  @override
  VerificationContext validateIntegrity(Insertable<Recipe> instance,
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
    if (data.containsKey('instructions')) {
      context.handle(
          _instructionsMeta,
          instructions.isAcceptableOrUnknown(
              data['instructions']!, _instructionsMeta));
    } else if (isInserting) {
      context.missing(_instructionsMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Recipe map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Recipe.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RecipesTable createAlias(String alias) {
    return $RecipesTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  _$Database.connect(DatabaseConnection c) : super.connect(c);
  late final $CategoriesTableTable categoriesTable =
      $CategoriesTableTable(this);
  late final $RecipesTable recipes = $RecipesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [categoriesTable, recipes];
}
