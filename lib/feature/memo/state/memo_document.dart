import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/data/firebase/firebase_auth.dart';
import '../data/memo_document.dart';

part 'memo_document.g.dart';

@riverpod
MemoDocumentQuery memoDocumentQuery(MemoDocumentQueryRef ref) {
  return MemoDocumentQuery();
}

@riverpod
Stream<List<ReadMemoDocument>> memoDocuments(MemoDocumentsRef ref) {
  final userId = ref.watch(firebaseUserIdProvider).valueOrNull;
  if (userId == null) {
    return Stream.value([]);
  }
  return ref.watch(memoDocumentQueryProvider).subscribeDocuments(
        userId: userId,
        queryBuilder: (query) => query.orderBy('createdAt', descending: true),
      );
}
