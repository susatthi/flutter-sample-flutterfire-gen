import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/data/firebase/firebase_auth.dart';
import '../data/user_document.dart';

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
      final firebaseUser = await ref.read(firebaseUserProvider.future);
      if (firebaseUser == null) {
        // ignore: only_throw_errors
        throw 'サインインしていません。';
      }
      await ref.read(userDocumentQueryProvider).update(
            userId: firebaseUser.uid,
            updateUser: UpdateUserDocument(
              nickname: nickname,
            ),
          );
    });
  }
}
