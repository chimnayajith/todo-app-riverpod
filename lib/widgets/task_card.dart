import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, this.task});

  final dynamic task;
  @override
  Widget build(BuildContext context) {
    final priorityColors = {
      "low": const Color.fromARGB(255, 63, 161, 75),
      "medium": const Color.fromARGB(255, 253, 140, 0),
      "high": const Color.fromARGB(255, 220, 0, 0)
    };
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 175,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(task.cardColor)),
      child: Stack(
        children: [
          Positioned(
              top: 20,
              left: 20,
              child: Text(task.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color.fromARGB(255, 27, 28, 30)))),
          Positioned(
            left: 20,
            top: 90,
            width: double.maxFinite,
            child: Row(
              children: [
                const Text(
                  "Priority : ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 27, 28, 30),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: priorityColors[task.priority]),
                  child: Text(
                    "${task.priority[0].toUpperCase()}${task.priority.substring(1).toLowerCase()}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: 120,
            width: double.maxFinite,
            child: Row(
              children: [
                const Text(
                  "Due date : ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 27, 28, 30),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  DateFormat('dd MMM').format(task.dueDate),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 27, 28, 30),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          Positioned(
              top: 10,
              right: 5,
              child: IconButton(
                icon: const Icon(Icons.more_vert,
                    color: Color.fromARGB(255, 27, 28, 30)),
                onPressed: () {},
              ))
        ],
      ),
    );
  }
}
