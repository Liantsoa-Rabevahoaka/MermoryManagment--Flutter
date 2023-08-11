import 'package:flutter/material.dart';
import 'package:gestion_de_soutenance/models/session_model.dart';
import '../../../models/event.dart';

class EventItem extends StatelessWidget {
  final SessionModel event;
  final VoidCallback onDelete;
  final VoidCallback? onTap;

  const EventItem({
    required this.event,
    required this.onDelete,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(event.title ?? 'Disponible'),
      subtitle: Text(event.date.toString()),
      onTap: onTap,
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}
