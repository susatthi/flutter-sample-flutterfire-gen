import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/data/firebase/firebase_auth.dart';
import '../../../router/router.dart';
import '../data/user_document.dart';
import '../state/user_document.dart';

part 'sign_up.g.dart';

@riverpod
class SignUpUseCase extends _$SignUpUseCase {
  @override
  FutureOr<void> build() => null;

  Future<void> invoke() async {
    if (state.isLoading) {
      return;
    }
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      // 匿名ユーザーでサインインする
      final credential =
          await ref.read(firebaseAuthProvider).signInAnonymously();

      // ユーザードキュメントを作成する
      final firebaseUser = credential.user;
      await ref.read(userDocumentQueryProvider).set(
            userId: firebaseUser!.uid,
            createUser: const CreateUserDocument(),
          );

      ref.invalidate(appRouterProvider);
    });
  }
}
