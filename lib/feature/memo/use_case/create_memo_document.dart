import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/data/firebase/firebase_auth.dart';
import '../../../core/use_case/use_case.dart';
import '../state/create_memo_document.dart';
import '../state/memo_document.dart';

part 'create_memo_document.g.dart';

@riverpod
class CreateMemoDocumentUseCase extends _$CreateMemoDocumentUseCase
    with UseCase {
  @override
  FutureOr<void> build() => initUseCase();

  Future<void> invoke() => guard(() async {
        final createMemoDocument = ref.read(createMemoDocumentNotifierProvider);
        final userId = await ref.read(firebaseUserIdProvider.future);
        await ref.read(memoDocumentQueryProvider).add(
              userId: userId,
              createMemo: createMemoDocument,
            );
      });
}
