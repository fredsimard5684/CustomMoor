          
          import "package:test/bootstrap/node.dart";

          import "custom_queries_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        