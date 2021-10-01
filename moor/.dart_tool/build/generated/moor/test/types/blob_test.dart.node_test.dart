          
          import "package:test/bootstrap/node.dart";

          import "blob_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        