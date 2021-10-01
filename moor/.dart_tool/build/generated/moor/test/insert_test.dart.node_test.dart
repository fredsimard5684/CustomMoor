          
          import "package:test/bootstrap/node.dart";

          import "insert_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        