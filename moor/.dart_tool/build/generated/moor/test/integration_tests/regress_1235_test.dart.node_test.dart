          
          import "package:test/bootstrap/node.dart";

          import "regress_1235_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        