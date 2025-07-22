import 'dart:typed_data';

import 'package:curnectgate/core/local_store/model/imageCatch_model.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CachedImage extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? placeholder;
  final Widget? errorWidget;

  const CachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.errorWidget,
  });

  @override
  State<CachedImage> createState() => _CachedImageState();
}

class _CachedImageState extends State<CachedImage> {
  late Future<Uint8List?> _imageFuture;

  @override
  void initState() {
    super.initState();
    _imageFuture = _loadImage();
  }

  Future<Uint8List?> _loadImage() async {
    // 1. Try to get cached image
    final cachedImage = await ImageCacheService.getCachedImageBytes(
      widget.imageUrl,
    );
    if (cachedImage != null) return cachedImage;

    // 2. If no cache, download and save
    try {
      final response = await http.get(Uri.parse(widget.imageUrl));
      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        await ImageCacheService.saveImage(widget.imageUrl);
        return bytes;
      }
    } catch (e) {
      print('Image download failed: $e');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: _imageFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return widget.placeholder ??
              Center(
                child: CircularProgressIndicator(
                  color: AppColors.instance.yellow500,
                ),
              );
        }

        if (snapshot.hasError || snapshot.data == null) {
          return widget.errorWidget ??
              Icon(Icons.broken_image, size: widget.width);
        }

        return Image.memory(
          snapshot.data!,
          width: widget.width,
          height: widget.height,
          fit: widget.fit,
        );
      },
    );
  }
}
