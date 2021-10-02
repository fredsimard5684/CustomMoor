import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:moor/moor.dart';
import 'package:source_gen/source_gen.dart';

class EntityGenerator extends Generator {
  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {
    var buffer = StringBuffer();

    for (final element in library.allElements) {
      if (element is ClassElement && !element.isEnum) {
        if (const TypeChecker.fromRuntime(Entity)
            .annotationsOf(element)
            .isNotEmpty) {
          final className = element.displayName;
          buffer.writeln('@UseRowClass($className, constructor: \'fromDb\')');
          buffer.writeln('class ${className}Table extends Table {');

          String? id;

          for (final f in element.fields) {
            final fieldName = f.displayName;

            if (f.type.isDartCoreInt) {
              if (const TypeChecker.fromRuntime(UniqueID)
                  .annotationsOf(f)
                  .isNotEmpty) {
                id = '$fieldName';
              }

              buffer.write('IntColumn get $fieldName => integer()');

              if (f.type.toString().contains('?')) {
                buffer.write('.nullable()');
              }
              buffer.writeln('();');
            } else if (f.type.isDartCoreString) {
              buffer.write('TextColumn get $fieldName => text()');

              if (f.type.toString().contains('?')) {
                buffer.write('.nullable()');
              }
              buffer.writeln('();');
            } else if (f.type.isDartCoreDouble) {
              buffer.write('RealColumn get $fieldName => real()');

              if (f.type.isDartCoreNull) {
                buffer.write('.nullable()');
              }
              buffer.writeln('();');
            } else if (f.type.isDartCoreBool) {
              buffer.write('BoolColumn get $fieldName => boolean()');

              if (f.type.isDartCoreNull) {
                buffer.write('.nullable()');
              }
              buffer.writeln('();');
            } else if (f.type.isDartCoreList) {
              late final String? converter;

              var genericType = f.type.toString();
              genericType = genericType.split('<')[1].split('>')[0];

              if (const TypeChecker.fromRuntime(Converter)
                  .annotationsOf(f)
                  .isNotEmpty) {
                final annotation = const TypeChecker.fromRuntime(Converter)
                    .annotationsOf(f)
                    .first;
                converter = annotation
                    .getField('converterType')!
                    .toTypeValue()!
                    .element!
                    .name;

                String nullString = '';

                if (f.type.toString().contains('?')) {
                  nullString = '.nullable()';
                }

                buffer.writeln('TextColumn get $fieldName => text().map(const '
                    '${converter.toString()}<$genericType>())$nullString();');
              } else {
                throw Exception(
                    'Please insert the Converter annotation to this field '
                    '$fieldName');
              }
            } else if (const TypeChecker.fromRuntime(DateTime)
                .isExactlyType(f.type)) {
              buffer.write('DateTimeColumn get $fieldName => dateTime()');

              if (f.type.toString().contains('?')) {
                buffer.write('.nullable()');
              }
              buffer.writeln('();');
            } else if (const TypeChecker.fromRuntime(Object)
                .isSuperTypeOf(f.type)) {
              if (const TypeChecker.fromRuntime(Object)
                  .annotationsOf(f)
                  .isNotEmpty) {
                String? converter;

                final annotation = const TypeChecker.fromRuntime(Converter)
                    .annotationsOf(f)
                    .first;
                converter = annotation
                    .getField('converterType')!
                    .toTypeValue()!
                    .element!
                    .name;

                String nullString = '';

                if (f.type.toString().contains('?')) {
                  nullString = '.nullable()';
                }
                //When using a pure object
                if (annotation.getField('columnType')!.toTypeValue()?.element == null) {
                  buffer.writeln(
                      'TextColumn get $fieldName => text().map(const '
                      '${converter.toString()}<${f.type.toString()}>())$nullString();');
                }
                //When using enum
                else {
                  var type = annotation.getField('columnType')!.toTypeValue();

                  List? typeArguments = setTypeList(type!);
                  if (typeArguments == null) {
                    throw Exception(
                        'Please insert only primitive type for the Converter'
                        ' annotation. Wrong field: $fieldName');
                  }

                  buffer.writeln(
                      '${typeArguments[0]} get $fieldName => ${typeArguments[1]}.map(const '
                      '${converter.toString()}<${f.type.toString()}<${typeArguments[2]}>>())$nullString();');
                }
              } else {
                throw Exception('Please insert the Converter annotation for '
                    'this field $fieldName');
              }
            }
          }
          if (id != null) {
            buffer.writeln('@override');
            buffer.writeln('Set<Column> get primaryKey => {$id};');
          }

          buffer.writeln('}\n');
        }
      }
    }
    return buffer.toString();
  }

  List<String>? setTypeList(DartType type) {
    List<String>? list;
    if (type.isDartCoreBool) {
      list = ['BoolColumn', 'boolean()', 'bool'];
    } else if (type.isDartCoreInt) {
      list = ['IntColumn', 'integer()', 'int'];
    } else if (type.isDartCoreString) {
      list = ['TextColumn', 'text()', 'String'];
    } else if (type.isDartCoreDouble) {
      list = ['RealColumn', 'real()', 'double'];
    }
    return list;
  }
}
