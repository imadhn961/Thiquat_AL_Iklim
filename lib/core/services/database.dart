abstract class Database {
  // Returns the id of the created document (either the passed-in
  // documentId, or the auto-generated one when documentId is omitted).
  Future<String> createData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future<Map<String, dynamic>?> readData({
    required String path,
    required String documentId,
  });

  // Real-time listener on a single document, emitting null if it doesn't
  // (or no longer) exists.
  Stream<Map<String, dynamic>?> streamData({
    required String path,
    required String documentId,
  });

  Future<List<Map<String, dynamic>>> readCollection({required String path});

  // Server-side equality filter on one or more fields, e.g. filtering the
  // "users" collection to role == "specialist" && specialization == "electrician".
  Future<List<Map<String, dynamic>>> readCollectionWhere({
    required String path,
    required Map<String, dynamic> filters,
  });

  // Real-time listener on a collection filtered by field equality. Re-emits
  // the whole matching set on every change. Each emitted map is a document's
  // data with its id added under the 'id' key.
  Stream<List<Map<String, dynamic>>> streamCollectionWhere({
    required String path,
    required Map<String, dynamic> filters,
  });

  Future<void> updateData({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  });
  Future<void> deleteData({required String path, required String documentId});
}
