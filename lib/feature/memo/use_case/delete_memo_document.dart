import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/data/firebase/firebase_auth.dart';
import '../state/memo_document.dart';

part 'delete_memo_document.g.dart';

@riverpod
class DeleteMemoDocumentUseCase extends _$DeleteMemoDocumentUseCase {
  @override
  FutureOr<void> build(String memoId) => null;

  Future<void> invoke() async {
    if (state.isLoading) {
      return;
    }
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final userId = await ref.read(firebaseUserIdProvider.future);
      await ref.read(memoDocumentQueryProvider).delete(
            userId: userId,
            memoId: memoId,
          );
    });
  }
}
