import 'package:flutter/material.dart';
import 'task01_user_profile.dart';
import 'task02_login_form.dart';
import 'task03_action_buttons_row.dart';
import 'task04_navigation_pages.dart';
import 'task05_fade_in_animation.dart';
import 'task06_list_view_items.dart';
import 'task07_local_json_display.dart';
import 'task08_bottom_navbar.dart';
import 'task09_widget_test_text.dart';
import 'task10_draggable_widget.dart';
import 'task11_image_gallery.dart';
import 'task12_color_toggler.dart';
import 'task13_animated_container.dart';
import 'task14_tabbar_layout.dart';

void main() {
  runApp(const MadLabApp());
}

/// Main app widget with navigation menu for all 14 tasks
class MadLabApp extends StatelessWidget {
  const MadLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MADL Practical Tasks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const TaskMenuScreen(),
    );
  }
}

/// Menu screen listing all 14 tasks
class TaskMenuScreen extends StatelessWidget {
  const TaskMenuScreen({super.key});

  final List<Map<String, dynamic>> _tasks = const [
    {
      'title': 'Task 1: User Profile',
      'description': 'Circular avatar, name, email, and bio',
      'widget': Task01UserProfile(),
    },
    {
      'title': 'Task 2: Login Form',
      'description': 'Email & password form with validation',
      'widget': Task02LoginForm(),
    },
    {
      'title': 'Task 3: Action Buttons Row',
      'description': 'Three horizontally aligned IconButtons',
      'widget': Task03ActionButtonsRow(),
    },
    {
      'title': 'Task 4: Navigation Pages',
      'description': 'Navigate between home and profile pages',
      'widget': Task04NavigationPages(),
    },
    {
      'title': 'Task 5: Fade-in Animation',
      'description': 'Animated welcome text with fade-in effect',
      'widget': Task05FadeInAnimation(),
    },
    {
      'title': 'Task 6: ListView Items',
      'description': 'Scrollable list of tappable items',
      'widget': Task06ListViewItems(),
    },
    {
      'title': 'Task 7: Local JSON Display',
      'description': 'Parse and display hardcoded JSON data',
      'widget': Task07LocalJsonDisplay(),
    },
    {
      'title': 'Task 8: Bottom Navigation Bar',
      'description': 'Two tabs (Home and Settings)',
      'widget': Task08BottomNavbar(),
    },
    {
      'title': 'Task 9: Widget Test Target',
      'description': 'Simple screen with centered "Hello" text',
      'widget': Task09WidgetTestText(),
    },
    {
      'title': 'Task 10: Draggable Widget',
      'description': 'Draggable item and drop target',
      'widget': Task10DraggableWidget(),
    },
    {
      'title': 'Task 11: Image Gallery',
      'description': 'GridView with tappable images',
      'widget': Task11ImageGallery(),
    },
    {
      'title': 'Task 12: Color Toggler',
      'description': 'FAB toggles background color',
      'widget': Task12ColorToggler(),
    },
    {
      'title': 'Task 13: Animated Container',
      'description': 'Container with size and color animation',
      'widget': Task13AnimatedContainer(),
    },
    {
      'title': 'Task 14: TabBar Layout',
      'description': 'TabBar with Chats and Status tabs',
      'widget': Task14TabbarLayout(),
    },
  ];

  void _navigateToTask(BuildContext context, Widget taskWidget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => taskWidget),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MADL Practical Tasks'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                task['title'] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                task['description'] as String,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _navigateToTask(
                context,
                task['widget'] as Widget,
              ),
            ),
          );
        },
      ),
    );
  }
}

