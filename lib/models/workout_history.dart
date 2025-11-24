import 'workout_session.dart';

class WorkoutHistory {
  final String id;
  final DateTime date;
  final WorkoutSession session;

  WorkoutHistory({
    required this.id,
    required this.date,
    required this.session,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'session': session.toJson(),
    };
  }

  factory WorkoutHistory.fromJson(Map<String, dynamic> json) {
    return WorkoutHistory(
      id: json['id'],
      date: DateTime.parse(json['date']),
      session: WorkoutSession.fromJson(json['session']),
    );
  }

  DateTime get dateOnly => DateTime(date.year, date.month, date.day);
}
