import 'package:flutter/material.dart';

class OverflowRemoveBarButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const OverflowRemoveBarButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OverflowBar(
      alignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: onPressed,
          child: const Row(
            children: [
              Icon(
                Icons.remove_circle_outline,
                color: Colors.red,
              ),
              SizedBox(width: 8),
              Text(
                'Remove',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
