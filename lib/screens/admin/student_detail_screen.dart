import 'package:flutter/material.dart';
import 'package:project/models/user_model.dart';

class StudentDetailScreen extends StatelessWidget {
  final UserModel student;

  StudentDetailScreen({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${student.name}'),
            SizedBox(height: 8),
            Text('Email: ${student.email}'),
            SizedBox(height: 8),
            Text('Age: ${student.age}'),
            // Add other details you want to display
          ],
        ),
      ),
    );
  }
}
