import 'package:flutter/material.dart';
import 'screens/homePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage_in_main(),
    );
  }
}

class HomePage_in_main extends StatefulWidget {
  @override
  _HomePage_in_mainState createState() => _HomePage_in_mainState();
}

class _HomePage_in_mainState extends State<HomePage_in_main> {
  void _onButtonPressed(BuildContext context, String status) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        if (status == "Admin") {
          return HomePage();
        } else if (status == "Étudiants") {
          return EtudiantPage();
        } else if (status == "Jury") {
          return JuryPage();
        }
        return Container(); // Retourne une page vide par défaut (peut être modifié)
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bienvenue sur My Memory 🎓",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 150, 28, 28),
              ),
            ),
            SizedBox(height: 10), // Ajustement de l'espace
            Text(
              "Pour commencer, quel est votre statut?",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30),
            _buildColoredButton(
              onPressed: () => _onButtonPressed(context, "Admin"),
              icon: Icons.security,
              label: "Admin",
              colors: [Color.fromRGBO(68, 140, 216, 1), Color(0xFF1FE9F7)],
            ),
            SizedBox(height: 25),
            _buildColoredButton(
              onPressed: () => _onButtonPressed(context, "Étudiants"),
              icon: Icons.school,
              label: "Étudiants",
              colors: [
                Color.fromRGBO(228, 86, 110, 1),
                Color.fromRGBO(232, 105, 55, 1)
              ],
            ),
            SizedBox(height: 25),
            _buildColoredButton(
              onPressed: () => _onButtonPressed(context, "Jury"),
              icon: Icons.group,
              label: "Jury",
              colors: [Color.fromRGBO(246, 106, 68, 1), Colors.orange],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColoredButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
    required List<Color> colors,
  }) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: colors,
        ),
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(
          label,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onPrimary: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Admin"),
      ),
      body: Center(
        child: Text("Bienvenue sur la page Admin"),
      ),
    );
  }
}

class EtudiantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Étudiants"),
      ),
      body: Center(
        child: Text("Bienvenue sur la page Étudiants"),
      ),
    );
  }
}

class JuryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Jury"),
      ),
      body: Center(
        child: Text("Bienvenue sur la page Jury"),
      ),
    );
  }
}
