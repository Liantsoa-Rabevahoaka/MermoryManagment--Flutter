import 'package:flutter/material.dart';

import '../../../components/texts/text_with_icon.dart';
import '../../../models/session_model.dart';

class EventItem extends StatelessWidget {
  final SessionModel event;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  EventItem({
    required this.event,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final bool isAvailable = event.title == null || event.title!.isEmpty;
    final Color bgColor = isAvailable ? Colors.green : Colors.red;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Disponible',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isAvailable ? Colors.green : Colors.red,
                  ),
                ),
                SizedBox(height: 16),
                TextWithIcon(
                  icon: Icons.access_time,
                  text: event.time,
                ),
                SizedBox(height: 4),
                TextWithIcon(
                  icon: Icons.date_range,
                  text: event.date.toString(),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     IconButton(
                //       onPressed: onDelete,
                //       icon: Icon(Icons.delete),
                //       color: Colors.red,
                //     ),
                //     IconButton(
                //       onPressed: onEdit,
                //       icon: Icon(Icons.edit),
                //       color: Colors.blue,
                //     ),
                //   ],
                // ),
              ],
            ),
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  '${event.duration}h',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
