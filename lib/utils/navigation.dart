import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/services/auth_service.dart';

import '../screens/home/student_home_screen.dart';

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
      } else if (user.role == 'teacher') {
        // Redirigez l'utilisateur vers une autre page car il est déjà connecté
        print('User is teacher');
      }
    }
  });
}
