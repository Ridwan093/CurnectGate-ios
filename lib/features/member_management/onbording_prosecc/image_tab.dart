// image_tab.dart
import 'package:curnectgate/core/style/colors.dart';
import 'package:flutter/material.dart';

class ImageTab extends StatelessWidget {
  final String normalImage;
  final String activeImage;
  final String label;
  final bool isActive;
  final double size;

  const ImageTab({
    super.key,
    required this.normalImage,
    required this.activeImage,
    required this.isActive,
    required this.label,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      isActive ? activeImage : normalImage,
      width: size,
      height: size,
      fit: BoxFit.contain,
      color:
          !isActive && label.toLowerCase().contains('codes')
              ? AppColors.instance.black400
              : null,
    );
  }
}
