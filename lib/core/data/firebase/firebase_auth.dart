import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth.g.dart';

@riverpod
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}

@riverpod
Stream<User?> firebaseUser(FirebaseUserRef ref) {
  return ref.watch(firebaseAuthProvider).userChanges();
}

@riverpod
Future<String> firebaseUserId(FirebaseUserIdRef ref) async {
  final firebaseUser = await ref.watch(firebaseUserProvider.future);
  if (firebaseUser == null) {
    // ignore: only_throw_errors
    throw 'サインインしていません。';
  }
  return firebaseUser.uid;
}
