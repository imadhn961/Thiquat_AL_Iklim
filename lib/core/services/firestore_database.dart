import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thiquat_al_iklim/core/services/database.dart';

class FirestoreDatabase implements Database {
  FirestoreDatabase({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  @override
  Future<String> createData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    final collection = _firestore.collection(path);
    if (documentId != null) {
      await collection.doc(documentId).set(data);
      return documentId;
    } else {
      final doc = await collection.add(data);
      return doc.id;
    }
  }

  @override
  Future<Map<String, dynamic>?> readData({
    required String path,
    required String documentId,
  }) async {
    final snapshot = await _firestore.collection(path).doc(documentId).get();
    return snapshot.data();
  }

  @override
  Stream<Map<String, dynamic>?> streamData({
    required String path,
    required String documentId,
  }) {
    return _firestore
        .collection(path)
        .doc(documentId)
        .snapshots()
        .map((snapshot) => snapshot.data());
  }

  @override
  Future<List<Map<String, dynamic>>> readCollection({
    required String path,
  }) async {
    final snapshot = await _firestore.collection(path).get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Future<List<Map<String, dynamic>>> readCollectionWhere({
    required String path,
    required Map<String, dynamic> filters,
  }) async {
    Query<Map<String, dynamic>> query = _firestore.collection(path);
    for (final filter in filters.entries) {
      query = query.where(filter.key, isEqualTo: filter.value);
    }
    final snapshot = await query.get();

    List<Map<String, dynamic>> result = await snapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    return result;
  }

  @override
  Stream<List<Map<String, dynamic>>> streamCollectionWhere({
    required String path,
    required Map<String, dynamic> filters,
  }) {
    Query<Map<String, dynamic>> query = _firestore.collection(path);
    for (final filter in filters.entries) {
      query = query.where(filter.key, isEqualTo: filter.value);
    }
    return query.snapshots().map(
      (snapshot) => snapshot.docs
          .map((doc) => {...doc.data(), 'id': doc.id})
          .toList(),
    );
  }

  @override
  Future<void> updateData({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  }) {
    return _firestore.collection(path).doc(documentId).update(data);
  }

  @override
  Future<void> deleteData({required String path, required String documentId}) {
    return _firestore.collection(path).doc(documentId).delete();
  }
}
