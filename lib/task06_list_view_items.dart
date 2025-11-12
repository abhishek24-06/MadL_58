import 'package:flutter/material.dart';

/// Task 6 - ListView with Items
/// Scrollable list of at least 10 items, each tappable showing a snackbar
class Task06ListViewItems extends StatelessWidget {
  const Task06ListViewItems({super.key});

  // List of sample items
  final List<String> _items = const [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grape',
    'Honeydew',
    'Kiwi',
    'Lemon',
    'Mango',
    'Orange',
  ];

  void _handleItemTap(BuildContext context, int index, String item) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tapped: $item (Item ${index + 1})'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Items'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: _items.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                _items[index],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text('Item ${index + 1} of ${_items.length}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _handleItemTap(context, index, _items[index]),
            ),
          );
        },
      ),
    );
  }
}

