// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_document.dart';

// **************************************************************************
// Generator: FlutterFireGen
// **************************************************************************

class ReadUserDocument {
  const ReadUserDocument({
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.path,
    required this.userReference,
  });

  final DateTime? createdAt;

  final DateTime? updatedAt;

  final String userId;

  final String path;

  final DocumentReference<ReadUserDocument> userReference;

  factory ReadUserDocument.fromJson(Map<String, dynamic> json) {
    final extendedJson = <String, dynamic>{
      ...json,
    };
    return ReadUserDocument(
      createdAt: (extendedJson['createdAt'] as Timestamp?)?.toDate(),
      updatedAt: (extendedJson['updatedAt'] as Timestamp?)?.toDate(),
      userId: extendedJson['userId'] as String,
      path: extendedJson['path'] as String,
      userReference:
          extendedJson['userReference'] as DocumentReference<ReadUserDocument>,
    );
  }

  factory ReadUserDocument.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return ReadUserDocument.fromJson(<String, dynamic>{
      ...data,
      'userId': ds.id,
      'path': ds.reference.path,
      'userReference': ds.reference.parent.doc(ds.id).withConverter(
            fromFirestore: (ds, _) => ReadUserDocument.fromDocumentSnapshot(ds),
            toFirestore: (obj, _) => throw UnimplementedError(),
          ),
    });
  }

  ReadUserDocument copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    String? path,
    DocumentReference<ReadUserDocument>? userReference,
  }) {
    return ReadUserDocument(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userId: userId ?? this.userId,
      path: path ?? this.path,
      userReference: userReference ?? this.userReference,
    );
  }
}

/// Represents the data structure for creating a new user document in Cloud Firestore.
///
/// This class is used to define the necessary data for creating a new user document.
/// `@alwaysUseFieldValueServerTimestampWhenCreating` annotated fields are
/// automatically set to the server's timestamp.
class CreateUserDocument {
  const CreateUserDocument();

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
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

/// Represents the data structure for updating a user document in Cloud Firestore.
///
/// This class provides a way to specify which fields of a user document should
/// be updated. Fields set to `null` will not be updated. It also automatically
/// sets the `@alwaysUseFieldValueServerTimestampWhenUpdating` annotated fields
/// to the server's timestamp upon updating.
class UpdateUserDocument {
  const UpdateUserDocument({
    this.createdAt,
  });

  final DateTime? createdAt;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
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

/// Represents the data structure for deleting a user document in Cloud Firestore.
class DeleteUserDocument {}

/// Reference to the 'user' collection with a converter for [ReadUserDocument].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents to [ReadUserDocument] objects.
final readUserCollectionReference = FirebaseFirestore.instance
    .collection('user')
    .withConverter<ReadUserDocument>(
      fromFirestore: (ds, _) => ReadUserDocument.fromDocumentSnapshot(ds),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// Creates a [DocumentReference] for a specific UserDocument document.
DocumentReference<ReadUserDocument> readUserDocumentReference({
  required String userId,
}) =>
    readUserCollectionReference.doc(userId);

/// Reference to the 'user' collection with a converter for [CreateUserDocument].
/// This enables type-safe create operations in Firestore, converting
/// [CreateUserDocument] objects to Firestore document data.
final createUserCollectionReference = FirebaseFirestore.instance
    .collection('user')
    .withConverter<CreateUserDocument>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// Creates a [DocumentReference] for a specific UserDocument document.
DocumentReference<CreateUserDocument> createUserDocumentReference({
  required String userId,
}) =>
    createUserCollectionReference.doc(userId);

/// Reference to the 'user' collection with a converter for [UpdateUserDocument].
/// This allows for type-safe update operations in Firestore, converting
/// [UpdateUserDocument] objects to Firestore document data.
final updateUserCollectionReference = FirebaseFirestore.instance
    .collection('user')
    .withConverter<UpdateUserDocument>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// Creates a [DocumentReference] for a specific UserDocument document.
DocumentReference<UpdateUserDocument> updateUserDocumentReference({
  required String userId,
}) =>
    updateUserCollectionReference.doc(userId);

/// Reference to the 'user' collection with a converter for [DeleteUserDocument].
/// This reference is used specifically for delete operations and does not
/// support reading or writing data to Firestore.
final deleteUserCollectionReference = FirebaseFirestore.instance
    .collection('user')
    .withConverter<DeleteUserDocument>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// Creates a [DocumentReference] for a specific UserDocument document.
DocumentReference<DeleteUserDocument> deleteUserDocumentReference({
  required String userId,
}) =>
    deleteUserCollectionReference.doc(userId);

/// Reference to the 'user' collection group with a converter for [ReadUserDocument].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents from various paths in the 'user' collection group
/// into [ReadUserDocument] objects. It facilitates unified handling of 'user' documents
/// scattered across different locations in Firestore, ensuring consistent
/// data structure and manipulation.
final readUserCollectionGroupReference = FirebaseFirestore.instance
    .collectionGroup('user')
    .withConverter<ReadUserDocument>(
      fromFirestore: (ds, _) => ReadUserDocument.fromDocumentSnapshot(ds),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// A sealed class that serves as a base for representing batch write operations in Firestore.
///
/// This class is the abstract base for subclasses that define specific types
/// of batch operations, such as creating, updating, or deleting user documents.
/// It is used as a part of a type hierarchy for batch operations and is not
/// intended for direct instantiation. Instead, it establishes a common
/// interface and structure for various types of batch write operations.
///
/// The use of a sealed class here ensures type safety and polymorphic handling
/// of different batch operation types, while allowing specific implementations
/// in the subclasses.
sealed class BatchWriteUser {
  const BatchWriteUser();
}

/// Represents a batch operation for creating a user document in Firestore.
///
/// This class is used as part of a batch write to Firestore, specifically for
/// creating new user documents. It encapsulates the ID of the new user document
/// and the data required for creation.
final class BatchCreateUser extends BatchWriteUser {
  const BatchCreateUser({
    required this.userId,
    required this.createUser,
  });

  final String userId;

  final CreateUserDocument createUser;
}

/// Represents a batch operation for updating an existing user document in Firestore.
///
/// This class is utilized in a batch write process to Firestore, allowing for
/// the update of existing user documents. It includes the user document's ID
/// and the data for the update.
final class BatchUpdateUser extends BatchWriteUser {
  const BatchUpdateUser({
    required this.userId,
    required this.updateUser,
  });

  final String userId;

  final UpdateUserDocument updateUser;
}

// Represents a batch operation for deleting a user document in Firestore.
///
/// Used in a batch write to Firestore for deleting a user document. This class
/// only requires the ID of the user document to be deleted, as no additional
/// data is needed for deletion.
final class BatchDeleteUser extends BatchWriteUser {
  const BatchDeleteUser({
    required this.userId,
  });

  final String userId;
}

/// A service class for managing user documents in the database.
///
/// This class provides methods to perform CRUD (Create, Read, Update, Delete)
/// operations on user documents, along with additional utilities like counting
/// documents, and calculating sum and average values for specific fields.
///
/// It includes methods to:
///
/// - Fetch single or multiple [ReadUserDocument] documents ([fetchDocuments], [fetchDocument]).
/// - Subscribe to real-time updates of single or multiple [ReadUserDocument] documents ([subscribeDocuments], [subscribeDocument]).
/// - Count documents based on queries ([count]).
/// - Calculate sum ([getSum]) and average ([getAverage]) of specific fields across documents.
/// - Add ([add]), set ([set]), update ([update]), and delete ([delete]) user documents.
///
/// The class uses Firebase Firestore as the backend, assuming [ReadUserDocument],
/// [CreateUserDocument], [UpdateUserDocument] are models representing the data.
///
/// Usage:
///
/// - To fetch or subscribe to user documents, or to count them, use the corresponding fetch, subscribe, and count methods.
/// - To modify user documents, use the methods for adding, setting, updating, or deleting.
/// - To perform aggregate calculations like sum and average, use [getSum] and [getAverage].
///
/// This class abstracts the complexities of direct Firestore usage and provides
/// a straightforward API for user document operations.
class UserDocumentQuery {
  /// Fetches a list of [ReadUserDocument] documents from Cloud Firestore.
  ///
  /// This method retrieves documents based on the provided query and sorts them
  /// if a [compare] function is given. You can customize the query by using the
  /// [queryBuilder] and control the source of the documents with [options].
  /// The [asCollectionGroup] parameter determines whether to fetch documents
  /// from the 'user' collection directly (false) or as a collection group across
  /// different Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [options] Optional [GetOptions] to define the source of the documents (server, cache).
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [compare] Optional function to sort the ReadUserDocument documents.
  /// - [asCollectionGroup] Fetch the 'user' as a collection group if true.
  ///
  /// Returns a list of [ReadUserDocument] documents.
  Future<List<ReadUserDocument>> fetchDocuments({
    GetOptions? options,
    Query<ReadUserDocument>? Function(Query<ReadUserDocument> query)?
        queryBuilder,
    int Function(ReadUserDocument lhs, ReadUserDocument rhs)? compare,
    bool asCollectionGroup = false,
  }) async {
    Query<ReadUserDocument> query = asCollectionGroup
        ? readUserCollectionGroupReference
        : readUserCollectionReference;
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

  /// Subscribes to a stream of [ReadUserDocument] documents from Cloud Firestore.
  ///
  /// This method returns a stream of [ReadUserDocument] documents, which updates in
  /// real-time based on the database changes. You can customize the query using
  /// [queryBuilder]. The documents can be sorted using the [compare] function.
  /// The [asCollectionGroup] parameter determines whether to query the 'user'
  /// collection directly (false) or as a collection group across different
  /// Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [compare] Optional function to sort the ReadUserDocument documents.
  /// - [includeMetadataChanges] Include metadata changes in the stream.
  /// - [excludePendingWrites] Exclude documents with pending writes from the stream.
  /// - [asCollectionGroup] Query the 'user' as a collection group if true.
  Stream<List<ReadUserDocument>> subscribeDocuments({
    Query<ReadUserDocument>? Function(Query<ReadUserDocument> query)?
        queryBuilder,
    int Function(ReadUserDocument lhs, ReadUserDocument rhs)? compare,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
    bool asCollectionGroup = false,
  }) {
    Query<ReadUserDocument> query = asCollectionGroup
        ? readUserCollectionGroupReference
        : readUserCollectionReference;
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

  /// Counts the number of user documents in Cloud Firestore.
  ///
  /// This method returns the count of documents based on the provided query.
  /// You can customize the query by using the [queryBuilder].
  /// The [asCollectionGroup] parameter determines whether to count documents
  /// in the 'user' collection directly (false) or across various Firestore
  /// paths as a collection group (true). The [source] parameter allows you to
  /// specify whether to count documents from the server or the local cache.
  ///
  /// Parameters:
  ///
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [source] Source of the count, either from the server or local cache.
  /// - [asCollectionGroup] Count the 'user' as a collection group if true.
  ///
  /// Returns the count of documents as an integer.
  Future<int?> count({
    Query<ReadUserDocument>? Function(Query<ReadUserDocument> query)?
        queryBuilder,
    AggregateSource source = AggregateSource.server,
    bool asCollectionGroup = false,
  }) async {
    Query<ReadUserDocument> query = asCollectionGroup
        ? readUserCollectionGroupReference
        : readUserCollectionReference;
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
  /// The [asCollectionGroup] parameter determines whether to query the 'user'
  /// collection directly (false) or as a collection group across different
  /// Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [field] The field to sum over.
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [asCollectionGroup] Query the 'user' as a collection group if true.
  ///
  /// Returns the sum of the values of the documents that match the query.
  Future<double?> getSum({
    required String field,
    Query<ReadUserDocument>? Function(Query<ReadUserDocument> query)?
        queryBuilder,
    AggregateSource source = AggregateSource.server,
    bool asCollectionGroup = false,
  }) async {
    Query<ReadUserDocument> query = asCollectionGroup
        ? readUserCollectionGroupReference
        : readUserCollectionReference;
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
  /// The [asCollectionGroup] parameter determines whether to query the 'user'
  /// collection directly (false) or as a collection group across different
  /// Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [field] The field to average over.
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [asCollectionGroup] Query the 'user' as a collection group if true.
  ///
  /// Returns the average of the values of the documents that match the query.
  Future<double?> getAverage({
    required String field,
    Query<ReadUserDocument>? Function(Query<ReadUserDocument> query)?
        queryBuilder,
    AggregateSource source = AggregateSource.server,
    bool asCollectionGroup = false,
  }) async {
    Query<ReadUserDocument> query = asCollectionGroup
        ? readUserCollectionGroupReference
        : readUserCollectionReference;
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final aggregateQuery = await query.aggregate(average(field));
    final aggregateQs = await aggregateQuery.get(source: source);
    return aggregateQs.getAverage(field);
  }

  /// Fetches a single [ReadUserDocument] document from Cloud Firestore by its ID.
  ///
  /// This method retrieves a specific document using the provided [userId].
  /// You can control the data retrieval with [GetOptions].
  Future<ReadUserDocument?> fetchDocument({
    required String userId,
    GetOptions? options,
  }) async {
    final ds = await readUserDocumentReference(
      userId: userId,
    ).get(options);
    return ds.data();
  }

  /// Subscribes to a stream of a single [ReadUserDocument] document from Cloud Firestore by its ID.
  ///
  /// This method returns a stream of a single [ReadUserDocument] document, which updates in
  /// real-time based on the database changes. You can control the data retrieval with [GetOptions].
  Stream<ReadUserDocument?> subscribeDocument({
    required String userId,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    var streamDs = readUserDocumentReference(
      userId: userId,
    ).snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamDs = streamDs.where((ds) => !ds.metadata.hasPendingWrites);
    }
    return streamDs.map((ds) => ds.data());
  }

  /// Adds a user document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createUserDocument] data.
  Future<DocumentReference<CreateUserDocument>> add({
    required CreateUserDocument createUser,
  }) =>
      createUserCollectionReference.add(createUser);

  /// Sets a user document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createUserDocument] data.
  Future<void> set({
    required String userId,
    required CreateUserDocument createUser,
    SetOptions? options,
  }) =>
      createUserDocumentReference(
        userId: userId,
      ).set(createUser, options);

  /// Updates a user document in Cloud Firestore.
  ///
  /// This method partially updates the document identified by [userId] with the
  /// provided [updateUserDocument] data.
  /// The update is based on the structure defined in `UpdateUserDocument.toJson()`.
  Future<void> update({
    required String userId,
    required UpdateUserDocument updateUser,
  }) =>
      updateUserDocumentReference(
        userId: userId,
      ).update(updateUser.toJson());

  /// Deletes a user document from Cloud Firestore.
  ///
  /// This method deletes an existing document identified by [userId].
  Future<void> delete({
    required String userId,
  }) =>
      deleteUserDocumentReference(
        userId: userId,
      ).delete();

  /// Performs a batch write operation in Firestore using a list of [BatchWriteUser] tasks.
  ///
  /// This function allows for executing multiple Firestore write operations (create, update, delete)
  /// as a single batch. This ensures that all operations either complete successfully or fail
  /// without applying any changes, providing atomicity.
  ///
  /// Parameters:
  ///
  /// - [batchWriteTasks] A list of [BatchWriteUser] objects, each representing a specific
  /// write operation (create, update, or delete) for User documents.
  ///
  /// The function iterates over each task in [batchWriteTasks] and performs the corresponding
  /// Firestore operation. This includes:
  ///
  /// - Creating new documents for tasks of type [BatchCreateUser].
  /// - Updating existing documents for tasks of type [BatchUpdateUser].
  /// - Deleting documents for tasks of type [BatchDeleteUser].
  ///
  /// Returns a `Future<void>` that completes when the batch operation is committed successfully.
  ///
  /// Throws:
  ///
  /// - Firestore exceptions if the batch commit fails or if there are issues with the individual
  /// operations within the batch.
  Future<void> batchWrite(List<BatchWriteUser> batchWriteTasks) {
    final batch = FirebaseFirestore.instance.batch();
    for (final task in batchWriteTasks) {
      switch (task) {
        case BatchCreateUser(
            userId: final userId,
            createUser: final createUser,
          ):
          batch.set(
            createUserDocumentReference(
              userId: userId,
            ),
            createUser,
          );
        case BatchUpdateUser(
            userId: final userId,
            updateUser: final updateUser,
          ):
          batch.update(
            updateUserDocumentReference(
              userId: userId,
            ),
            updateUser.toJson(),
          );
        case BatchDeleteUser(userId: final userId):
          batch.delete(deleteUserDocumentReference(
            userId: userId,
          ));
      }
    }
    return batch.commit();
  }
}
