import 'package:flutter/material.dart';
import '../../../models/event.dart';

class AddEvent extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime selectedDate;

  const AddEvent({
    required this.firstDate,
    required this.lastDate,
    required this.selectedDate,
  });

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _anneeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Event')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _anneeController,
              decoration: InputDecoration(labelText: 'Annee'),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String title = _titleController.text.trim();
                String description = _descriptionController.text.trim();
                DateTime date = widget.selectedDate;

                // ignore: unused_local_variable
                Event newEvent = Event(
                  title: title,
                  description: description,
                  date: date, id: '',
                  // Add any other necessary properties
                );

                // Implement your logic to add the new event to Firestore
                // For example:
                // eventService.addEvent(newEvent);

                Navigator.pop(context, true);
              },
              child: Text('Add Event'),
            ),
          ],
        ),
      ),
    );
  }
}
