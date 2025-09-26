import 'package:uuid/uuid.dart';

class TimeEntry {
  final String id;
  final String projectId;
  final String taskId;
  final Duration duration;
  final DateTime date;
  final String notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  TimeEntry({
    String? id,
    required this.projectId,
    required this.taskId,
    required this.duration,
    required this.date,
    this.notes = '',
    DateTime? createdAt,
    DateTime? updatedAt,
  }) :
    id = id ?? const Uuid().v4(),
    createdAt = createdAt ?? DateTime.now(),
    updatedAt = updatedAt ?? DateTime.now();

  TimeEntry copyWith({
    String? projectId,
    String? taskId,
    Duration? duration,
    DateTime? date,
    String? notes,
    DateTime? updatedAt,
  }) {
    return TimeEntry(
      id: id,
      projectId: projectId ?? this.projectId,
      taskId: taskId ?? this.taskId,
      duration: duration ?? this.duration,
      date: date ?? this.date,
      notes: notes ?? this.notes,
      createdAt: createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectId': projectId,
      'taskId': taskId,
      'duration': duration.inMinutes,
      'date': date.toIso8601String(),
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory TimeEntry.fromJson(Map<String, dynamic> json) {
    return TimeEntry(
      id: json['id'],
      projectId: json['projectId'],
      taskId: json['taskId'],
      duration: Duration(minutes: json['duration']),
      date: DateTime.parse(json['date']),
      notes: json['notes'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  @override
  String toString() {
    return 'TimeEntry(id: $id, projectId: $projectId, taskId: $taskId, duration: ${duration.inMinutes}min, date: $date, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TimeEntry && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}