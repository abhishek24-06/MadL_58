import 'package:flutter/material.dart';

/// Task 1 - User Profile Screen
/// Displays a circular avatar, name, email, and bio centered on screen
class Task01UserProfile extends StatelessWidget {
  const Task01UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circular Avatar
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.person,
                size: 80,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            // Name
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            // Email
            const Text(
              'john.doe@example.com',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 30),
            // Bio
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Software Developer passionate about Flutter and mobile app development. '
                'Love creating beautiful and functional user interfaces.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

