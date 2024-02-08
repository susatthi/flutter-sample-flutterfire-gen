import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/data/firebase/firebase_auth.dart';
import '../data/user_document.dart';

part 'user_document.g.dart';

@riverpod
UserDocumentQuery userDocumentQuery(UserDocumentQueryRef ref) {
  return UserDocumentQuery();
}

@riverpod
Stream<ReadUserDocument?> userDocument(UserDocumentRef ref) {
  final asyncValue = ref.watch(firebaseUserIdProvider);
  return asyncValue.when(
    data: (userId) =>
        ref.watch(userDocumentQueryProvider).subscribeDocument(userId: userId),
    // ignore: only_throw_errors
    error: (err, stack) => throw err,
    loading: Stream.empty,
  );
}
