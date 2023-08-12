import 'package:flutter/material.dart';
import 'package:gestion_de_soutenance/components/pickers/date_picker.dart';
import 'package:gestion_de_soutenance/components/pickers/time_picker.dart';
import 'package:gestion_de_soutenance/services/session_service.dart';
import 'package:gestion_de_soutenance/utils/auth.dart';
import 'package:gestion_de_soutenance/utils/dates.dart';
import 'package:gestion_de_soutenance/utils/random.dart';
import '../../../models/session_model.dart';

class EditEvent extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final SessionModel sessionModel;
  final Function(DateTime) updateSelectedDate;

  const EditEvent({
    required this.firstDate,
    required this.lastDate,
    required this.sessionModel,
    required this.updateSelectedDate,
  });

  @override
  _EditEventState createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  SessionService _sessionService = SessionService();
  bool _isLoaderVisible = false;

  DateTime currentDate = DateTime.now();
  DateTime selectedTime = DateTime.now();

  late TextEditingController _durationController;
  late TextEditingController _lcoationController;
  late TextEditingController _titleController;
  
  get userId => null;
  
  get id => null;
// G4J8QFM8028
  @override
  void initState() {
    currentDate = widget.sessionModel.date;
    _durationController = TextEditingController(
      text: widget.sessionModel.duration.toString(),
    );
    _lcoationController = TextEditingController(
      text: widget.sessionModel.location,
    );
    _titleController = TextEditingController();

    super.initState();
  }

  void updateCurrentDate(DateTime newDate) {
    setState(() {
      currentDate = newDate;
    });
    widget.updateSelectedDate(newDate);
  }

  void updateSelectedTime(DateTime newTime) {
    setState(() {
      selectedTime = newTime;
    });
  }

  @override
  void dispose() {
    _durationController.dispose();
    _lcoationController.dispose();
    _titleController.dispose();    
    super.dispose();
  }

  // create a function to validate the form and save the data
  void _saveEvent() async {
    try {
      if (isAdmin(context)) {
        // _editEvent();
      } else if (isStudent(context)) {}
    } on Exception catch (e) {
      setState(() {
        _isLoaderVisible = false;
      });

      print('EditEvent Error: $e');
    }
  }

Future<void> _editEvent(SessionModel updatedSession) async {
  setState(() {
    _isLoaderVisible = true;
  });

  try {
    await _sessionService.updateSession(updatedSession);
    setState(() {
      _isLoaderVisible = false;
    });
    Navigator.pop(context, true);
  } catch (e) {
    setState(() {
      _isLoaderVisible = false;
    });
    print('EditEvent Error: $e');
  }
}


void _registerForEvent() {
  final String title = _titleController.text;

  var user;
  final updatedSession = SessionModel(
    id: widget.sessionModel.id,
    title: title,
    date: currentDate,
    time: selectedTime.toString(),
    duration: int.parse(_durationController.text),
    location: _lcoationController.text,
    userId: user.userId, // Supposons que user est l'utilisateur actuel
  );

  _editEvent(updatedSession);
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
            DatePicker(
                enabled: isAdmin(context),
                selectedDate: widget.sessionModel.date,
                updateSelectedDate: updateCurrentDate),
            SizedBox(height: 16),
            TimePicker(
                enabled: isAdmin(context),
                selectedTime: DateUtil.parseDateTime(widget.sessionModel.time),
                updateSelectedTime: updateSelectedTime),
            TextField(
              enabled: isAdmin(context),
              controller: _durationController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Duree en heure'),
            ),
            TextField(
              enabled: isAdmin(context),
              controller: _lcoationController,
              decoration: InputDecoration(labelText: 'Lieu'),
            ),
            if (isStudent(context)) // Afficher le formulaire pour les étudiants seulement
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(labelText: 'Titre de Soutenance'),
                  ),
                ],
              ),            
            SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () {
            //     if (isAdmin(context)) {
            //       _editEvent(SessionModel(
            //         id: id,
            //         date: date,
            //         time: time, 
            //         duration: duration, 
            //         location: location, 
            //         userId: userId));
            //     } else if (isStudent(context)) {
            //       _registerForEvent();
            //     }
            //   },
            //   child: Text(isAdmin(context) ? 'Modifier' : 'S\'inscrire'),
            // ),
          ],
        ),
      ),
    );
  }
}


