import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageScroll extends StatelessWidget {
  final BoxConstraints constraints;
  final PageController imageController;
  final List<String> images;
  final String status;

  const ImageScroll({
    super.key,
    required this.imageController,
    required this.constraints,
    required this.images,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth, // Takes full available width
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Full-width PageView
          SizedBox(
            width: double.infinity, // Full width
            child: PageView.builder(
              controller: imageController,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Image.network(
                  images[index],
                  fit: BoxFit.cover,
                  width: double.infinity, // Full width
                  alignment: Alignment.center,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value:
                            loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: const Icon(Icons.broken_image, size: 50),
                    );
                  },
                );
              },
            ),
          ),

          // Back Button (positioned absolutely)
          Positioned(
            top: MediaQuery.of(context).padding.top - 14,
            left: 10,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Material(
                borderRadius: BorderRadius.circular(8),
                elevation: 2,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 5,
                    top: 10,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.instance.black600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 10,
            right: 10,

            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    style: BorderStyle.solid,
                    color: _getStatusColor(status),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  status.toUpperCase(),
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: _getStatusColor(status),
                    fontWeight: FontFamilies.bold,
                  ),
                ),
              ),
            ),
          ),

          // Page Indicator
          if (images.length > 1)
            Positioned(
              bottom: 20,
              child: SmoothPageIndicator(
                controller: imageController,
                count: images.length,
                effect: WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: AppColors.instance.yellow500,
                  dotColor: Colors.white54,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return AppColors.instance.yellow500;

      case 'investigating':
        return AppColors.instance.blue500;

      case 'resolved':
        return AppColors.instance.teal500;

      case 'dismissed':
        return AppColors.instance.error500;

      case 'expected':
      case 'arrived':
        Icons.location_on_outlined;
        return AppColors.instance.teal400;
      case 'checked_in':
        Icons.login;
        return AppColors.instance.blue200;

      case 'checked_out':
        return AppColors.instance.grey300;

      case 'denied':
        return AppColors.instance.error600;
      case 'approved':
      case 'validated':
        return Colors.green;
      case 'expired':
      case 'revoked':
        return AppColors.instance.error400;
      case 'no_show':
        return AppColors.instance.yellow300;
      case 'created':
      case 'updated':
        return AppColors.instance.black500;
      case 'assigned':
        return AppColors.instance.teal500;
      case 'commented':
        return AppColors.instance.grey500;

      default:
        return Colors.grey;
    }

    // switch (status.toLowerCase()) {
    //   case 'pending':
    //     return AppColors.instance.yellow500;
    //   case 'resolved':
    //     return AppColors.instance.teal500;
    //   case 'investigating':
    //     return AppColors.instance.blue400;
    //   default:
    //     return AppColors.instance.grey400;
    // }
  }
}
