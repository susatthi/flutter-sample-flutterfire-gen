import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/data/firebase/firebase_auth.dart';
import '../../../core/use_case/use_case.dart';
import '../data/user_document.dart';
import '../state/user_document.dart';

part 'update_user_document.g.dart';

@riverpod
class UpdateUserDocumentUseCase extends _$UpdateUserDocumentUseCase
    with UseCase {
  @override
  FutureOr<void> build() => buildInternal();

  Future<void> invoke({
    String? nickname,
  }) =>
      invokeInternal(() async {
        final userId = await ref.read(firebaseUserIdProvider.future);
        await ref.read(userDocumentQueryProvider).update(
              userId: userId,
              updateUser: UpdateUserDocument(
                nickname: nickname,
              ),
            );
      });
}
