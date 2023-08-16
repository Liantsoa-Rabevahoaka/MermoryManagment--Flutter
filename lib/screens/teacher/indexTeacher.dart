import 'package:flutter/material.dart';
import 'package:gestion_de_soutenance/models/sessionSoutenance.dart';
import 'package:gestion_de_soutenance/services/sessionSoutenanceService.dart';

class IndexTeacher extends StatefulWidget {
  const IndexTeacher({Key? key}) : super(key: key);

  @override
  State<IndexTeacher> createState() => _IndexTeacherState();
}

class _IndexTeacherState extends State<IndexTeacher> {
  final SessionSoutenanceService sessionSoutenanceService =
  SessionSoutenanceService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<List<SessionSoutenanceModel>>(
          stream: sessionSoutenanceService.getSessionsStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<SessionSoutenanceModel> sessions = snapshot.data!;
              return ListView.builder(
                itemCount: sessions.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AVIS DE SOUTENANCE ${sessions[index].type} (${sessions[index].annee})',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text('Bonjour Monsieur Rakoto'),
                      SizedBox(height: 5),
                      Text(
                          'Nous sommes ravis de vous annoncer que vous êtes l\'un des membres du jury de la session de Soutenance de ${sessions[index].type} de l\'annee ${sessions[index].annee}.'),
                      SizedBox(height: 5),
                      Text('Votre rôle est \'President de jury.'),
                      SizedBox(height: 20),
                      Text('Bonne journée,'),
                      Text('Admin'),
                      SizedBox(height: 20),
                    ],
                  );
                },
              );

            } else if (snapshot.hasError) {
              // Handle errors if necessary
              return Text('Une erreur est survenue');
            } else {
              // Display a loading indicator while data is being fetched
              return CircularProgressIndicator();
            }
          },
        ),
      ),

    );
  }
}
