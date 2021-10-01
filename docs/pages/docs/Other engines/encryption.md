---
data:
  title: Encryption
  description: Use moor on encrypted databases
template: layouts/docs/single
---

There are two ways to use moor on encrypted databases. 
The `encrypted_moor` package is similar to `moor_flutter` and uses a platform plugin written in
Java.
Alternatively, you can use the ffi-based implementation with the `sqlcipher_flutter_libs` package.

## Using `encrypted_moor`

Starting from 1.7, we have a version of moor that can work with encrypted databases by using the
[sqflite_sqlcipher](https://pub.dev/packages/sqflite_sqlcipher) library
by [@davidmartos96](https://github.com/davidmartos96). To use it, you need to
remove the dependency on `moor_flutter` from your `pubspec.yaml` and replace it
with this:
```yaml
dependencies:
  moor: "$latest version"
  encrypted_moor:
   git:
    url: https://github.com/simolus3/moor.git
    path: extras/encryption 
```

Instead of importing `package:moor_flutter/moor_flutter` (or `package:moor/ffi.dart`) in your apps, 
you would then import both `package:moor/moor.dart` and `package:encrypted_moor/encrypted_moor.dart`.

Finally, you can replace `FlutterQueryExecutor` (or an `VmDatabase`) with an `EncryptedExecutor`.

### Extra setup on Android and iOS

Some extra steps may have to be taken in your project so that SQLCipher works correctly. For example, the ProGuard configuration on Android for apps built for release.

[Read instructions](https://pub.dev/packages/sqflite_sqlcipher) (Usage and installation instructions of the package can be ignored, as that is handled internally by `moor`)

## Encrypted version of `moor/ffi`

You can also use the new `moor/ffi` library with an encrypted executor.
This allows you to use an encrypted moor database on more platforms, which is particularly
interesting for Desktop applications.

### Setup

To use `sqlcipher`, add a dependency on `sqlcipher_flutter_libs`:

```yaml
dependencies:
  sqlcipher_flutter_libs: ^0.5.0
```

If you already have a dependency on `sqlite3_flutter_libs`, __drop that dependency__.
`sqlite3_flutter_libs` and `sqlcipher_flutter_libs` are not compatible
as they both provide a (different) set of `sqlite3` native apis.

On Android, you also need to adapt the opening behavior of the `sqlite3` package to use the encrypted library instead
of the regular `libsqlite3.so`:

```dart
import 'package:sqlite3/open.dart';

// call this method before using moor
void setupSqlCipher() {
  open.overrideFor(
      OperatingSystem.android, () => DynamicLibrary.open('libsqlcipher.so'));
}
```

When using moor on a background database, you need to call `setupSqlCipher` on the background isolate
as well.

On iOS and macOS, no additional setup is necessary - simply depend on `sqlcipher_flutter_libs`.

On Windows and Linux, you currently have to include a version of SQLCipher manually when you distribute
your app.
For more information on this, you can use the documentation [here]({{ '../platforms.md#bundling-sqlite-with-your-app' | pageUrl }}).
Instead of including `sqlite3.dll` or `libsqlite3.so`, you'd include the respective versions
of SQLCipher.

### Using

SQLCipher implements sqlite3's C api, which means that you can continue to use the `sqlite3` package
or `moor/ffi` without changes. They're both fully compatible with `sqlcipher_flutter_libs`.

To actually encrypt a database, you must set an encryption key before using it.
A good place to do that in moor is the `setup` parameter of `VmDatabase`, which runs before moor
is using the database in any way:

```dart
VmDatabase(
  File(...),
  setup: (rawDb) {
    rawDb.execute("PRAGMA key = 'passphrase';");
  }
);
```
