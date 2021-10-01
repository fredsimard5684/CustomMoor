          
          import "package:test/bootstrap/node.dart";

          import "single_transformer_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        