          
          import "package:test/bootstrap/node.dart";

          import "join_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        