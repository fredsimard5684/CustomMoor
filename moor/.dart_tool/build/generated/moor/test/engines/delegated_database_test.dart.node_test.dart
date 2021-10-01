          //@dart=2.9
          import "package:test/bootstrap/node.dart";

          import "delegated_database_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        