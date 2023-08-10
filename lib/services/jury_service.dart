import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/student_model.dart';
import '../models/user_model.dart';
import '../utils/random.dart';

class StudentService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _jurysCollection =  FirebaseFirestore.instance.collection('Users');

  Future<void> addStudent(UserModel student) async {
    try {
      final String password = RandomUtils.generatePassword();

      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: student.email, password: password);

      await _jurysCollection.doc(student.id).set({
        'name': student.name,
        'email': student.email,
        'age': student.age,
        'role': 'jury',
        'password': password,
      });
    } catch (e) {
      print(' Error adding student: $e');
    }
  }

// TODO: Ajout des champs si necessaire
  Stream<List<UserModel>> getStudents() {
    return _jurysCollection.where("role", isEqualTo: "jury").snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => UserModel(
                id: doc.id,
                name: doc['name'],
                email: doc['email'],
                age: doc['age'],
                password: '',
                role: '',
              ))
          .toList();
    });
  }

// TODO: A tester
  Future<void> updateStudent(UserModel student) async {
    await _jurysCollection.doc(student.id).update({
      'name': student.name,
      'email': student.email,
      'age': student.age,
    });
  }

  Future<void> deleteStudent(String id) async {
    await _jurysCollection.doc(id).delete();
  }
}
