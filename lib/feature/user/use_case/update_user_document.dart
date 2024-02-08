import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/data/firebase/firebase_auth.dart';
import '../data/user_document.dart';
import '../state/user_document.dart';

part 'update_user_document.g.dart';

@riverpod
class UpdateUserDocumentUseCase extends _$UpdateUserDocumentUseCase {
  @override
  FutureOr<void> build() => null;

  Future<void> invoke({
    String? nickname,
  }) async {
    if (state.isLoading) {
      return;
    }
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final userId = await ref.read(firebaseUserIdProvider.future);
      await ref.read(userDocumentQueryProvider).update(
            userId: userId,
            updateUser: UpdateUserDocument(
              nickname: nickname,
            ),
          );
    });
  }
}
