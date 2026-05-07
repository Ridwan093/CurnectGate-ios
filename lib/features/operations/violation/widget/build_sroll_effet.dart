import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/violation/report_provider/report_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageScroll extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: constraints.maxWidth, // Takes full available width
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Full-width PageView or Placeholder
          SizedBox(
            width: double.infinity,
            child:
                images.isEmpty
                    ? Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.instance.teal400.withOpacity(0.1),
                            AppColors.instance.teal400.withOpacity(0.05),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.assignment_turned_in_outlined,
                              size: 48,
                              color: AppColors.instance.teal400.withOpacity(0.3),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "No Photographic Evidence",
                              style: TextStyle(
                                fontFamily: FontFamilies.interDisplay,
                                color: AppColors.instance.teal400
                                    .withOpacity(0.4),
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    : PageView.builder(
                      controller: imageController,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Hero(
                          tag: 'violation_image_${images[index]}',
                          child: Image.network(
                            images[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
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
                          ),
                        );
                      },
                    ),
          ),

          // Back Button (positioned absolutely)
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Material(
                borderRadius: BorderRadius.circular(8),
                elevation: 2,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: AppColors.instance.black600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 15,
            child: GestureDetector(
              onTap: () {
                final violation = ref.read(reportProvider).report;
                showUserBottomSheet(
                  context: context,
                  headertitle: "Status History",
                  headersubtitle: "Track the timeline of this report",
                  ref: ref,
                  bottom: BottomSheetView.resolutionTime,
                  id: violation.id,
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  border: Border.all(
                    width: 1.5,
                    color: _getStatusColor(status),
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: _getStatusColor(status).withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _getStatusColor(status),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      status.toUpperCase(),
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        color: _getStatusColor(status),
                        fontWeight: FontFamilies.bold,
                        fontSize: 11,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
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
