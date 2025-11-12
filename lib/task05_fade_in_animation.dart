import 'package:flutter/material.dart';

/// Task 5 - Fade-in Animation
/// Animated "Welcome" text that fades in when page loads
class Task05FadeInAnimation extends StatefulWidget {
  const Task05FadeInAnimation({super.key});

  @override
  State<Task05FadeInAnimation> createState() => _Task05FadeInAnimationState();
}

class _Task05FadeInAnimationState extends State<Task05FadeInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    // Create fade animation
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
    // Start animation when page loads
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fade-in Animation'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.waving_hand,
                size: 80,
                color: Colors.blue,
              ),
              SizedBox(height: 20),
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

