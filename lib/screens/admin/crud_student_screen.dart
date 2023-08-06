import 'package:flutter/material.dart';
import 'package:project/models/student_model.dart';
import 'package:project/models/user_model.dart';

import '../../services/student_service.dart';

class CrudStudentScreen extends StatelessWidget {
  final StudentService studentService = StudentService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // Add student
              //TODO: Ajouter une formulaire pour ajouter un étudiant pour enregistrer les données dans firebase
              studentService.addStudent(UserModel(
                id: '4',
                name: 'John Doe',
                email: 'create@gmail.com',
                age: 20,
                password: '',
                role: '',
              ));
            },
            child: Text('Add Student'),
          ),
          Expanded(
            child: StreamBuilder<List<UserModel>>(
              stream: studentService.getStudents(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<UserModel> students = snapshot.data!;
                  return ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(students[index].name),
                        subtitle: Text(students[index].email),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                //TODO: Ajouter une vue pour afficher les détails d'un étudiant
                                // View student details
                                // Add your code here
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                //TODO: Ajouter une formulaire pour modifier un étudiant pour enregistrer les données dans firebase
                                // Edit student details
                                // Add your code here
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                // Delete student
                                studentService
                                    .deleteStudent(students[index].id);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
