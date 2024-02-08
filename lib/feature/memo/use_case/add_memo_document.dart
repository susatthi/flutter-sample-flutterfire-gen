import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/data/firebase/firebase_auth.dart';
import '../state/memo_document.dart';
import '../state/memo_form_values.dart';

part 'add_memo_document.g.dart';

@riverpod
class AddMemoDocumentUseCase extends _$AddMemoDocumentUseCase {
  @override
  FutureOr<void> build() => null;

  Future<void> invoke() async {
    if (state.isLoading) {
      return;
    }
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final formValues = ref.read(memoFormValuesNotifierProvider);
      final userId = await ref.read(firebaseUserIdProvider.future);
      await ref.read(memoDocumentQueryProvider).add(
            userId: userId,
            createMemo: formValues.toCreateMemoDocument(),
          );
    });
  }
}
