import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required int id,
    required String title,
    required String description,
    required DateTime dueDate,
    required DateTime createdAt,
    required DateTime updatedAt,
    required bool isCompleted,
    required String priority,
    required String cardColor,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
