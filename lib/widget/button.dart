import 'package:flutter/material.dart';

class SharedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  SharedButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          "${text}",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        color: Colors.cyan,
        height: 55,
        minWidth: 260,
      ),
    );
  }
}
