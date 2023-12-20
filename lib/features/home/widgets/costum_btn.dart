import 'package:flutter/material.dart';


class CusstomBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  const CusstomBtn({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }
}
