// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memo_document.dart';

// **************************************************************************
// Generator: FlutterFireGen
// **************************************************************************

class ReadMemoDocument {
  const ReadMemoDocument({
    required this.text,
    required this.createdAt,
    required this.updatedAt,
    required this.memoId,
    required this.path,
    required this.memoReference,
  });

  final String text;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  final String memoId;

  final String path;

  final DocumentReference<ReadMemoDocument> memoReference;

  factory ReadMemoDocument.fromJson(Map<String, dynamic> json) {
    final extendedJson = <String, dynamic>{
      ...json,
    };
    return ReadMemoDocument(
      text: extendedJson['text'] as String,
      createdAt: (extendedJson['createdAt'] as Timestamp?)?.toDate(),
      updatedAt: (extendedJson['updatedAt'] as Timestamp?)?.toDate(),
      memoId: extendedJson['memoId'] as String,
      path: extendedJson['path'] as String,
      memoReference:
          extendedJson['memoReference'] as DocumentReference<ReadMemoDocument>,
    );
  }

  factory ReadMemoDocument.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return ReadMemoDocument.fromJson(<String, dynamic>{
      ...data,
      'memoId': ds.id,
      'path': ds.reference.path,
      'memoReference': ds.reference.parent.doc(ds.id).withConverter(
            fromFirestore: (ds, _) => ReadMemoDocument.fromDocumentSnapshot(ds),
            toFirestore: (obj, _) => throw UnimplementedError(),
          ),
    });
  }

  ReadMemoDocument copyWith({
    String? text,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? memoId,
    String? path,
    DocumentReference<ReadMemoDocument>? memoReference,
  }) {
    return ReadMemoDocument(
      text: text ?? this.text,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      memoId: memoId ?? this.memoId,
      path: path ?? this.path,
      memoReference: memoReference ?? this.memoReference,
    );
  }
}

/// Represents the data structure for creating a new memo document in Cloud Firestore.
///
/// This class is used to define the necessary data for creating a new memo document.
/// `@alwaysUseFieldValueServerTimestampWhenCreating` annotated fields are
/// automatically set to the server's timestamp.
class CreateMemoDocument {
  const CreateMemoDocument({
    required this.text,
  });

  final String text;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'text': text,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
    final jsonPostProcessors = <({String key, dynamic value})>[];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

/// Represents the data structure for updating a memo document in Cloud Firestore.
///
/// This class provides a way to specify which fields of a memo document should
/// be updated. Fields set to `null` will not be updated. It also automatically
/// sets the `@alwaysUseFieldValueServerTimestampWhenUpdating` annotated fields
/// to the server's timestamp upon updating.
class UpdateMemoDocument {
  const UpdateMemoDocument({
    this.text,
    this.createdAt,
  });

  final String? text;

  final DateTime? createdAt;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      if (text != null) 'text': text,
      if (createdAt != null)
        'createdAt': createdAt == null ? null : Timestamp.fromDate(createdAt!),
      'updatedAt': FieldValue.serverTimestamp(),
    };
    final jsonPostProcessors = <({String key, dynamic value})>[];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

/// Represents the data structure for deleting a memo document in Cloud Firestore.
class DeleteMemoDocument {}

/// Reference to the 'memo' collection with a converter for [ReadMemoDocument].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents to [ReadMemoDocument] objects.
CollectionReference<ReadMemoDocument> readMemoCollectionReference({
  required String userId,
}) =>
    FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .collection('memo')
        .withConverter<ReadMemoDocument>(
          fromFirestore: (ds, _) => ReadMemoDocument.fromDocumentSnapshot(ds),
          toFirestore: (_, __) => throw UnimplementedError(),
        );

/// Creates a [DocumentReference] for a specific MemoDocument document.
DocumentReference<ReadMemoDocument> readMemoDocumentReference({
  required String userId,
  required String memoId,
}) =>
    readMemoCollectionReference(
      userId: userId,
    ).doc(memoId);

/// Reference to the 'memo' collection with a converter for [CreateMemoDocument].
/// This enables type-safe create operations in Firestore, converting
/// [CreateMemoDocument] objects to Firestore document data.
CollectionReference<CreateMemoDocument> createMemoCollectionReference({
  required String userId,
}) =>
    FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .collection('memo')
        .withConverter<CreateMemoDocument>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// Creates a [DocumentReference] for a specific MemoDocument document.
DocumentReference<CreateMemoDocument> createMemoDocumentReference({
  required String userId,
  required String memoId,
}) =>
    createMemoCollectionReference(
      userId: userId,
    ).doc(memoId);

/// Reference to the 'memo' collection with a converter for [UpdateMemoDocument].
/// This allows for type-safe update operations in Firestore, converting
/// [UpdateMemoDocument] objects to Firestore document data.
CollectionReference<UpdateMemoDocument> updateMemoCollectionReference({
  required String userId,
}) =>
    FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .collection('memo')
        .withConverter<UpdateMemoDocument>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// Creates a [DocumentReference] for a specific MemoDocument document.
DocumentReference<UpdateMemoDocument> updateMemoDocumentReference({
  required String userId,
  required String memoId,
}) =>
    updateMemoCollectionReference(
      userId: userId,
    ).doc(memoId);

/// Reference to the 'memo' collection with a converter for [DeleteMemoDocument].
/// This reference is used specifically for delete operations and does not
/// support reading or writing data to Firestore.
CollectionReference<DeleteMemoDocument> deleteMemoCollectionReference({
  required String userId,
}) =>
    FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .collection('memo')
        .withConverter<DeleteMemoDocument>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (_, __) => throw UnimplementedError(),
        );

/// Creates a [DocumentReference] for a specific MemoDocument document.
DocumentReference<DeleteMemoDocument> deleteMemoDocumentReference({
  required String userId,
  required String memoId,
}) =>
    deleteMemoCollectionReference(
      userId: userId,
    ).doc(memoId);

/// Reference to the 'memo' collection group with a converter for [ReadMemoDocument].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents from various paths in the 'memo' collection group
/// into [ReadMemoDocument] objects. It facilitates unified handling of 'memo' documents
/// scattered across different locations in Firestore, ensuring consistent
/// data structure and manipulation.
final readMemoCollectionGroupReference = FirebaseFirestore.instance
    .collectionGroup('memo')
    .withConverter<ReadMemoDocument>(
      fromFirestore: (ds, _) => ReadMemoDocument.fromDocumentSnapshot(ds),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// A sealed class that serves as a base for representing batch write operations in Firestore.
///
/// This class is the abstract base for subclasses that define specific types
/// of batch operations, such as creating, updating, or deleting memo documents.
/// It is used as a part of a type hierarchy for batch operations and is not
/// intended for direct instantiation. Instead, it establishes a common
/// interface and structure for various types of batch write operations.
///
/// The use of a sealed class here ensures type safety and polymorphic handling
/// of different batch operation types, while allowing specific implementations
/// in the subclasses.
sealed class BatchWriteMemo {
  const BatchWriteMemo();
}

/// Represents a batch operation for creating a memo document in Firestore.
///
/// This class is used as part of a batch write to Firestore, specifically for
/// creating new memo documents. It encapsulates the ID of the new memo document
/// and the data required for creation.
final class BatchCreateMemo extends BatchWriteMemo {
  const BatchCreateMemo({
    required this.userId,
    required this.memoId,
    required this.createMemo,
  });

  final String userId;

  final String memoId;

  final CreateMemoDocument createMemo;
}

/// Represents a batch operation for updating an existing memo document in Firestore.
///
/// This class is utilized in a batch write process to Firestore, allowing for
/// the update of existing memo documents. It includes the memo document's ID
/// and the data for the update.
final class BatchUpdateMemo extends BatchWriteMemo {
  const BatchUpdateMemo({
    required this.userId,
    required this.memoId,
    required this.updateMemo,
  });

  final String userId;

  final String memoId;

  final UpdateMemoDocument updateMemo;
}

// Represents a batch operation for deleting a memo document in Firestore.
///
/// Used in a batch write to Firestore for deleting a memo document. This class
/// only requires the ID of the memo document to be deleted, as no additional
/// data is needed for deletion.
final class BatchDeleteMemo extends BatchWriteMemo {
  const BatchDeleteMemo({
    required this.userId,
    required this.memoId,
  });

  final String userId;

  final String memoId;
}

/// A service class for managing memo documents in the database.
///
/// This class provides methods to perform CRUD (Create, Read, Update, Delete)
/// operations on memo documents, along with additional utilities like counting
/// documents, and calculating sum and average values for specific fields.
///
/// It includes methods to:
///
/// - Fetch single or multiple [ReadMemoDocument] documents ([fetchDocuments], [fetchDocument]).
/// - Subscribe to real-time updates of single or multiple [ReadMemoDocument] documents ([subscribeDocuments], [subscribeDocument]).
/// - Count documents based on queries ([count]).
/// - Calculate sum ([getSum]) and average ([getAverage]) of specific fields across documents.
/// - Add ([add]), set ([set]), update ([update]), and delete ([delete]) memo documents.
///
/// The class uses Firebase Firestore as the backend, assuming [ReadMemoDocument],
/// [CreateMemoDocument], [UpdateMemoDocument] are models representing the data.
///
/// Usage:
///
/// - To fetch or subscribe to memo documents, or to count them, use the corresponding fetch, subscribe, and count methods.
/// - To modify memo documents, use the methods for adding, setting, updating, or deleting.
/// - To perform aggregate calculations like sum and average, use [getSum] and [getAverage].
///
/// This class abstracts the complexities of direct Firestore usage and provides
/// a straightforward API for memo document operations.
class MemoDocumentQuery {
  /// Fetches a list of [ReadMemoDocument] documents from Cloud Firestore.
  ///
  /// This method retrieves documents based on the provided query and sorts them
  /// if a [compare] function is given. You can customize the query by using the
  /// [queryBuilder] and control the source of the documents with [options].
  /// The [asCollectionGroup] parameter determines whether to fetch documents
  /// from the 'memo' collection directly (false) or as a collection group across
  /// different Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [options] Optional [GetOptions] to define the source of the documents (server, cache).
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [compare] Optional function to sort the ReadMemoDocument documents.
  /// - [asCollectionGroup] Fetch the 'memo' as a collection group if true.
  ///
  /// Returns a list of [ReadMemoDocument] documents.
  Future<List<ReadMemoDocument>> fetchDocuments({
    required String userId,
    GetOptions? options,
    Query<ReadMemoDocument>? Function(Query<ReadMemoDocument> query)?
        queryBuilder,
    int Function(ReadMemoDocument lhs, ReadMemoDocument rhs)? compare,
    bool asCollectionGroup = false,
  }) async {
    Query<ReadMemoDocument> query = asCollectionGroup
        ? readMemoCollectionGroupReference
        : readMemoCollectionReference(
            userId: userId,
          );
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final qs = await query.get(options);
    final result = qs.docs.map((qds) => qds.data()).toList();
    if (compare != null) {
      result.sort(compare);
    }
    return result;
  }

  /// Subscribes to a stream of [ReadMemoDocument] documents from Cloud Firestore.
  ///
  /// This method returns a stream of [ReadMemoDocument] documents, which updates in
  /// real-time based on the database changes. You can customize the query using
  /// [queryBuilder]. The documents can be sorted using the [compare] function.
  /// The [asCollectionGroup] parameter determines whether to query the 'memo'
  /// collection directly (false) or as a collection group across different
  /// Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [compare] Optional function to sort the ReadMemoDocument documents.
  /// - [includeMetadataChanges] Include metadata changes in the stream.
  /// - [excludePendingWrites] Exclude documents with pending writes from the stream.
  /// - [asCollectionGroup] Query the 'memo' as a collection group if true.
  Stream<List<ReadMemoDocument>> subscribeDocuments({
    required String userId,
    Query<ReadMemoDocument>? Function(Query<ReadMemoDocument> query)?
        queryBuilder,
    int Function(ReadMemoDocument lhs, ReadMemoDocument rhs)? compare,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
    bool asCollectionGroup = false,
  }) {
    Query<ReadMemoDocument> query = asCollectionGroup
        ? readMemoCollectionGroupReference
        : readMemoCollectionReference(
            userId: userId,
          );
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    var streamQs =
        query.snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamQs = streamQs.where((qs) => !qs.metadata.hasPendingWrites);
    }
    return streamQs.map((qs) {
      final result = qs.docs.map((qds) => qds.data()).toList();
      if (compare != null) {
        result.sort(compare);
      }
      return result;
    });
  }

  /// Counts the number of memo documents in Cloud Firestore.
  ///
  /// This method returns the count of documents based on the provided query.
  /// You can customize the query by using the [queryBuilder].
  /// The [asCollectionGroup] parameter determines whether to count documents
  /// in the 'memo' collection directly (false) or across various Firestore
  /// paths as a collection group (true). The [source] parameter allows you to
  /// specify whether to count documents from the server or the local cache.
  ///
  /// Parameters:
  ///
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [source] Source of the count, either from the server or local cache.
  /// - [asCollectionGroup] Count the 'memo' as a collection group if true.
  ///
  /// Returns the count of documents as an integer.
  Future<int?> count({
    required String userId,
    Query<ReadMemoDocument>? Function(Query<ReadMemoDocument> query)?
        queryBuilder,
    AggregateSource source = AggregateSource.server,
    bool asCollectionGroup = false,
  }) async {
    Query<ReadMemoDocument> query = asCollectionGroup
        ? readMemoCollectionGroupReference
        : readMemoCollectionReference(
            userId: userId,
          );
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final aggregateQuery = await query.count();
    final aggregateQs = await aggregateQuery.get(source: source);
    return aggregateQs.count;
  }

  /// Returns the sum of the values of the documents that match the query.
  ///
  /// This method returns the sum of the values of the documents that match the query.
  /// You can customize the query by using the [queryBuilder].
  /// The [asCollectionGroup] parameter determines whether to query the 'memo'
  /// collection directly (false) or as a collection group across different
  /// Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [field] The field to sum over.
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [asCollectionGroup] Query the 'memo' as a collection group if true.
  ///
  /// Returns the sum of the values of the documents that match the query.
  Future<double?> getSum({
    required String field,
    required String userId,
    Query<ReadMemoDocument>? Function(Query<ReadMemoDocument> query)?
        queryBuilder,
    AggregateSource source = AggregateSource.server,
    bool asCollectionGroup = false,
  }) async {
    Query<ReadMemoDocument> query = asCollectionGroup
        ? readMemoCollectionGroupReference
        : readMemoCollectionReference(
            userId: userId,
          );
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final aggregateQuery = await query.aggregate(sum(field));
    final aggregateQs = await aggregateQuery.get(source: source);
    return aggregateQs.getSum(field);
  }

  /// Returns the average of the values of the documents that match the query.
  ///
  /// This method returns the average of the values of the documents that match the query.
  /// You can customize the query by using the [queryBuilder].
  /// The [asCollectionGroup] parameter determines whether to query the 'memo'
  /// collection directly (false) or as a collection group across different
  /// Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [field] The field to average over.
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [asCollectionGroup] Query the 'memo' as a collection group if true.
  ///
  /// Returns the average of the values of the documents that match the query.
  Future<double?> getAverage({
    required String field,
    required String userId,
    Query<ReadMemoDocument>? Function(Query<ReadMemoDocument> query)?
        queryBuilder,
    AggregateSource source = AggregateSource.server,
    bool asCollectionGroup = false,
  }) async {
    Query<ReadMemoDocument> query = asCollectionGroup
        ? readMemoCollectionGroupReference
        : readMemoCollectionReference(
            userId: userId,
          );
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final aggregateQuery = await query.aggregate(average(field));
    final aggregateQs = await aggregateQuery.get(source: source);
    return aggregateQs.getAverage(field);
  }

  /// Fetches a single [ReadMemoDocument] document from Cloud Firestore by its ID.
  ///
  /// This method retrieves a specific document using the provided [memoId].
  /// You can control the data retrieval with [GetOptions].
  Future<ReadMemoDocument?> fetchDocument({
    required String userId,
    required String memoId,
    GetOptions? options,
  }) async {
    final ds = await readMemoDocumentReference(
      userId: userId,
      memoId: memoId,
    ).get(options);
    return ds.data();
  }

  /// Subscribes to a stream of a single [ReadMemoDocument] document from Cloud Firestore by its ID.
  ///
  /// This method returns a stream of a single [ReadMemoDocument] document, which updates in
  /// real-time based on the database changes. You can control the data retrieval with [GetOptions].
  Stream<ReadMemoDocument?> subscribeDocument({
    required String userId,
    required String memoId,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    var streamDs = readMemoDocumentReference(
      userId: userId,
      memoId: memoId,
    ).snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamDs = streamDs.where((ds) => !ds.metadata.hasPendingWrites);
    }
    return streamDs.map((ds) => ds.data());
  }

  /// Adds a memo document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createMemoDocument] data.
  Future<DocumentReference<CreateMemoDocument>> add({
    required String userId,
    required CreateMemoDocument createMemo,
  }) =>
      createMemoCollectionReference(
        userId: userId,
      ).add(createMemo);

  /// Sets a memo document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createMemoDocument] data.
  Future<void> set({
    required String userId,
    required String memoId,
    required CreateMemoDocument createMemo,
    SetOptions? options,
  }) =>
      createMemoDocumentReference(
        userId: userId,
        memoId: memoId,
      ).set(createMemo, options);

  /// Updates a memo document in Cloud Firestore.
  ///
  /// This method partially updates the document identified by [memoId] with the
  /// provided [updateMemoDocument] data.
  /// The update is based on the structure defined in `UpdateMemoDocument.toJson()`.
  Future<void> update({
    required String userId,
    required String memoId,
    required UpdateMemoDocument updateMemo,
  }) =>
      updateMemoDocumentReference(
        userId: userId,
        memoId: memoId,
      ).update(updateMemo.toJson());

  /// Deletes a memo document from Cloud Firestore.
  ///
  /// This method deletes an existing document identified by [memoId].
  Future<void> delete({
    required String userId,
    required String memoId,
  }) =>
      deleteMemoDocumentReference(
        userId: userId,
        memoId: memoId,
      ).delete();

  /// Performs a batch write operation in Firestore using a list of [BatchWriteMemo] tasks.
  ///
  /// This function allows for executing multiple Firestore write operations (create, update, delete)
  /// as a single batch. This ensures that all operations either complete successfully or fail
  /// without applying any changes, providing atomicity.
  ///
  /// Parameters:
  ///
  /// - [batchWriteTasks] A list of [BatchWriteMemo] objects, each representing a specific
  /// write operation (create, update, or delete) for Memo documents.
  ///
  /// The function iterates over each task in [batchWriteTasks] and performs the corresponding
  /// Firestore operation. This includes:
  ///
  /// - Creating new documents for tasks of type [BatchCreateMemo].
  /// - Updating existing documents for tasks of type [BatchUpdateMemo].
  /// - Deleting documents for tasks of type [BatchDeleteMemo].
  ///
  /// Returns a `Future<void>` that completes when the batch operation is committed successfully.
  ///
  /// Throws:
  ///
  /// - Firestore exceptions if the batch commit fails or if there are issues with the individual
  /// operations within the batch.
  Future<void> batchWrite(List<BatchWriteMemo> batchWriteTasks) {
    final batch = FirebaseFirestore.instance.batch();
    for (final task in batchWriteTasks) {
      switch (task) {
        case BatchCreateMemo(
            userId: final userId,
            memoId: final memoId,
            createMemo: final createMemo,
          ):
          batch.set(
            createMemoDocumentReference(
              userId: userId,
              memoId: memoId,
            ),
            createMemo,
          );
        case BatchUpdateMemo(
            userId: final userId,
            memoId: final memoId,
            updateMemo: final updateMemo,
          ):
          batch.update(
            updateMemoDocumentReference(
              userId: userId,
              memoId: memoId,
            ),
            updateMemo.toJson(),
          );
        case BatchDeleteMemo(userId: final userId, memoId: final memoId):
          batch.delete(deleteMemoDocumentReference(
            userId: userId,
            memoId: memoId,
          ));
      }
    }
    return batch.commit();
  }
}
