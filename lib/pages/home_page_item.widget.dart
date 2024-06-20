import 'package:flutter/material.dart';

class HomePageItem extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const HomePageItem({super.key, 
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink.image(
        height: 180,
        width: 180,
        image: AssetImage(imagePath),
      ),
    );
  }
}
