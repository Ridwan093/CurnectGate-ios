import 'dart:async';
import 'dart:developer';
import 'dart:io';
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
    try {
      // 1. Validate URL first
      final url = widget.imageUrl.replaceAll(RegExp(r'/v\d+/'), '/');
final uri = Uri.parse(url);

   
      if (!uri.isAbsolute) {
        throw Exception('Invalid image URL');
      }

      // 2. Check cache
      final cachedImage = await ImageCacheService.getCachedImageBytes(
        widget.imageUrl,
      );
      if (cachedImage != null) return cachedImage;

      // 3. Download with timeout and headers
      final response = await http
          .get(uri, headers: {'Accept': 'image/*'})
          .timeout(const Duration(seconds: 10));

      // 4. Validate response
      if (response.statusCode != 200) {
        throw HttpException('HTTP ${response.statusCode}', uri: uri);
      }

      // 5. Validate image data
      final bytes = response.bodyBytes;
      if (bytes.isEmpty) throw Exception('Empty image data');

      // 6. Cache in background (don't await)
      unawaited(
        ImageCacheService.saveImage(
          widget.imageUrl,
          bytes,
        ).catchError((e) => log('Cache save failed: $e')),
      );

      return bytes;
    } on http.ClientException catch (e) {
      log('Network error: ${e.message}');
    } on TimeoutException {
      log('Download timed out');
    } catch (e, stack) {
      log('Image load failed', error: e, stackTrace: stack);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    log(widget.imageUrl);
    return FutureBuilder<Uint8List?>(
      future: _imageFuture,
      builder: (context, snapshot) {
        // Loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return widget.placeholder ?? _buildDefaultPlaceholder();
        }

        // Error/empty state
        if (snapshot.hasError || snapshot.data == null) {
          return widget.errorWidget ?? _buildDefaultError();
        }

        // Success state
        return Image.memory(
          snapshot.data!,
          width: widget.width,
          height: widget.height,
          fit: widget.fit ?? BoxFit.cover,
          errorBuilder:
              (_, __, ___) => widget.errorWidget ?? _buildDefaultError(),
        );
      },
    );
  }

  Widget _buildDefaultPlaceholder() {
    return Center(
      child: CircularProgressIndicator(color: AppColors.instance.yellow500),
    );
  }

  Widget _buildDefaultError() {
    return Icon(
      Icons.broken_image,
      size: widget.width != null ? widget.width! / 2 : 24,
      color: Colors.grey[400],
    );
  }
}
