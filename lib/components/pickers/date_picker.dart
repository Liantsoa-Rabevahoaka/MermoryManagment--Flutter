import 'package:flutter/material.dart';

class ChildWidget extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) updateSelectedDate;

  ChildWidget({required this.selectedDate, required this.updateSelectedDate});

  @override
  State<ChildWidget> createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  DateTime currentDate = DateTime.now();

  @override
  void initState() {
    currentDate = widget.selectedDate;
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      currentDate: currentDate,
    );

    if (picked != null && picked != widget.selectedDate) {
      setState(() {
        currentDate = picked;
      });
      widget.updateSelectedDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Title',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Selected Date:'),
              Text("${currentDate.toLocal()}".split(' ')[0]),
            ],
          ),
        ),
      ],
    );
  }
}
