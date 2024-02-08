import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/data/firebase/firebase_auth.dart';
import '../../../router/router.dart';
import '../state/user_document.dart';

part 'sign_out.g.dart';

@riverpod
class SignOutUseCase extends _$SignOutUseCase {
  @override
  FutureOr<void> build() => null;

  Future<void> invoke() async {
    if (state.isLoading) {
      return;
    }
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final userId = await ref.read(firebaseUserIdProvider.future);

      // ユーザードキュメントを削除する
      await ref.read(userDocumentQueryProvider).delete(userId: userId);

      // サインアウトする
      await ref.read(firebaseAuthProvider).signOut();

      ref.invalidate(appRouterProvider);
    });
  }
}
