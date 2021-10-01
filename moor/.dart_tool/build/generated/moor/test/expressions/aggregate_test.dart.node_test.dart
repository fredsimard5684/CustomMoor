          
          import "package:test/bootstrap/node.dart";

          import "aggregate_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        