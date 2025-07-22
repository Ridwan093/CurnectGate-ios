import 'package:curnectgate/core/local_store/image_local_catch.dart';
import 'package:curnectgate/core/local_store/model/imageCatch_model.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/membership_ID/model/getDigitalModel.dart';
import 'package:flutter/material.dart';

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
    ImageCacheService.saveImage(widget.data.digitalId.qrCodeUrl);
    ImageCacheService.saveImage(widget.data.user.mediaUrl);
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
                      widget.data.user.estateName.toUpperCase(),
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
                  imageUrl: widget.data.digitalId.qrCodeUrl,
                  width: 200,
                  height: 200,
                  placeholder: Container(
                    width: 200,
                    height: 200,
                    color: Colors.grey[200],
                    child: Center(child: CircularProgressIndicator()),
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
              "${widget.data.user.firstname.toUpperCase()} ${widget.data.user.lastname.toUpperCase()}",
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
              widget.data.user.role.toUpperCase(),
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
                  widget.data.digitalId.status.toUpperCase(),
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
                    widget.data.digitalId.status.toLowerCase(),
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
