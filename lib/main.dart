import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gestion_de_soutenance/components/loader/loader.dart';
import 'package:gestion_de_soutenance/screens/authentification/login_screen.dart';
import 'package:gestion_de_soutenance/utils/navigation.dart';
import 'firebase_options.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

// create a homepage widget to handle auth workflow and note that we are using a _authService.isLoggedIn so you'll need to use FutureBuilder to handle the async call
class HomePage extends StatelessWidget {
  final AuthService _authService = AuthService();

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
          handleLoggedInUser(isLoggedIn, context);
        } else {
          return LoginScreen();
        }

        // Affichez l'écran de connexion
        return Loader();
      },
    );
  }
}
