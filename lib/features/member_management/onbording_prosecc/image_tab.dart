// image_tab.dart
import 'package:flutter/material.dart';

class ImageTab extends StatelessWidget {
  final String normalImage;
  final String activeImage;
  final bool isActive;
  final double size;

  const ImageTab({
    super.key,
    required this.normalImage,
    required this.activeImage,
    required this.isActive,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      isActive ? activeImage : normalImage,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}