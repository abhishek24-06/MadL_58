import 'package:flutter/material.dart';

/// Task 9 - Simple Widget Test Target
/// Screen displaying centered text "Hello" suitable for widget testing
class Task09WidgetTestText extends StatelessWidget {
  const Task09WidgetTestText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Test Target'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          'Hello',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
          // Key for widget testing
          key: Key('hello_text'),
        ),
      ),
    );
  }
}

