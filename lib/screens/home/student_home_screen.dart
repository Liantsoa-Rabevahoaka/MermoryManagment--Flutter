import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../../services/auth_service.dart';
import '../auth/signin_screen.dart';

class StudentHomeScreen extends StatelessWidget {
  final String title;
  final List<String> items;

  StudentHomeScreen({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    AuthService _authService = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          // Bouton de déconnexion dans l'app bar
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => {
              _authService.signOut(),
              // use material page route to redirect to the sign in screen
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => SignInScreen(),
                ),
              ),
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}
