import 'package:flutter/material.dart';
import 'package:my_new_app/widgets/awesome_widget.dart';
import 'package:my_new_app/widgets/counter.dart';
import 'package:my_new_app/widgets/users_list.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
      title: 'Awesome Flutter',
    )
  );
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AwesomeWidget(),
              const SizedBox(height: 20),
              const CounterWidget(),
              const SizedBox(height: 20),
              ElevatedButton(
                  child: const Text('View Users'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const UsersListPage()));
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}
