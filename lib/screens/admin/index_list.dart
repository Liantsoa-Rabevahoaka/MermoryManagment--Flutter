import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../../services/auth_service.dart';
import '../admin/event/event_screen.dart';

import 'package:gestion_de_soutenance/screens/admin/homePage_admin.dart';

class AdminHomeScreen extends StatefulWidget {
  AdminHomeScreen();

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int _currentIndex = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    Index(), // Appelé lorsque vous appuyez sur l'icône "Home"
    EventScreen(),  // Appelé lorsque vous appuyez sur l'icône "Users"
    Text(
      'Index 2: School',
    ),
    Text('Index 4: Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    AuthService _authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: Text("My memory"),
        actions: [
          // Bouton de déconnexion dans l'app bar
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => {
              _authService.signOut(),
              // use material page route to redirect to the sign in screen
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => MyApp(),
                ),
              ),
            },
          ),
        ],
      ),
      body: Center(child: _widgetOptions.elementAt(_currentIndex)),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.list),
            title: Text('Listes'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.event),
            title: Text('Planning'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.bar_chart),
            title: Text(
              'resultat ',
            ),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}