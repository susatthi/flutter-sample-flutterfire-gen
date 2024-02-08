// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_memo_document.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deleteMemoDocumentUseCaseHash() =>
    r'a392113873b79fe780a0303eb1ae9a0aabe9148d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$DeleteMemoDocumentUseCase
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String memoId;

  FutureOr<void> build(
    String memoId,
  );
}

/// See also [DeleteMemoDocumentUseCase].
@ProviderFor(DeleteMemoDocumentUseCase)
const deleteMemoDocumentUseCaseProvider = DeleteMemoDocumentUseCaseFamily();

/// See also [DeleteMemoDocumentUseCase].
class DeleteMemoDocumentUseCaseFamily extends Family<AsyncValue<void>> {
  /// See also [DeleteMemoDocumentUseCase].
  const DeleteMemoDocumentUseCaseFamily();

  /// See also [DeleteMemoDocumentUseCase].
  DeleteMemoDocumentUseCaseProvider call(
    String memoId,
  ) {
    return DeleteMemoDocumentUseCaseProvider(
      memoId,
    );
  }

  @override
  DeleteMemoDocumentUseCaseProvider getProviderOverride(
    covariant DeleteMemoDocumentUseCaseProvider provider,
  ) {
    return call(
      provider.memoId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteMemoDocumentUseCaseProvider';
}

/// See also [DeleteMemoDocumentUseCase].
class DeleteMemoDocumentUseCaseProvider
    extends AutoDisposeAsyncNotifierProviderImpl<DeleteMemoDocumentUseCase,
        void> {
  /// See also [DeleteMemoDocumentUseCase].
  DeleteMemoDocumentUseCaseProvider(
    String memoId,
  ) : this._internal(
          () => DeleteMemoDocumentUseCase()..memoId = memoId,
          from: deleteMemoDocumentUseCaseProvider,
          name: r'deleteMemoDocumentUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteMemoDocumentUseCaseHash,
          dependencies: DeleteMemoDocumentUseCaseFamily._dependencies,
          allTransitiveDependencies:
              DeleteMemoDocumentUseCaseFamily._allTransitiveDependencies,
          memoId: memoId,
        );

  DeleteMemoDocumentUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.memoId,
  }) : super.internal();

  final String memoId;

  @override
  FutureOr<void> runNotifierBuild(
    covariant DeleteMemoDocumentUseCase notifier,
  ) {
    return notifier.build(
      memoId,
    );
  }

  @override
  Override overrideWith(DeleteMemoDocumentUseCase Function() create) {
    return ProviderOverride(
      origin: this,
      override: DeleteMemoDocumentUseCaseProvider._internal(
        () => create()..memoId = memoId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        memoId: memoId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DeleteMemoDocumentUseCase, void>
      createElement() {
    return _DeleteMemoDocumentUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteMemoDocumentUseCaseProvider && other.memoId == memoId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, memoId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteMemoDocumentUseCaseRef
    on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `memoId` of this provider.
  String get memoId;
}

class _DeleteMemoDocumentUseCaseProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DeleteMemoDocumentUseCase,
        void> with DeleteMemoDocumentUseCaseRef {
  _DeleteMemoDocumentUseCaseProviderElement(super.provider);

  @override
  String get memoId => (origin as DeleteMemoDocumentUseCaseProvider).memoId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
