          
          import "package:test/bootstrap/node.dart";

          import "serialization_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        