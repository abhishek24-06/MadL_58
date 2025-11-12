import 'dart:convert';
import 'package:flutter/material.dart';

/// Task 7 - Display Local JSON Data
/// Parse hardcoded JSON list and display using ListView
class Task07LocalJsonDisplay extends StatelessWidget {
  const Task07LocalJsonDisplay({super.key});

  // Hardcoded JSON data as a string
  final String _jsonData = '''
  [
    {
      "id": 1,
      "name": "Laptop",
      "price": 999.99,
      "category": "Electronics"
    },
    {
      "id": 2,
      "name": "Smartphone",
      "price": 699.99,
      "category": "Electronics"
    },
    {
      "id": 3,
      "name": "Headphones",
      "price": 149.99,
      "category": "Audio"
    },
    {
      "id": 4,
      "name": "Keyboard",
      "price": 79.99,
      "category": "Accessories"
    },
    {
      "id": 5,
      "name": "Mouse",
      "price": 29.99,
      "category": "Accessories"
    },
    {
      "id": 6,
      "name": "Monitor",
      "price": 299.99,
      "category": "Electronics"
    }
  ]
  ''';

  List<Map<String, dynamic>> _parseJson() {
    try {
      final List<dynamic> jsonList = json.decode(_jsonData);
      return jsonList.cast<Map<String, dynamic>>();
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = _parseJson();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Local JSON Display'),
        backgroundColor: Colors.blue,
      ),
      body: items.isEmpty
          ? const Center(
              child: Text('No data available'),
            )
          : ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        '${item['id']}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      item['name'] ?? 'Unknown',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Category: ${item['category'] ?? 'N/A'}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    trailing: Text(
                      '\$${item['price']?.toStringAsFixed(2) ?? '0.00'}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

