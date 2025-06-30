
// Define a custom painter
import 'package:flutter/material.dart';
class PentagonContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Widget? child;
  final EdgeInsets? padding;

  const PentagonContainer({
    super.key,
    required this.width,
    required this.height,
    this.color = Colors.blue,
    this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _PentagonClipper(),
      child: Container(
  
        width: width,
        height: height,
        color: color,
        padding: padding,
        child: child,
      ),
    );
  }
}

class _PentagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    
    // Start at top center
    path.moveTo(size.width * 0.5, 0);

    // Draw lines to create a pentagon
    path.lineTo(size.width, size.height * 0.4); // Top-right
    path.lineTo(size.width * 0.8, size.height); // Bottom-right
    path.lineTo(size.width * 0.2, size.height); // Bottom-left
    path.lineTo(0, size.height * 0.4); // Top-left
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}