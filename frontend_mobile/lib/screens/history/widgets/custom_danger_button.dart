import 'package:flutter/material.dart';

class DangerButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const DangerButton({
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.red, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: const BorderSide(color: Colors.red),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(color: Colors.white), // Text style
      ),
    );
  }
}
