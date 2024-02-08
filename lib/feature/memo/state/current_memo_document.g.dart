// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_memo_document.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentMemoIdHash() => r'e567cc8db5a265c257962431b644ec1bb8c88b29';

/// See also [currentMemoId].
@ProviderFor(currentMemoId)
final currentMemoIdProvider = AutoDisposeProvider<String>.internal(
  currentMemoId,
  name: r'currentMemoIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentMemoIdHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef CurrentMemoIdRef = AutoDisposeProviderRef<String>;
String _$currentMemoDocumentHash() =>
    r'6b0511c5e4bd6898997da94f34a2171c3a35ebce';

/// See also [currentMemoDocument].
@ProviderFor(currentMemoDocument)
final currentMemoDocumentProvider =
    AutoDisposeFutureProvider<ReadMemoDocument?>.internal(
  currentMemoDocument,
  name: r'currentMemoDocumentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentMemoDocumentHash,
  dependencies: <ProviderOrFamily>[currentMemoIdProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    currentMemoIdProvider,
    ...?currentMemoIdProvider.allTransitiveDependencies
  },
);

typedef CurrentMemoDocumentRef
    = AutoDisposeFutureProviderRef<ReadMemoDocument?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
