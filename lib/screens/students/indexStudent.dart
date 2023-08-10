import 'package:flutter/material.dart';

class IndexStudent extends StatefulWidget {
  const IndexStudent({super.key});

  @override
  State<IndexStudent> createState() => _IndexStudentState();
}

class _IndexStudentState extends State<IndexStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.redAccent,
          child:
          Center(child: Text(style: TextStyle(fontSize: 50),'Bienvenue Etudiant')),
        ),
      ),
    );
  }
}
