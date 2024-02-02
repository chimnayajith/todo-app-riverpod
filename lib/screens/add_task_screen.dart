import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/widgets/color_picker.dart';
import 'package:todo_app/widgets/common_text_field.dart';
import 'package:todo_app/widgets/date_picker.dart';
import 'package:todo_app/widgets/priority_selector.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  const AddTaskScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add New Task"),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
                height: MediaQuery.of(context).size.height -
                    kToolbarHeight -
                    (MediaQuery.of(context).padding.vertical * 2),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CommonTextFied(
                            title: "Task Title",
                            hintText: "Enter task title",
                            controller: _titleController,
                            maxLines: 1,
                            maxLength: 25,
                            prefixIcon: Icons.assignment_rounded,
                          ),
                          const SizedBox(height: 10),
                          CommonTextFied(
                            title: "Task Description",
                            hintText: "Enter task description",
                            controller: _descriptionController,
                            maxLines: 5,
                            maxLength: 100,
                          ),
                          const SizedBox(height: 10),
                          DatePicker(),
                          const SizedBox(height: 20),
                          const SizedBox(height: 20),
                          PrioritySelector(),
                          const SizedBox(height: 30),
                          const ColorPicker()
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(250, 50),
                            backgroundColor: const Color(0xffFFBF9B),
                            foregroundColor: Colors.black87),
                        child: const Text(
                          "Add Task",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                      )
                    ],
                  ),
                ))));
  }
}
