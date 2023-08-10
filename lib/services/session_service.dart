import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/session_model.dart';

class SessionService {
  final CollectionReference _sessionCollection =
      FirebaseFirestore.instance.collection('Session');

  Future<void> addSession(SessionModel session) async {
    try {
      await _sessionCollection.doc(session.id).set({
        'annee': session.annee,
        'type': session.type,
        'code': session.code,
      });
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
          annee: doc[
              'annee'], // Assurez-vous que 'annee' est du type attendu dans SessionModel
          type: doc[
              'type'], // Assurez-vous que 'type' est du type attendu dans SessionModel
          title: doc[
              'title'], // Assurez-vous que 'type' est du type attendu dans SessionModel
          description: doc[
              'description'], // Assurez-vous que 'type' est du type attendu dans SessionModel
          code: doc[
              'code'], // Assurez-vous que 'code' est du type attendu dans SessionModel
        );
      }).toList();
    });
  }
}
