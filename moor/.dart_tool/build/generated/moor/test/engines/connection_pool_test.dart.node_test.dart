          
          import "package:test/bootstrap/node.dart";

          import "connection_pool_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        