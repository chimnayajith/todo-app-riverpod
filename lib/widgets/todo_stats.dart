import 'package:flutter/material.dart';

class TodoStats extends StatelessWidget {
  const TodoStats({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(20)),
      child: Center(
          child: Text(text, style: TextStyle(fontWeight: FontWeight.bold))),
    );
  }
}
