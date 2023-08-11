import 'package:cloud_firestore/cloud_firestore.dart';

class SessionModel {
  String id;
  String? title;
  DateTime date;
  String time;
  int duration;
  String location;
  SessionModel({
    required this.id,
    this.title,
    required this.date,
    required this.time,
    required this.duration,
    required this.location,
  });
  factory SessionModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      [SnapshotOptions? options]) {
    final data = snapshot.data()!;
    return SessionModel(
      id: snapshot.id,
      title: data['title'] ?? '',
      date: data['date'].toDate(),
      time: data['time'] ?? '',
      duration: data['duration'] ?? 0,
      location: data['location'] ?? '',
    );
  }
  Map<String, Object?> ToFirestore() {
    return {
      'title': title,
      'date': Timestamp.fromDate(date),
      'time': time,
      'duration': duration,
      'location': location,
    };
  }

  Map<String, Object?> ToEditFirestore() {
    return {
      'id': id,
      'title': title,
      'date': Timestamp.fromDate(date),
      'time': time,
      'duration': duration,
      'location': location,
    };
  }
}
