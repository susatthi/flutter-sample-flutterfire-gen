import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_gen_annotation/flutterfire_gen_annotation.dart';

part 'memo_document.flutterfire_gen.dart';

@FirestoreDocument(path: 'user/{userId}/memo/{memoId}')
class MemoDocument {
  const MemoDocument({
    required this.text,
    required this.createdAt,
    required this.updatedAt,
  });

  @CreateDefault('')
  final String text;

  @alwaysUseFieldValueServerTimestampWhenCreating
  final DateTime? createdAt;

  @alwaysUseFieldValueServerTimestampWhenCreating
  @alwaysUseFieldValueServerTimestampWhenUpdating
  final DateTime? updatedAt;
}
