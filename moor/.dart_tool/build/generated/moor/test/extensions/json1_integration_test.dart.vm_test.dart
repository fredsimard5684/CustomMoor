          
          import "dart:isolate";

          import "package:test/bootstrap/vm.dart";

          import "json1_integration_test.dart" as test;

          void main(_, SendPort message) {
            internalBootstrapVmTest(() => test.main, message);
          }
        