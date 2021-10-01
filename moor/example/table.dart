import 'package:moor/moor.dart';

part 'table.table.dart';

@Entity()
class Categories {
  @UniqueID() late int id;
  late String name;
  String? fs;
  late bool isActive;
  late double reals;

  Categories();

  Categories.fromDb(this.id, this.name, this.fs, this.isActive, this.reals);
}