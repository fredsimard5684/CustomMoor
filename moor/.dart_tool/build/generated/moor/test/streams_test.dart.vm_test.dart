          
          import "dart:isolate";

          import "package:test/bootstrap/vm.dart";

          import "streams_test.dart" as test;

          void main(_, SendPort message) {
            internalBootstrapVmTest(() => test.main, message);
          }
        