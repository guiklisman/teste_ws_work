import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;

  final Function function;
  const CustomButton({super.key, required this.title, required this.function});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        function();
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 15,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
