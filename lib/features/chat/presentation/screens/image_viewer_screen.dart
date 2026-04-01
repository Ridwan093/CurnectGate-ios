import 'dart:io';
import 'package:flutter/material.dart';

class ImageViewerScreen extends StatelessWidget {
  final String imagePath;
  final String tag;

  const ImageViewerScreen({super.key, required this.imagePath, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      body: Center(
        child: Hero(
          tag: tag,
          child: InteractiveViewer(
            panEnabled: true,
            minScale: 0.5,
            maxScale: 4.0,
            child: imagePath.startsWith('http') 
              ? Image.network(imagePath, fit: BoxFit.contain)
              : Image.file(File(imagePath), fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
