import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/session_model.dart';

class SessionService {
  final CollectionReference _sessionCollection =
      FirebaseFirestore.instance.collection('Sessions');

  Future<void> addSession(SessionModel session) async {
    try {
      await _sessionCollection.doc().set(session.ToFirestore());
    } catch (e) {
      print(' Error adding session: $e');
    }
  }

  Stream<List<SessionModel>> getSession() {
    // Écoute les snapshots de la collection de sessions
    return _sessionCollection.snapshots().map((snapshot) {
      // Transforme chaque document snapshot en une liste d'objets SessionModel
      return snapshot.docs.map((doc) {
        return SessionModel(
          id: doc.id,
          title: doc['title'] ?? '',
          date: doc['date'].toDate() ?? '',
          time: doc['time'] ?? '',
          duration: doc['duration'] ?? '',
          location: doc['location'] ?? '',
        );
      }).toList();
    });
  }

  Future<void> updateSession(SessionModel session) async {
    try {
      await _sessionCollection.doc(session.id).update(session.ToFirestore());
    } catch (e) {
      print('Error updating session: $e');
    }
  }

  Future<void> deleteSession(String id) async {
    try {
      await _sessionCollection.doc(id).delete();
    } catch (e) {
      print('Error deleting session: $e');
    }
  }
}
