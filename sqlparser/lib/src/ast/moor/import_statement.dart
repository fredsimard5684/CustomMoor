import '../../reader/tokenizer/token.dart';
import '../node.dart';
import '../statements/statement.dart';
import '../visitor.dart';
import 'moor_file.dart';

/// An `import "file.dart";` statement that can appear inside a moor file.
class ImportStatement extends Statement implements PartOfMoorFile {
  Token? importToken;
  StringLiteralToken? importString;
  final String importedFile;

  ImportStatement(this.importedFile);

  @override
  R accept<A, R>(AstVisitor<A, R> visitor, A arg) {
    return visitor.visitMoorSpecificNode(this, arg);
  }

  @override
  void transformChildren<A>(Transformer<A> transformer, A arg) {}

  @override
  final Iterable<AstNode> childNodes = const [];
}
