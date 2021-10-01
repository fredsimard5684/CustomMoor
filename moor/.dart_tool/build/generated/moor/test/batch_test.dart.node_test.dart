          
          import "package:test/bootstrap/node.dart";

          import "batch_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        