import 'package:flutter/material.dart';
import 'student_detail_screen.dart';
import '../../models/user_model.dart';
import '../../services/jury_service.dart';

class Juryscreen extends StatefulWidget {
  @override
  _JuryscreenState createState() => _JuryscreenState();
}

class _JuryscreenState extends State<Juryscreen> {
  final StudentService studentService = StudentService();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listes des jurys'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Ajouter un jury'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(labelText: 'Name'),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(labelText: 'Email'),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: 'Age'),
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          String name = nameController.text.trim();
                          String email = emailController.text.trim();
                          int age = int.tryParse(ageController.text) ?? 0;

                          UserModel student = UserModel(
                            id: '...', // Remplacez par l'ID de l'étudiant (vous pouvez générer un ID unique ici ou laisser vide si Firebase se chargera de le générer)
                            name: name,
                            email: email,
                            age: age,
                            password: '',
                            role: 'jury',
                          );

                          studentService.addStudent(student);

                          Navigator.of(context).pop();
                        },
                        child: Text('Enregistrer'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Annuler'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Ajouter un jury'),
          ),
          Expanded(
            child: StreamBuilder<List<UserModel>>(
              //Affichage etudiants
              stream: studentService.getStudents(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<UserModel> students = snapshot.data!;
                  return ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        //seulement nom et mail
                        title: Text(students[index].name),
                        subtitle: Text(students[index].email),

                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                // View student details
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StudentDetailScreen(
                                      student: students[index],
                                    ),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                _showEditDialog(context, students[index]);
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

void _showEditDialog(BuildContext context, UserModel student) {
  TextEditingController idController = TextEditingController(text: student.id);
  TextEditingController nameController =
      TextEditingController(text: student.name);
  TextEditingController emailController =
      TextEditingController(text: student.email);
  TextEditingController ageController =
      TextEditingController(text: student.age.toString());

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Modifier'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Name:'),
            TextField(
              controller: nameController,
            ),
            SizedBox(height: 16),
            Text('Email:'),
            TextField(
              controller: emailController,
            ),
            SizedBox(height: 16),
            Text('Age:'),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              String id = idController.text.trim();
              String newName = nameController.text.trim();
              String newEmail = emailController.text.trim();
              int newAge = int.tryParse(ageController.text) ?? 0;

              // ignore: prefer_typing_uninitialized_variables

              UserModel student = UserModel(
                id: id, // Remplacez par l'ID de l'étudiant (vous pouvez générer un ID unique ici ou laisser vide si Firebase se chargera de le générer)
                name: newName,
                email: newEmail,
                age: newAge,
                password: '',
                role: '',
              );
              StudentService studentService = StudentService();

              studentService.updateStudent(student);

              Navigator.pop(context);
            },
            child: Text('Enregistrer'),
          ),
        ],
      );
    },
  );
}
