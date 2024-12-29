import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final bool isFilled;
  final IconData icon;

  const CustomIconButton({
      super.key,
      required this.onPressed,
      required this.text,
      required this.icon,
      this.color = Colors.blue,
      this.isFilled = true
    });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateProperty.all(isFilled ? color.withOpacity(0.5) : Colors.transparent),
        overlayColor: MaterialStateProperty.all(isFilled ? color.withOpacity(0.3) : Colors.transparent),
      ),
      onPressed: () => onPressed(), 
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          Text(text, style: const TextStyle(color: Colors.white))
        ],
      )
    );
  }
}
