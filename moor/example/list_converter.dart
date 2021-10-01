import 'package:moor/moor.dart';

import 'example.dart';

class ListConverter<T extends Test> extends TypeConverter<List<T>, String> {
  const ListConverter();
  @override
  List<T>? mapToDart(String? fromDb) {
    // if (fromDb == null) {
    //   return null;
    // }
    // if (fromDb == '[]') return null;
    // return List<T>.from((jsonDecode(fromDb) as List<dynamic>)
    //     .map((i) => Instantiater.createInstanceOf<T>()!..loadFromJsonData(i)));
  }

  @override
  String? mapToSql(List<T>? value) {
    // if (value == null) {
    //   return null;
    // }
    // var l = value.map((e) => e.toJsonData()).toList();
    //
    // return jsonEncode(l);
  }
}

class EConverter<T extends Test> extends TypeConverter<T, String> {
  const EConverter();
  @override
    T? mapToDart(String? fromDb) {
    // if (fromDb == null) {
    //   return null;
    // }
    // if (fromDb == '[]') return null;
    // return List<T>.from((jsonDecode(fromDb) as List<dynamic>)
    //     .map((i) => Instantiater.createInstanceOf<T>()!..loadFromJsonData(i)));
  }

  @override
  String? mapToSql(T? value) {
    // if (value == null) {
    //   return null;
    // }
    // var l = value.map((e) => e.toJsonData()).toList();
    //
    // return jsonEncode(l);
  }
}