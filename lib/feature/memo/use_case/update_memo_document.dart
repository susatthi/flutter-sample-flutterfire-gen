import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/data/firebase/firebase_auth.dart';
import '../../../core/use_case/use_case.dart';
import '../state/current_memo_document.dart';
import '../state/memo_document.dart';
import '../state/update_memo_document.dart';

part 'update_memo_document.g.dart';

@Riverpod(dependencies: [UpdateMemoDocumentNotifier, currentMemoId])
class UpdateMemoDocumentUseCase extends _$UpdateMemoDocumentUseCase
    with UseCase {
  @override
  FutureOr<void> build() => initUseCase();

  Future<void> invoke() => guard(() async {
        final updateMemo =
            ref.read(updateMemoDocumentNotifierProvider).requireValue;
        final userId = await ref.read(firebaseUserIdProvider.future);
        final memoId = ref.read(currentMemoIdProvider);
        await ref.read(memoDocumentQueryProvider).update(
              userId: userId,
              memoId: memoId,
              updateMemo: updateMemo,
            );
      });
}
