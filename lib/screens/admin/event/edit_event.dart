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

  @override
  void initState() {
    currentDate = widget.sessionModel.date;
    _durationController = TextEditingController(
      text: widget.sessionModel.duration.toString(),
    );
    _lcoationController = TextEditingController(
      text: widget.sessionModel.location,
    );
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
    super.dispose();
  }

  // create a function to validate the form and save the data
  void _saveEvent() async {
    try {
      if (isAdmin(context)) {
        _editEvent();
      } else if (isStudent(context)) {}
    } on Exception catch (e) {
      setState(() {
        _isLoaderVisible = false;
      });

      print('EditEvent Error: $e');
    }
  }

  Future<void> _editEvent() async {
    final String duration = _durationController.text;
    final String location = _lcoationController.text;

    setState(() {
      _isLoaderVisible = true;
    });

    // check if the form is valid
    if (duration.isNotEmpty && location.isNotEmpty) {
      final res = SessionModel(
        id: widget.sessionModel.id,
        title: '',
        date: currentDate,
        time: selectedTime.toString(),
        duration: int.parse(duration),
        location: location,
      );

      await _sessionService.updateSession(
        res,
      );

      setState(() {
        _isLoaderVisible = false;
      });

      Navigator.pop(context, true);
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
            SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  _saveEvent();
                },
                child: Text(isAdmin(context)
                    ? 'Modifier'
                    : isStudent(context)
                        ? 'S\'inscrire '
                        : 'Noter')),
          ],
        ),
      ),
    );
  }
}
