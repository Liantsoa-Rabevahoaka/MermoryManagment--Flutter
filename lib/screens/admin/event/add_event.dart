import 'package:flutter/material.dart';
import 'package:gestion_de_soutenance/components/pickers/date_picker.dart';
import 'package:gestion_de_soutenance/services/session_service.dart';
import 'package:gestion_de_soutenance/utils/random.dart';
import '../../../models/session_model.dart';

class AddEvent extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime selectedDate;
  final Function(DateTime) updateSelectedDate;

  const AddEvent({
    required this.firstDate,
    required this.lastDate,
    required this.selectedDate,
    required this.updateSelectedDate,
  });

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  SessionService _sessionService = SessionService();
  bool _isLoaderVisible = false;

  DateTime currentDate = DateTime.now();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _lcoationController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    currentDate = widget.selectedDate;
    super.initState();
  }

  @override
  void dispose() {
    _timeController.dispose();
    _durationController.dispose();
    _lcoationController.dispose();
    super.dispose();
  }

  // create a function to validate the form and save the data
  void _saveEvent() async {
    try {
      final String time = _timeController.text;
      final String duration = _durationController.text;
      final String location = _lcoationController.text;

      setState(() {
        _isLoaderVisible = true;
      });

      // check if the form is valid
      if (time.isNotEmpty && duration.isNotEmpty && location.isNotEmpty) {
        await _sessionService.addSession(SessionModel(
          id: RandomUtils.generateId(),
          title: '',
          date: widget.selectedDate,
          time: time,
          duration: int.parse(duration),
          location: location,
        ));

        setState(() {
          _isLoaderVisible = false;
        });

        Navigator.pop(context);
      }
    } on Exception catch (e) {
      setState(() {
        _isLoaderVisible = false;
      });

      print('AddEvent Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Event')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChildWidget(
                selectedDate: widget.selectedDate,
                updateSelectedDate: widget.updateSelectedDate),
            Text(
              "${currentDate.toLocal()}".split(' ')[0],
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(labelText: 'Heure de debut'),
            ),
            TextField(
              controller: _durationController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Duree en heure'),
            ),
            TextField(
              controller: _lcoationController,
              decoration: InputDecoration(labelText: 'Lieu'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _saveEvent();
              },
              child: Text('Add Event'),
            ),
          ],
        ),
      ),
    );
  }
}
