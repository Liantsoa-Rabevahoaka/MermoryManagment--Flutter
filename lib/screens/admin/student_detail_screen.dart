import 'package:flutter/material.dart';
import '../../models/user_model.dart';

class StudentDetailScreen extends StatelessWidget {
  final UserModel student;

  StudentDetailScreen({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information',  style: TextStyle(color: Colors.redAccent)),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/etudiant4.jpg'), // Chemin de votre image d'arrière-plan
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 25,
              right: 25,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'welcome',
                          style: TextStyle(
                            fontSize: 22,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          student.name,
                          style: TextStyle(
                            fontSize: 22,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          student.role,
                          style: TextStyle(
                            fontSize: 22,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    /**CircleAvatar(
                      child: Image.asset(
                        'assets/images/user-3331256_640.png',
                        fit: BoxFit.cover,
                      ),
                    ),**/
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nom: ${student.name}',   style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 28, 40, 150),
                  ), ),// Couleur rouge),
                      SizedBox(height: 8),
                      Text('Email: ${student.email}',  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color:  Color.fromARGB(255, 28, 40, 150),
                  ),),
                      SizedBox(height: 8),
                      Text('Age: ${student.age}',  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 28, 40, 150),
                  ),),
                      // Ajoutez d'autres détails que vous souhaitez afficher
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
