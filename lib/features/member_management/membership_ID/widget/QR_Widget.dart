import 'dart:typed_data';

import 'package:curnectgate/core/local_store/image_local_catch.dart';
import 'package:curnectgate/core/local_store/model/imageCatch_model.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/membership_ID/model/digital_member_id_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QrWidget extends StatefulWidget {
  final DigitalMemberIdData data;

  const QrWidget({super.key, required this.data});

  @override
  State<QrWidget> createState() => _QrWidgetState();
}

class _QrWidgetState extends State<QrWidget> {
  @override
  void initState() {
    super.initState();
    preCacheImages();
  }

  void preCacheImages() {
    // Fire-and-forget for both images
    _cacheImage(widget.data.digitalId?.qrCodeUrl);
  }

  Future<void> _cacheImage(String? url) async {
    if (url == null || url.isEmpty) return;

    try {
      final bytes = await http.get(Uri.parse(url)).then((r) => r.bodyBytes);
      if (bytes.isNotEmpty) {
        await ImageCacheService.saveImage(url, bytes);
      }
    } catch (e) {
      debugPrint('Cache failed for $url: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 40),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),

            // QR Code Placeholder (replace with actual QR widget)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home_filled,
                      size: 20,
                      color: AppColors.instance.teal300,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.data.user?.estateName?.toUpperCase() ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontFamilies.bold,
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.black600,
                      ),
                    ),
                  ],
                ),

                CachedImage(
                  imageUrl: widget.data.digitalId?.qrCodeUrl ?? "",
                  width: 200,
                  height: 200,
                  placeholder: Container(
                    width: 200,
                    height: 200,
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.instance.yellow500,
                      ),
                    ),
                  ),
                  errorWidget: Container(
                    width: 200,
                    height: 200,
                    color: Colors.grey[200],
                    child: Icon(Icons.qr_code, size: 50),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Priority Pass Divider
            Row(
              children: [
                Expanded(child: Divider(color: Colors.grey[400])),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(color: AppColors.instance.grey300),

                  child: Center(
                    child: Text(
                      'PRIORITY PASS',
                      style: TextStyle(
                        color: AppColors.instance.black300,
                        fontWeight: FontFamilies.bold,
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 10,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                Expanded(child: Divider(color: Colors.grey[400])),
              ],
            ),

            const SizedBox(height: 30),

            Text(
              'Name',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontFamilies.bold,

                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black300,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              "${widget.data.user?.firstname?.toUpperCase()} ${widget.data.user?.lastname?.toUpperCase()}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontFamilies.bold,

                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
              ),
            ),

            const SizedBox(height: 15),
            Text(
              'Type',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontFamilies.bold,

                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black300,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              widget.data.user?.role?.toUpperCase() ?? "",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontFamilies.bold,

                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 20),

            // Status Indicator
            Text(
              'Status',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontFamilies.bold,

                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black300,
              ),
            ),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.data.digitalId?.status?.toUpperCase() ?? "",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontFamilies.bold,

                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(width: 5),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: _buildColor(
                    widget.data.digitalId?.status?.toLowerCase() ?? "",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _buildColor(String status) {
    switch (status) {
      case "active":
        return AppColors.instance.teal500;

      case "inactive":
        return AppColors.instance.grey500;
      default:
        return AppColors.instance.grey500;
    }
  }
}

Future<Uint8List?> fetchImageWithHeaders(String imageUrl) async {
  try {
    final response = await http.get(
      Uri.parse(imageUrl),
      headers: {
        'Accept': 'image/avif,image/webp,image/apng,image/*,*/*;q=0.8',
        'Accept-Language': 'en-US,en;q=0.9',
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115 Safari/537.36',
      },
    );

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      debugPrint('Image failed to load: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    debugPrint('Image fetch error: $e');
    return null;
  }
}

class NetworkImageWithHeaders extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const NetworkImageWithHeaders({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: fetchImageWithHeaders(imageUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError || snapshot.data == null) {
          return const Icon(Icons.broken_image, color: Colors.red);
        } else {
          return Image.memory(
            snapshot.data!,
            width: width,
            height: height,
            fit: fit ?? BoxFit.cover,
          );
        }
      },
    );
  }
}
