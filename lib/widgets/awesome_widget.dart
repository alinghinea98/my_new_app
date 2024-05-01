import 'package:flutter/material.dart';

class AwesomeWidget extends StatelessWidget {
  const AwesomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white12,
      child: const Center(
        child: Text(
          'Hello, Awesome!',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black
          ),
        ),
      ),
    );
  }
}