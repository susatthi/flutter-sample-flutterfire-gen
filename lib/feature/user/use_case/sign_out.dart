import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/data/firebase/firebase_auth.dart';
import '../../../router/router.dart';
import '../data/user_document.dart';

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
      final firebaseUser = await ref.read(firebaseUserProvider.future);
      if (firebaseUser == null) {
        // ignore: only_throw_errors
        throw '既にサインアウトしています。';
      }

      // ユーザードキュメントを削除する
      await ref.read(userDocumentQueryProvider).delete(
            userId: firebaseUser.uid,
          );

      // サインアウトする
      await ref.read(firebaseAuthProvider).signOut();

      ref.invalidate(appRouterProvider);
    });
  }
}
