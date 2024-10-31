import 'dart:ui';

import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  final Map item;
  const BookDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    print(item);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: HeaderSection(
              title: item['anime_name'],
              author: item['character_name'],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const BookInfoSection(),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  final String title;
  final String author;
  const HeaderSection({super.key, required this.title, required this.author});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://ia800607.us.archive.org/view_archive.php?archive=/22/items/olcovers24/olcovers24-L.zip&file=240007-L.jpg"), // Path to your image
              fit: BoxFit
                  .contain, // Ensures the image covers the entire container
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: BackdropFilter(
            filter:
                ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Adjust blur intensity
            child: Container(
              color: Colors.black
                  .withOpacity(0.3), // Dark overlay for better contrast
            ),
          ),
        ),
        const Positioned(
          top: 40,
          left: 16,
          child: BackButton(color: Colors.white),
        ),
        const Positioned(
          top: 40,
          left: 16,
          child: BackButton(color: Colors.white),
        ),
        Positioned(
          top: 100,
          left: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                author,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class BookInfoSection extends StatelessWidget {
  const BookInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://ia800607.us.archive.org/view_archive.php?archive=/22/items/olcovers24/olcovers24-L.zip&file=240007-L.jpg"), // Replace with actual path
              radius: 20,
            ),
            SizedBox(width: 10),
            Text(
              'The Martian Chronicles',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Ray Bradbury',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        const Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 20),
            Icon(Icons.star, color: Colors.amber, size: 20),
            Icon(Icons.star, color: Colors.amber, size: 20),
            Icon(Icons.star, color: Colors.amber, size: 20),
            Icon(Icons.star_half, color: Colors.amber, size: 20),
            SizedBox(width: 5),
            Text(
              '4.14',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'The strange and wonderful tale of man\'s experiences on Mars, filled with intense images and astonishing visions. Now part of the Voyager Classics collection.',
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Text('Want to read'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(color: Colors.red),
                ),
                onPressed: () {},
                child: const Text(
                  'Get a copy',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
