import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/data/firebase/firebase_auth.dart';
import '../../../core/use_case/use_case.dart';
import '../../../router/router.dart';
import '../state/user_document.dart';

part 'sign_out.g.dart';

@riverpod
class SignOutUseCase extends _$SignOutUseCase with UseCase {
  @override
  FutureOr<void> build() => initUseCase();

  Future<void> invoke() => guard(() async {
        final userId = await ref.read(firebaseUserIdProvider.future);

        // ユーザードキュメントを削除する
        await ref.read(userDocumentQueryProvider).delete(userId: userId);

        // サインアウトする
        await ref.read(firebaseAuthProvider).signOut();

        ref.invalidate(appRouterProvider);
      });
}
