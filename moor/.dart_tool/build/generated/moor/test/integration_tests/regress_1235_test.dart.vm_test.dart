          
          import "dart:isolate";

          import "package:test/bootstrap/vm.dart";

          import "regress_1235_test.dart" as test;

          void main(_, SendPort message) {
            internalBootstrapVmTest(() => test.main, message);
          }
        