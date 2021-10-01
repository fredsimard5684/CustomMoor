          
          import "package:test/bootstrap/node.dart";

          import "lazy_database_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        