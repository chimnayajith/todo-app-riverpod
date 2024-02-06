import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/repositories/task_repository.dart';

final currentIndexProvider = StateProvider<int>((ref) {
  return 0;
});

final dateProvider = AutoDisposeStateProvider<DateTime>((ref) {
  return DateTime.now();
});

final priorityProvider = AutoDisposeStateProvider<String>((ref) {
  return "low";
});

final colorProvider = AutoDisposeStateProvider<int>((ref) {
  return 0xFFCEF2FE;
});

final allTasksProvider = FutureProvider<List<Task>>((ref) async {
  TaskRepository taskRepository = TaskRepository();
  List<Task> todo = await taskRepository.getAllTasks();
  return todo;
});
