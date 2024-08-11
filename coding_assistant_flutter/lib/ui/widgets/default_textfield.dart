import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  const DefaultTextField({
    super.key,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Container(
          transform: Matrix4.translationValues(6.0, 0.0, 0.0),
          child: Icon(
            icon,
          ),
        ),
        filled: true,
        fillColor: const Color(0xFFDDD8FF),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
