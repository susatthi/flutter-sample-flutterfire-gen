import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_gen_annotation/flutterfire_gen_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/data/firebase/firebase_auth.dart';

part 'user_document.flutterfire_gen.dart';
part 'user_document.g.dart';

@FirestoreDocument(path: 'user/{userId}')
class UserDocument {
  const UserDocument({
    required this.nickname,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? nickname;

  @alwaysUseFieldValueServerTimestampWhenCreating
  final DateTime? createdAt;

  @alwaysUseFieldValueServerTimestampWhenCreating
  @alwaysUseFieldValueServerTimestampWhenUpdating
  final DateTime? updatedAt;
}

@riverpod
UserDocumentQuery userDocumentQuery(UserDocumentQueryRef ref) {
  return UserDocumentQuery();
}

@riverpod
Stream<ReadUserDocument?> userDocument(UserDocumentRef ref) {
  final firebaseUser = ref.watch(firebaseUserProvider).valueOrNull;
  if (firebaseUser == null) {
    return Stream.value(null);
  }
  return ref
      .watch(userDocumentQueryProvider)
      .subscribeDocument(userId: firebaseUser.uid);
}
