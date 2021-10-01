          
          import "package:test/bootstrap/node.dart";

          import "expand_variables_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        