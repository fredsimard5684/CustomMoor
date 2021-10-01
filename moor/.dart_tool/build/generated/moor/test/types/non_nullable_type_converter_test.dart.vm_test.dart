          
          import "dart:isolate";

          import "package:test/bootstrap/vm.dart";

          import "non_nullable_type_converter_test.dart" as test;

          void main(_, SendPort message) {
            internalBootstrapVmTest(() => test.main, message);
          }
        