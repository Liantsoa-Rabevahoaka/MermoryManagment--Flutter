import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/screens/home/student_home_screen.dart';

import '../../services/auth_service.dart';

class SignInScreen extends StatelessWidget {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _authService.isLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Affichez un indicateur de chargement si nécessaire
        }

        final isLoggedIn = snapshot.data ?? false;

        if (isLoggedIn) {
          // Redirigez l'utilisateur vers une autre page car il est déjà connecté
          return StudentHomeScreen(title: 'Flutter Demo Home Page', items: ['test'],);
        }

        // Affichez l'écran de connexion
        return Scaffold(
          appBar: AppBar(title: Text('Connexion')),
          body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(hintText: 'Adresse e-mail'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(hintText: 'Mot de passe'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String email = _emailController.text.trim();
                String password = _passwordController.text.trim();
                User? user = await _authService.signInWithEmail(email, password);
                if (user != null) {
                  print('Success');
                  // L'inscription a réussi, faire ce que vous voulez ici
                } else {
                  print('Error');
                  // L'inscription a échoué, afficher un message d'erreur par exemple
                }
              },
              child: Text('S\'inscrire'),
            ),
          ],
        ),
      ),
        );
      },
    );
  }
}
