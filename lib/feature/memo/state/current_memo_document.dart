import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/data/firebase/firebase_auth.dart';
import '../data/memo_document.dart';
import 'memo_document.dart';

part 'current_memo_document.g.dart';

@Riverpod(dependencies: [])
String currentMemoId(CurrentMemoIdRef ref) {
  throw UnimplementedError();
}

@Riverpod(dependencies: [currentMemoId])
Future<ReadMemoDocument?> currentMemoDocument(
  CurrentMemoDocumentRef ref,
) async {
  final memoId = ref.watch(currentMemoIdProvider);
  final userId = await ref.watch(firebaseUserIdProvider.future);
  return ref
      .watch(memoDocumentQueryProvider)
      .fetchDocument(userId: userId, memoId: memoId);
}
