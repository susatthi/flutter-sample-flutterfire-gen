import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/memo_document.dart';
import 'current_memo_document.dart';

part 'update_memo_document.g.dart';

@Riverpod(dependencies: [currentMemoDocument])
class UpdateMemoDocumentNotifier extends _$UpdateMemoDocumentNotifier {
  @override
  Future<UpdateMemoDocument> build() async {
    final memoDocument = await ref.watch(currentMemoDocumentProvider.future);
    if (memoDocument == null) {
      // ignore: only_throw_errors
      throw 'メモが見つかりませんでした。';
    }
    return memoDocument.toUpdateMemoDocument();
  }

  void updateText(String text) {
    // TODO(susa): copyWithにしたい
    state = AsyncValue.data(UpdateMemoDocument(text: text));
  }
}

extension on ReadMemoDocument {
  UpdateMemoDocument toUpdateMemoDocument() => UpdateMemoDocument(
        text: text,
      );
}
