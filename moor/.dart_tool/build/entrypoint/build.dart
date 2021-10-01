// ignore_for_file: directives_ordering
import 'package:build_runner_core/build_runner_core.dart' as _i1;
import 'package:build_test/builder.dart' as _i2;
import 'package:build_config/build_config.dart' as _i3;
import 'package:mockito/src/builder.dart' as _i4;
import 'package:moor_generator/integrations/build.dart' as _i5;
import 'package:source_gen/builder.dart' as _i6;
import 'dart:isolate' as _i7;
import 'package:build_runner/build_runner.dart' as _i8;
import 'dart:io' as _i9;

final _builders = <_i1.BuilderApplication>[
  _i1.apply(
      r'build_test:test_bootstrap',
      [_i2.debugIndexBuilder, _i2.debugTestBuilder, _i2.testBootstrapBuilder],
      _i1.toRoot(),
      hideOutput: true,
      defaultGenerateFor:
          const _i3.InputSet(include: [r'$package$', r'test/**'])),
  _i1.apply(
      r'mockito:mockBuilder', [_i4.buildMocks], _i1.toDependentsOf(r'mockito'),
      hideOutput: false),
  _i1.apply(r'moor_generator:tablePartGeneratorBuilder',
      [_i5.tablePartGeneratorBuilder], _i1.toNoneByDefault(),
      hideOutput: false),
  _i1.apply(r'moor_generator:preparing_builder', [_i5.preparingBuilder],
      _i1.toDependentsOf(r'moor_generator'),
      hideOutput: true,
      appliesBuilders: const [r'moor_generator:moor_cleanup']),
  _i1.apply(r'moor_generator:moor_generator', [_i5.moorBuilder],
      _i1.toDependentsOf(r'moor_generator'),
      hideOutput: true,
      appliesBuilders: const [r'source_gen:combining_builder']),
  _i1.apply(r'moor_generator:moor_generator_not_shared',
      [_i5.moorBuilderNotShared], _i1.toNoneByDefault(),
      hideOutput: false),
  _i1.apply(r'source_gen:combining_builder', [_i6.combiningBuilder],
      _i1.toNoneByDefault(),
      hideOutput: false, appliesBuilders: const [r'source_gen:part_cleanup']),
  _i1.applyPostProcess(r'source_gen:part_cleanup', _i6.partCleanup),
  _i1.applyPostProcess(r'moor_generator:moor_cleanup', _i5.moorCleanup)
];
void main(List<String> args, [_i7.SendPort? sendPort]) async {
  var result = await _i8.run(args, _builders);
  sendPort?.send(result);
  _i9.exitCode = result;
}
