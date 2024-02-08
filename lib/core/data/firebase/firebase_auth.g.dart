// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_auth.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseAuthHash() => r'7791bf70ce0f01bf991a53a76abc915478673c0b';

/// See also [firebaseAuth].
@ProviderFor(firebaseAuth)
final firebaseAuthProvider = AutoDisposeProvider<FirebaseAuth>.internal(
  firebaseAuth,
  name: r'firebaseAuthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firebaseAuthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseAuthRef = AutoDisposeProviderRef<FirebaseAuth>;
String _$firebaseUserHash() => r'f204d2da99a012048e98d254ec6403f714aefdab';

/// See also [firebaseUser].
@ProviderFor(firebaseUser)
final firebaseUserProvider = AutoDisposeStreamProvider<User?>.internal(
  firebaseUser,
  name: r'firebaseUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firebaseUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseUserRef = AutoDisposeStreamProviderRef<User?>;
String _$firebaseUserIdHash() => r'dbf02945dc53d8ca68c334eebea695122bd84d65';

/// See also [firebaseUserId].
@ProviderFor(firebaseUserId)
final firebaseUserIdProvider = AutoDisposeFutureProvider<String>.internal(
  firebaseUserId,
  name: r'firebaseUserIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseUserIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseUserIdRef = AutoDisposeFutureProviderRef<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
