          
          import "package:test/bootstrap/node.dart";

          import "moor_files_integration_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        