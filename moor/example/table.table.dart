// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table.dart';

// **************************************************************************
// EntityGenerator
// **************************************************************************

@UseRowClass(Categories, constructor: 'fromDb')
class CategoriesTable extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get fs => text().nullable()();
  BoolColumn get isActive => boolean()();
  RealColumn get reals => real()();
  TextColumn get t => text().map(const ListConverter<Te>()).nullable()();
  DateTimeColumn get time => dateTime()();
  DateTimeColumn get tyime => dateTime().nullable()();
  TextColumn get test => text().map(const EConverter<Test>())();
  @override
  Set<Column> get primaryKey => {id};
}
