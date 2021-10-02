import 'package:moor/moor.dart';

import 'example.dart';
import 'list_converter.dart';

part 'table.table.dart';

@Entity()
class Categories {
  @UniqueID() late int id;
  late String name;
  String? fs;
  late bool isActive;
  late double reals;
  @Converter(converterType: ListConverter) List<Te>? t;
  late DateTime time;
  DateTime? tyime;
  @Converter(converterType: EConverter, columnType: int) late Test test;

  Categories();

  Categories.fromDb(
      this.id,
      this.name,
      this.fs,
      this.isActive,
      this.reals,
      this.t,
      this.time,
      this.tyime,
      this.test
      );
}