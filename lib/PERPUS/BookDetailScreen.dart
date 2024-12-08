import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Details'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Mantapu Jiwa',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Image.asset('assets/mantapu_jiwa.jpg', height: 200),
            const SizedBox(height: 20),
            const Text(
              'Synopsis',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'This is a math exercise book, huh Jer?\n\nPeople say...',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Add To Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
