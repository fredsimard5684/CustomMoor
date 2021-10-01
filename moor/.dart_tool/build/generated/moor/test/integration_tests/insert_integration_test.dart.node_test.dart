          
          import "package:test/bootstrap/node.dart";

          import "insert_integration_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        