import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/data/firebase/firebase_auth.dart';
import '../../../core/use_case/use_case.dart';
import '../state/memo_document.dart';

part 'delete_memo_document.g.dart';

@riverpod
class DeleteMemoDocumentUseCase extends _$DeleteMemoDocumentUseCase
    with UseCase {
  @override
  FutureOr<void> build(String memoId) => buildInternal();

  Future<void> invoke() => invokeInternal(() async {
        final userId = await ref.read(firebaseUserIdProvider.future);
        await ref.read(memoDocumentQueryProvider).delete(
              userId: userId,
              memoId: memoId,
            );
      });
}
