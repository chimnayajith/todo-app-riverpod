import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task_card.dart';
import 'package:todo_app/widgets/todo_stats.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
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
          const Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  TaskCard(),
                  SizedBox(height: 20),
                  TaskCard(),
                  SizedBox(height: 20),
                  TaskCard(),
                  SizedBox(height: 20),
                  TaskCard(),
                  SizedBox(height: 70),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
