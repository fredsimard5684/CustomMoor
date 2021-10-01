          
          import "package:test/bootstrap/node.dart";

          import "database_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        