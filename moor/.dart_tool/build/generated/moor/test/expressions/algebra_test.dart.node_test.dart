          
          import "package:test/bootstrap/node.dart";

          import "algebra_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        