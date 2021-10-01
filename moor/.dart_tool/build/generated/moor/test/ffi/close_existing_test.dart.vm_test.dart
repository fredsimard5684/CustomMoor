          
          import "dart:isolate";

          import "package:test/bootstrap/vm.dart";

          import "close_existing_test.dart" as test;

          void main(_, SendPort message) {
            internalBootstrapVmTest(() => test.main, message);
          }
        