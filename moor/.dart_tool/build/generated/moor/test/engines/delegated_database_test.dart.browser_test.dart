          //@dart=2.9
          import "package:test/bootstrap/browser.dart";

          import "delegated_database_test.dart" as test;

          void main() {
            if (Uri.base.queryParameters['directRun'] == 'true') {
              test.main();
            } else {
              internalBootstrapBrowserTest(() => test.main);
            }
          }
        