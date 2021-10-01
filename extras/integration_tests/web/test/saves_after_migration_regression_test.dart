@TestOn('browser')
import 'dart:html';

import 'package:moor/moor.dart';
import 'package:moor/moor_web.dart';
import 'package:test/test.dart';

part 'saves_after_migration_regression_test.g.dart';

// This is a regression test for https://github.com/simolus3/moor/issues/273

class Foos extends Table {
  IntColumn get id => integer().autoIncrement()();
}

class Bars extends Table {
  IntColumn get id => integer().autoIncrement()();
}

@UseMoor(
  tables: [Foos, Bars],
)
class _FakeDb extends _$_FakeDb {
  @override
  final int schemaVersion;

  _FakeDb(QueryExecutor executor, this.schemaVersion) : super(executor);

  @override
  List<TableInfo<Table, DataClass>> get allTables => [
        foos,
        if (schemaVersion >= 2) bars,
      ];

  @override
  MigrationStrategy get migration =>
      MigrationStrategy(onUpgrade: (m, from, to) async {
        await m.createTable(bars);
      });
}

void main() {
  tearDown(() {
    window.localStorage.clear();
  });

  test('saves the database after creating it', () async {
    var db = _FakeDb(WebDatabase('foo'), 1);
    // ensure the database is opened
    await db.customSelect('SELECT 1').get();

    await db.close();
    db = _FakeDb(WebDatabase('foo'), 1);

    await db.select(db.foos).get(); // shouldn't throw, table exists
    await db.close();
  });

  test('saves the database after an update', () async {
    var db = _FakeDb(WebDatabase('foo'), 1);
    await db.customSelect('SELECT 1').get();
    await db.close();

    // run a migration to version 2
    db = _FakeDb(WebDatabase('foo'), 2);
    await db.customSelect('SELECT 1').get();
    await db.close();

    db = _FakeDb(WebDatabase('foo'), 2);
    await db.select(db.bars).get(); // shouldn't throw, table exists
    await db.close();
  });
}
