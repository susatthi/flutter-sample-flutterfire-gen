import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_gen_annotation/flutterfire_gen_annotation.dart';

part 'user_document.flutterfire_gen.dart';

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
