import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:moor/moor.dart';
import 'package:source_gen/source_gen.dart';

class EntityGenerator extends Generator {

  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {

    var buffer = StringBuffer();

    for (final element in library.allElements) {
      if (element is ClassElement && !element.isEnum) {
        if (const TypeChecker.fromRuntime(Entity).annotationsOf(element)
            .isNotEmpty) {
          final className = element.displayName;
          buffer.writeln('@UseRowClass($className, constructor: \'fromDb\')');
          buffer.writeln('class ${className}Table extends Table {');

          String? id;

          for (var f in element.fields) {
            final fieldName = f.displayName;

            if (f.type.isDartCoreInt)  {
              if (const TypeChecker.fromRuntime(UniqueID).annotationsOf(f)
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
            }

            else if (f.type.isDartCoreBool) {
              buffer.write('BoolColumn get $fieldName => boolean()');

              if (f.type.isDartCoreNull) {
                buffer.write('.nullable()');
              }
              buffer.writeln('();');
            }
            else if (f.type.isDartCoreList) {

            }
            else if (f.type.isDartCoreObject) {

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
}