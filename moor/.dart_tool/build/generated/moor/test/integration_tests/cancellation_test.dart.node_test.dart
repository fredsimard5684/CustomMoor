          
          import "package:test/bootstrap/node.dart";

          import "cancellation_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        