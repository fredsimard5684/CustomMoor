import 'package:build/build.dart';
import 'package:moor_generator/src/backends/build/generators/entity_generator.dart';
import 'package:moor_generator/src/backends/build/moor_builder.dart';
import 'package:moor_generator/src/backends/build/preprocess_builder.dart';
import 'package:source_gen/source_gen.dart';

Builder moorBuilder(BuilderOptions options) => MoorSharedPartBuilder(options);

// Builder tableGeneratorBuilder(BuilderOptions options) =>
//     SharedPartBuilder([EntityGenerator()], 'shared_table');

Builder tablePartGeneratorBuilder(BuilderOptions options) =>
    PartBuilder([EntityGenerator()], '.table.dart');

Builder moorBuilderNotShared(BuilderOptions options) =>
    MoorPartBuilder(options);

Builder preparingBuilder(BuilderOptions options) => PreprocessBuilder();

PostProcessBuilder moorCleanup(BuilderOptions options) {
  return const FileDeletingBuilder(['.temp.dart']);
}
