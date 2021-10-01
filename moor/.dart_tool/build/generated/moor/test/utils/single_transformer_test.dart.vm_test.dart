          
          import "dart:isolate";

          import "package:test/bootstrap/vm.dart";

          import "single_transformer_test.dart" as test;

          void main(_, SendPort message) {
            internalBootstrapVmTest(() => test.main, message);
          }
        