
import 'package:flutter/material.dart';

class GalleriePage extends StatelessWidget {
  const GalleriePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallerie'),
      ),
      body: const Center(
        child: Text(
          'Page Gallerie',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
