          
          import "package:test/bootstrap/node.dart";

          import "exists_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        