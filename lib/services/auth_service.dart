import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Méthode pour s'inscrire avec une adresse e-mail et un mot de passe
  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );


      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // Enregistrez l'état de connexion de l'utilisateur dans shared_preferences
      await prefs.setBool('isLoggedIn', true);

      return result.user;
    } catch (e) {
      print("Erreur lors de l'inscription : $e");
      return null;
    }
  }

  // Méthode pour se connecter avec une adresse e-mail et un mot de passe
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Enregistrez l'état de connexion de l'utilisateur dans shared_preferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setBool('isLoggedIn', true);

      return result.user;
    } catch (e) {
      print("Erreur lors de la connexion : $e");
      return null;
    }
  }

  // Méthode pour se déconnecter
  Future<void> signOut() async {
    try {
      await _auth.signOut();

      // Réinitialisez l'état de connexion de l'utilisateur dans shared_preferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);
    } catch (e) {
      print("Erreur lors de la déconnexion : $e");
    }
  }

  // Méthode pour vérifier si l'utilisateur est connecté
  Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
