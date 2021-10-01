          //@dart=2.9
          import "dart:isolate";

          import "package:test/bootstrap/vm.dart";

          import "delegated_database_test.dart" as test;

          void main(_, SendPort message) {
            internalBootstrapVmTest(() => test.main, message);
          }
        