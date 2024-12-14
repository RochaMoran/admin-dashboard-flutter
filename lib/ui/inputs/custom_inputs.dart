import 'package:flutter/material.dart';

class CustomInputs {
  static InputDecoration authInputDecoration(
      {required String hint, required String label, required IconData icon}) {
    return InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
        hintText: hint,
        label:
            Text(label, style: TextStyle(color: Colors.white.withOpacity(0.3))),
        prefixIcon: Icon(icon, color: Colors.white.withOpacity(0.3)));
  }
}