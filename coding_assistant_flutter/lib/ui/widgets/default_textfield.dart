import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  const DefaultTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Colors.black,
          ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.black,
            ),
        prefixIcon: Container(
          transform: Matrix4.translationValues(6.0, 0.0, 0.0),
          child: Icon(
            icon,
            color: Colors.black,
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
