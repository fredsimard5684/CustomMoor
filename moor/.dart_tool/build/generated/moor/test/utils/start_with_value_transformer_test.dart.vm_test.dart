          
          import "dart:isolate";

          import "package:test/bootstrap/vm.dart";

          import "start_with_value_transformer_test.dart" as test;

          void main(_, SendPort message) {
            internalBootstrapVmTest(() => test.main, message);
          }
        