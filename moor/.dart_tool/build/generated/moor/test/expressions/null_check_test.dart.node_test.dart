          
          import "package:test/bootstrap/node.dart";

          import "null_check_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        