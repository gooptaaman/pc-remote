import 'package:flutter/material.dart';

class SettingsInputField extends StatelessWidget {
  final String label;
  final TextInputType keyboard;
  final TextEditingController controller;

  const SettingsInputField({this.label, this.keyboard, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
                gapPadding: 3.5, borderRadius: BorderRadius.circular(10.0))),
        keyboardType: keyboard,
        validator: (value) {
          if (value.isEmpty) {
            return 'Please Enter a valid $label';
          } else {
            return null;
          }
        },
      ),
    );
  }
}
