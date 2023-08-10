import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestion_de_soutenance/screens/welcome/welcome_screen.dart';
import '../screens/home/admin_home_screen.dart';
import '../screens/home/student_home_screen.dart';
import '../services/auth_service.dart';

Future<void> handleLoggedInUser(bool isLoggedIn, BuildContext context) async {
  AuthService _authService = AuthService();

  // Redirigez l'utilisateur vers une autre page car il est déjà connecté
  _authService.getCurrentUser().then((user) {
    if (user != null) {
      if (user.role == 'student') {
        print('User is student');

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => StudentHomeScreen(
              title: 'TEST',
              items: ['List'],
            ),
          ),
        );
      } else if (user.role == 'admin') {
        // Redirigez l'utilisateur vers une autre page car il est déjà connecté
        print('User is admin');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => WelcomeScreen()),
        );
      } else if (user.role == 'teacher') {
        // Redirigez l'utilisateur vers une autre page car il est déjà connecté
        print('User is teacher');
      } else {
        print('Verifier Adresse emmail et votre mot de passe');
      }
    }
  });
}
