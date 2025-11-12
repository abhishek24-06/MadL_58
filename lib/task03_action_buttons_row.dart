import 'package:flutter/material.dart';

/// Task 3 - Action Buttons Row
/// Three horizontally aligned IconButtons (call, message, email)
class Task03ActionButtonsRow extends StatelessWidget {
  const Task03ActionButtonsRow({super.key});

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
    // Also print to console
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Action Buttons Row'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Call Button
            IconButton(
              onPressed: () {
                _showMessage(context, 'Call button pressed!');
              },
              icon: const Icon(Icons.call),
              iconSize: 50,
              color: Colors.green,
              tooltip: 'Call',
            ),
            const SizedBox(width: 30),
            // Message Button
            IconButton(
              onPressed: () {
                _showMessage(context, 'Message button pressed!');
              },
              icon: const Icon(Icons.message),
              iconSize: 50,
              color: Colors.blue,
              tooltip: 'Message',
            ),
            const SizedBox(width: 30),
            // Email Button
            IconButton(
              onPressed: () {
                _showMessage(context, 'Email button pressed!');
              },
              icon: const Icon(Icons.email),
              iconSize: 50,
              color: Colors.orange,
              tooltip: 'Email',
            ),
          ],
        ),
      ),
    );
  }
}

