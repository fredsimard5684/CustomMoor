          
          import "package:test/bootstrap/node.dart";

          import "synchronized_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        