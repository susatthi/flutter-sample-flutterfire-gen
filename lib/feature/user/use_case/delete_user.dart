import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/data/firebase/firebase_auth.dart';
import '../../../core/use_case/use_case.dart';
import '../../../router/router.dart';
import '../state/user_document.dart';

part 'delete_user.g.dart';

@riverpod
class DeleteUserUseCase extends _$DeleteUserUseCase with UseCase {
  @override
  FutureOr<void> build() => initUseCase();

  Future<void> invoke() => guard(() async {
        final firebaseUser = await ref.read(firebaseUserProvider.future);
        if (firebaseUser == null) {
          // ignore: only_throw_errors
          throw 'サインインしていません。';
        }

        // ユーザードキュメントを削除する
        await ref
            .read(userDocumentQueryProvider)
            .delete(userId: firebaseUser.uid);

        // 削除する
        await firebaseUser.delete();

        ref.invalidate(appRouterProvider);
      });
}
