import 'package:flutter/material.dart';

/// Task 14 - TabBar Layout
/// TabBar with two tabs (Chats and Status), each displaying unique content
class Task14TabbarLayout extends StatefulWidget {
  const Task14TabbarLayout({super.key});

  @override
  State<Task14TabbarLayout> createState() => _Task14TabbarLayoutState();
}

class _Task14TabbarLayoutState extends State<Task14TabbarLayout>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Layout'),
        backgroundColor: Colors.blue,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.chat),
              text: 'Chats',
            ),
            Tab(
              icon: Icon(Icons.circle),
              text: 'Status',
            ),
          ],
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ChatsTabContent(),
          StatusTabContent(),
        ],
      ),
    );
  }
}

/// Chats Tab Content
class ChatsTabContent extends StatelessWidget {
  const ChatsTabContent({super.key});

  final List<Map<String, String>> _chats = const [
    {'name': 'Alice', 'message': 'Hey, how are you?'},
    {'name': 'Bob', 'message': 'See you tomorrow!'},
    {'name': 'Charlie', 'message': 'Thanks for the help!'},
    {'name': 'Diana', 'message': 'Meeting at 3 PM'},
    {'name': 'Eve', 'message': 'Great work today!'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _chats.length,
      itemBuilder: (context, index) {
        final chat = _chats[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                chat['name']![0],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              chat['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(chat['message']!),
            trailing: const Icon(Icons.chevron_right),
          ),
        );
      },
    );
  }
}

/// Status Tab Content
class StatusTabContent extends StatelessWidget {
  const StatusTabContent({super.key});

  final List<String> _statuses = const [
    'Online',
    'Away',
    'Busy',
    'Offline',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.circle,
            size: 100,
            color: Colors.blue,
          ),
          const SizedBox(height: 30),
          const Text(
            'Status Tab',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          ..._statuses.map((status) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Chip(
                  label: Text(status),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: const Icon(Icons.person, size: 16, color: Colors.white),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

