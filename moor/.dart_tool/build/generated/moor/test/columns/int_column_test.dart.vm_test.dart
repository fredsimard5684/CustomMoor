          
          import "dart:isolate";

          import "package:test/bootstrap/vm.dart";

          import "int_column_test.dart" as test;

          void main(_, SendPort message) {
            internalBootstrapVmTest(() => test.main, message);
          }
        