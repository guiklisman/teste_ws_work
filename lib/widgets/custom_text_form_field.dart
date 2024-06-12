import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              prefixIcon,
              size: 24,
              color: Theme.of(context).primaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 211, 210, 210),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 16.0,
          ),
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
