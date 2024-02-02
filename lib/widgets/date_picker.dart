import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/providers.dart';
import 'package:intl/intl.dart';

class DatePicker extends ConsumerWidget {
  DatePicker({super.key});

  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Due date",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "This field is required.";
            }
            return null;
          },
          controller: dateController,
          readOnly: true,
          maxLines: 1,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(2010),
                lastDate: DateTime(2100),
                confirmText: "Set");
            if (pickedDate != null) {
              ref.read(dateProvider.notifier).state = pickedDate;
              dateController.text =
                  DateFormat('dd MMM, yyyy').format(pickedDate);
            }
          },
          decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFFBF9B))),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.calendar_today),
              hintText: "Select due date"),
        ),
      ],
    );
  }
}
