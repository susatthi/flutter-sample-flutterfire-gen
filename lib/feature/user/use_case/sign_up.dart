import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/data/firebase/firebase_auth.dart';
import '../../../core/use_case/use_case.dart';
import '../../../router/router.dart';
import '../data/user_document.dart';
import '../state/user_document.dart';

part 'sign_up.g.dart';

@riverpod
class SignUpUseCase extends _$SignUpUseCase with UseCase {
  @override
  FutureOr<void> build() => buildInternal();

  Future<void> invoke() => invokeInternal(() async {
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
