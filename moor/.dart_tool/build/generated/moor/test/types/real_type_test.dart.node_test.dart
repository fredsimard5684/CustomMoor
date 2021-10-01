          
          import "package:test/bootstrap/node.dart";

          import "real_type_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        