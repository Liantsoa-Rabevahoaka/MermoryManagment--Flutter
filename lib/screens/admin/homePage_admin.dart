import 'package:flutter/material.dart';
import '../../models/sessionSoutenance.dart';
import 'jurys_screen.dart';
import 'student_detail_screen.dart';
import '../../models/user_model.dart';
import '../../services/student_service.dart';
import 'studentList.dart';

class Index extends StatefulWidget {

  final SessionSoutenanceModel session;

  Index({required this.session});


  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            // width: double.infinity,
            // height: double.infinity,
            // color: Colors.redAccent,
             decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage('images/soutenance.jpg'), // Chemin de l'image dans les assets
          fit: BoxFit.cover,
          ),
        ),
            child: Center(
              child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Afficher les informations de session
                    Column(
                     
                      children: [
                        Text('Annee: ${widget.session.annee}',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text('Type: ${widget.session.type}',
                         style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text('Code d\' entree: ${widget.session.code}',
                         style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                    // Espacement entre les informations de session et les boutons
                    SizedBox(height: 20),
                    // Boutons d'accès aux listes
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              onPrimary: Colors.white,
                              primary: Color.fromARGB(255, 5, 12, 66),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => StudentList(session: widget.session),
                                ),
                              );
                            },
                            child: Text('Voir la liste des étudiants'),
                          ),
                          Spacer(),
                           SizedBox(height: 10), 
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              onPrimary: Colors.white,
                              primary: Color.fromARGB(255, 5, 12, 66),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Juryscreen(session: widget.session),
                                ),
                              );
                            },
                            child: const Text('Voir la liste des Jury'),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ]
              ),
            ),
          ),
        )
    );
  }
}


  
