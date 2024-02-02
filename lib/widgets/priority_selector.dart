import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/providers.dart';

class PrioritySelector extends ConsumerWidget {
  PrioritySelector({super.key});

  final priorityColors = {
    "low": const Color.fromARGB(255, 63, 161, 75),
    "medium": const Color.fromARGB(255, 253, 140, 0),
    "high": const Color.fromARGB(255, 220, 0, 0)
  };
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String selectedPriority = ref.watch(priorityProvider);

    Widget buildPriorityButton(String priority) {
      return GestureDetector(
        onTap: () {
          ref.read(priorityProvider.notifier).state = priority;
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.27,
          height: 40,
          decoration: BoxDecoration(
            color: selectedPriority == priority
                ? priorityColors[priority]
                : Colors.grey.shade700,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
              child: Text(
                  "${priority[0].toUpperCase()}${priority.substring(1).toLowerCase()}",
                  style: const TextStyle(fontWeight: FontWeight.bold))),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Priority",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            buildPriorityButton("low"),
            const SizedBox(width: 10),
            buildPriorityButton("medium"),
            const SizedBox(width: 10),
            buildPriorityButton("high"),
          ],
        )
      ],
    );
  }
}
