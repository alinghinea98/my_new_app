import 'package:flutter/material.dart';
import 'package:my_new_app/widgets/awesome_widget.dart';
import 'package:my_new_app/widgets/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My first Flutter App'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AwesomeWidget(),
              SizedBox(height: 20),
              CounterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
