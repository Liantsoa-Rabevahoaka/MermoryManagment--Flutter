import 'package:flutter/material.dart';
import 'jurys_screen.dart';
import 'student_detail_screen.dart';
import '../../models/user_model.dart';
import '../../services/student_service.dart';
import 'studentList.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.redAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.orange,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => StudentList(),
                    ),
                  );
                },
                child: Text('See the student\'s list'),
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.orange,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Juryscreen(),
                    ),
                  );
                },
                child: const Text('See the judge\'s list'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
