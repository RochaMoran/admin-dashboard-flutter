import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final bool isFilled;

  const CustomOutlinedButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.color = Colors.blue,
      this.isFilled = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: ButtonStyle(
          shape: const MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5)
              )
            )
          ),
          side: MaterialStatePropertyAll(
            BorderSide(
              color: color,
              width: 1
            )
          ),
          backgroundColor: MaterialStatePropertyAll(
            isFilled ? color : Colors.transparent
          ),
        ),
        onPressed: () => onPressed(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: isFilled ? Colors.white : color
            )
          ),
        )
      ),
    );
  }
}
