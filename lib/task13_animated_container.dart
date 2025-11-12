import 'package:flutter/material.dart';

/// Task 13 - Animated Container Demo
/// AnimatedContainer changes size or color on button press with smooth animation
class Task13AnimatedContainer extends StatefulWidget {
  const Task13AnimatedContainer({super.key});

  @override
  State<Task13AnimatedContainer> createState() => _Task13AnimatedContainerState();
}

class _Task13AnimatedContainerState extends State<Task13AnimatedContainer> {
  double _width = 150;
  double _height = 150;
  Color _color = Colors.blue;
  BorderRadius _borderRadius = BorderRadius.circular(10);

  void _animateContainer() {
    setState(() {
      // Toggle between two states
      if (_width == 150) {
        _width = 250;
        _height = 250;
        _color = Colors.green;
        _borderRadius = BorderRadius.circular(50);
      } else {
        _width = 150;
        _height = 150;
        _color = Colors.blue;
        _borderRadius = BorderRadius.circular(10);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated Container
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
              child: const Center(
                child: Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ),
            const SizedBox(height: 50),
            // Animate Button
            ElevatedButton.icon(
              onPressed: _animateContainer,
              icon: const Icon(Icons.animation),
              label: const Text('Animate Container'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Size: ${_width.toInt()} x ${_height.toInt()}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

