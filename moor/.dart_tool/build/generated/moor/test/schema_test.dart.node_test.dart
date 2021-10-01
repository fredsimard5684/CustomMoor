          
          import "package:test/bootstrap/node.dart";

          import "schema_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        