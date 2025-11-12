import 'package:flutter/material.dart';

/// Task 12 - Background Color Toggler
/// FAB toggles screen's background color between two colors on each press
class Task12ColorToggler extends StatefulWidget {
  const Task12ColorToggler({super.key});

  @override
  State<Task12ColorToggler> createState() => _Task12ColorTogglerState();
}

class _Task12ColorTogglerState extends State<Task12ColorToggler> {
  // Two colors to toggle between
  final List<Color> _colors = [
    Colors.white,
    Colors.blue.shade100,
  ];
  int _currentColorIndex = 0;

  void _toggleColor() {
    setState(() {
      _currentColorIndex = (_currentColorIndex + 1) % _colors.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Toggler'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: _colors[_currentColorIndex],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.color_lens,
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            Text(
              'Background Color: ${_currentColorIndex == 0 ? "White" : "Light Blue"}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Press the FAB to toggle colors',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleColor,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.swap_horiz, color: Colors.white),
      ),
    );
  }
}

