import 'package:flutter/material.dart';

/// Task 8 - Bottom Navigation Bar
/// Two tabs (Home and Settings) switching between different pages
class Task08BottomNavbar extends StatefulWidget {
  const Task08BottomNavbar({super.key});

  @override
  State<Task08BottomNavbar> createState() => _Task08BottomNavbarState();
}

class _Task08BottomNavbarState extends State<Task08BottomNavbar> {
  int _currentIndex = 0;

  // Pages to display for each tab
  final List<Widget> _pages = [
    const HomeTabPage(),
    const SettingsTabPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentIndex == 0 ? 'Home' : 'Settings'),
        backgroundColor: Colors.blue,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

/// Home Tab Page
class HomeTabPage extends StatelessWidget {
  const HomeTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.home,
            size: 100,
            color: Colors.blue,
          ),
          const SizedBox(height: 20),
          const Text(
            'Home Tab',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Welcome to the Home page',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

/// Settings Tab Page
class SettingsTabPage extends StatelessWidget {
  const SettingsTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.settings,
            size: 100,
            color: Colors.blue,
          ),
          const SizedBox(height: 20),
          const Text(
            'Settings Tab',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Configure your settings here',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

