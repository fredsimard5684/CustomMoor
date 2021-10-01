          
          import "package:test/bootstrap/node.dart";

          import "transactions_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        