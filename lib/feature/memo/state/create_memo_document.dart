import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/memo_document.dart';

part 'create_memo_document.g.dart';

@riverpod
class CreateMemoDocumentNotifier extends _$CreateMemoDocumentNotifier {
  @override
  CreateMemoDocument build() {
    return const CreateMemoDocument();
  }

  void updateText(String text) {
    // TODO(susa): copyWithにしたい
    state = CreateMemoDocument(text: text);
  }
}
