// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_memo_document.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateMemoDocumentUseCaseHash() =>
    r'36ba4ad03a146e2e06f6e0a9198e88f4d3ad7313';

/// See also [UpdateMemoDocumentUseCase].
@ProviderFor(UpdateMemoDocumentUseCase)
final updateMemoDocumentUseCaseProvider =
    AutoDisposeAsyncNotifierProvider<UpdateMemoDocumentUseCase, void>.internal(
  UpdateMemoDocumentUseCase.new,
  name: r'updateMemoDocumentUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updateMemoDocumentUseCaseHash,
  dependencies: <ProviderOrFamily>[
    updateMemoDocumentNotifierProvider,
    currentMemoIdProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    updateMemoDocumentNotifierProvider,
    ...?updateMemoDocumentNotifierProvider.allTransitiveDependencies,
    currentMemoIdProvider,
    ...?currentMemoIdProvider.allTransitiveDependencies
  },
);

typedef _$UpdateMemoDocumentUseCase = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
