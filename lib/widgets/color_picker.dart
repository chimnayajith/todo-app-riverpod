import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/providers.dart';

class ColorPicker extends ConsumerWidget {
  const ColorPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color selectedColor = ref.watch(colorProvider);
    Widget buildColorButton(Color color) {
      return GestureDetector(
        onTap: () {
          ref.read(colorProvider.notifier).state = color;
        },
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              border: Border.all(
                strokeAlign: BorderSide.strokeAlignCenter,
                color: selectedColor == color
                    ? const Color.fromARGB(255, 41, 40, 103)
                    : Colors.grey.shade700,
                width: selectedColor == color ? 3.0 : 2.0,
              )),
        ),
      );
    }

    return Row(
      children: [
        const Text(
          "Card color : ",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        buildColorButton(const Color.fromARGB(255, 206, 242, 254)),
        const SizedBox(width: 10),
        buildColorButton(const Color.fromARGB(255, 255, 226, 196)),
        const SizedBox(width: 10),
        buildColorButton(const Color.fromARGB(255, 255, 202, 208)),
        // const SizedBox(width: 10),
      ],
    );
  }
}
