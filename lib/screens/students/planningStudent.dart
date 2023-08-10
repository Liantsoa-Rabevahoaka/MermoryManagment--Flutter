import 'package:flutter/material.dart';


class planningStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: planningStudentForm(),
    );
  }
}

class planningStudentForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avis de Soutenance Master'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AVIS DE SOUTENANCE MASTER',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 15),
            Text('Mention: Ingénierie des Technologies de l\'entreprise'),
            SizedBox(height: 5),
            Text('Parcours: Infrastructure et Cybersécurité'),
            SizedBox(height: 5),
              Text('Lieu d\' Alternance: ...'),
            SizedBox(height: 20),
            Text('Titre: 000000'),
            Text('Par: 000'),
            SizedBox(height: 20),
            Text(
              'Membres de jury:',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text('Président du jury: 0000, grade'),
            SizedBox(height: 5),
            Text('Examinateurs:  0000, grade'),
            SizedBox(height: 5),
            Text('Rapporteurs: 0000, grade'),
            SizedBox(height: 20),
            Text(
              'Date:',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Lieu:',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
