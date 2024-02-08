import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/user_document.dart';

part 'is_signed_in.g.dart';

@riverpod
Future<bool> isSignedIn(IsSignedInRef ref) async {
  final userDocument = await ref.watch(userDocumentProvider.future);
  return userDocument != null;
}
