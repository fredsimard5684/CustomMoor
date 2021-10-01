          
          import "package:test/bootstrap/node.dart";

          import "moor_ffi_functions_test.dart" as test;

          void main() {
            internalBootstrapNodeTest(() => test.main);
          }
        