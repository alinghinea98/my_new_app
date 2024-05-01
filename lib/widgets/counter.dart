import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => setState(() {
            _counter++;
          }),
          child: const Text('Increase counter'),
        ),
        const SizedBox(height: 10),
        Text(
          'Counter: $_counter',
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black
          )
        )
      ],
    );
  }
}
