
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
      ),
      body: const Center(
        child: Text(
          'Page Contact',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
