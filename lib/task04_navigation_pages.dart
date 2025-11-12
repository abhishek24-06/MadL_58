import 'package:flutter/material.dart';

/// Task 4 - Navigation Between Pages
/// Home page with button navigating to profile screen and back
class Task04NavigationPages extends StatelessWidget {
  const Task04NavigationPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.home,
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 30),
            const Text(
              'Welcome to Home Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to profile page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
              icon: const Icon(Icons.person),
              label: const Text('Go to Profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Profile Page - Destination page for navigation
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.person,
                size: 80,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Profile Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'This is the profile page',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 50),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate back to home page
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Go Back'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

