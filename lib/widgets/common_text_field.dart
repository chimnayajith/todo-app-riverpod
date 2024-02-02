import 'package:flutter/material.dart';

class CommonTextFied extends StatelessWidget {
  const CommonTextFied({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.maxLines,
    this.prefixIcon,
    this.maxLength,
  });

  final String title;
  final String hintText;
  final TextEditingController controller;
  final int? maxLength;
  final int maxLines;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
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
          controller: controller,
          maxLength: maxLength,
          autocorrect: false,
          readOnly: false,
          maxLines: maxLines,
          decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFFBF9B))),
              border: const OutlineInputBorder(),
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              hintText: hintText),
        ),
      ],
    );
  }
}
