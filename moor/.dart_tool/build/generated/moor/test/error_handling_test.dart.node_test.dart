          
          import "package:test/bootstrap/node.dart";

          import "error_handling_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        