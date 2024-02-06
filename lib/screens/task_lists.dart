import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/widgets/task_card.dart';
import 'package:todo_app/widgets/todo_stats.dart';

class TaskList extends ConsumerWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Task>> tasks = ref.watch(allTasksProvider);

    return tasks.when(
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
      data: (tasks) {
        if (tasks.isEmpty) {
          return const Text('No tasks available');
        } else {
          return buildTaskList(tasks);
        }
      },
    );
  }
}

Widget buildTaskList(List<Task> tasks) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
    child: Column(
      children: [
        const Row(
          children: [
            Expanded(
                child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TodoStats(text: "Due"),
                  SizedBox(width: 20),
                  TodoStats(text: "Ongoing"),
                  SizedBox(width: 20),
                  TodoStats(text: "Completed")
                ],
              ),
            ))
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Ongoing",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  foregroundColor: const Color(0xffFFBF9B)),
              child: const Text("See All >", style: TextStyle(fontSize: 14)),
            )
          ],
        ),
        Expanded(
            child: ListView.separated(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  Task task = tasks[index];
                  return TaskCard(task: task);
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20)))
      ],
    ),
  );
}
