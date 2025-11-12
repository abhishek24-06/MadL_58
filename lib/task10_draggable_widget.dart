import 'package:flutter/material.dart';

/// Task 10 - Draggable & Drop Target
/// Draggable widget and DragTarget that changes color when item is dropped
class Task10DraggableWidget extends StatefulWidget {
  const Task10DraggableWidget({super.key});

  @override
  State<Task10DraggableWidget> createState() => _Task10DraggableWidgetState();
}

class _Task10DraggableWidgetState extends State<Task10DraggableWidget> {
  Color _dropTargetColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draggable Widget'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Drag the box to the target below',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 50),
            // Draggable Widget
            Draggable<String>(
              data: 'dragged_item',
              feedback: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.drag_handle,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              childWhenDragging: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.drag_handle,
                  color: Colors.grey,
                  size: 50,
                ),
              ),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.drag_handle,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            const SizedBox(height: 80),
            const Text(
              'Drop Target',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            // Drag Target
            DragTarget<String>(
              onAccept: (data) {
                setState(() {
                  _dropTargetColor = Colors.green;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Item dropped successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              onLeave: (data) {
                setState(() {
                  _dropTargetColor = Colors.grey;
                });
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: _dropTargetColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: _dropTargetColor == Colors.green
                        ? const Icon(
                            Icons.check_circle,
                            color: Colors.white,
                            size: 60,
                          )
                        : const Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                            size: 60,
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

