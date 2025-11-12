import 'package:flutter/material.dart';

/// Task 11 - Image Gallery Grid
/// GridView displaying at least 6 images, tappable to show snackbar
class Task11ImageGallery extends StatelessWidget {
  const Task11ImageGallery({super.key});

  // List of placeholder image URLs
  final List<String> _imageUrls = const [
    'https://picsum.photos/300/300?random=1',
    'https://picsum.photos/300/300?random=2',
    'https://picsum.photos/300/300?random=3',
    'https://picsum.photos/300/300?random=4',
    'https://picsum.photos/300/300?random=5',
    'https://picsum.photos/300/300?random=6',
    'https://picsum.photos/300/300?random=7',
    'https://picsum.photos/300/300?random=8',
  ];

  void _handleImageTap(BuildContext context, int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Image ${index + 1} tapped!'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gallery'),
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.0,
        ),
        itemCount: _imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _handleImageTap(context, index),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      _imageUrls[index],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.broken_image,
                            size: 50,
                            color: Colors.grey,
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                    // Overlay with image number
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent,
                            ],
                          ),
                        ),
                        child: Text(
                          'Image ${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

