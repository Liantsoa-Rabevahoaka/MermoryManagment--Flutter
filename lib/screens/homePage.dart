import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../utils/navigation.dart';

import 'authentification/login.dart';
import 'authentification/register.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _authService = AuthService();
  bool visible = true;

  toggle() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _authService.isLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        final isLoggedIn = snapshot.data ?? false;

        if (isLoggedIn) {
          handleLoggedInUser(isLoggedIn, context);
        } else {
          return visible ? Login(toggle) : Register(toggle);
        }

        return CircularProgressIndicator();
      },
    );
  }
}
