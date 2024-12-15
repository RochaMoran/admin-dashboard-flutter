import 'package:flutter/material.dart';

class NotificationIndicator extends StatelessWidget {
  const NotificationIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Icon(Icons.notifications, color: Colors.grey, size: 30),
        Positioned(
          left: 3,
          top: 3,
          child: Container(
            width: 8,
            height: 8,
            decoration: buildBoxDecoration(),
          ),
        )
      ],
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.circular(100)
  );
}