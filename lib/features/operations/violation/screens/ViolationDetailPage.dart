import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/violation/model/report_models/violation.dart';
import 'package:curnectgate/features/operations/violation/report_provider/report_provider.dart';
import 'package:curnectgate/features/operations/violation/widget/build_sroll_effet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ViolationDetailPage extends ConsumerStatefulWidget {
  final Violation violation;
  final List<String> images;

  const ViolationDetailPage({
    super.key,
    required this.violation,
    required this.images,
  });

  @override
  _ViolationDetailPageState createState() => _ViolationDetailPageState();
}

class _ViolationDetailPageState extends ConsumerState<ViolationDetailPage>
    with TickerProviderStateMixin {
  late final PageController _imageController;
  late final AnimationController _animationController;
  late final AnimationController _animationController2;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _imageController = PageController(viewportFraction: 0.95);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutQuad),
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _imageController.dispose();
    _animationController.dispose();
    _animationController2.dispose();
    super.dispose();
  }

  String formatToTime(String isoDate) {
    final date = DateTime.parse(isoDate).toLocal();
    return DateFormat.jm().format(date); // e.g., 4:21 AM
  }

  String formatToShortMonthDay(String isoDate) {
    final date = DateTime.parse(isoDate).toLocal();
    return DateFormat.MMMd().format(date); // e.g., Mar 24
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(), // or default scroll physics
        // Disable over-scrolling
        slivers: [
          // Image Carousel Section
          SliverAppBar(
            expandedHeight:
                MediaQuery.of(context).size.height *
                0.35, // Reduced height to minimize space
            stretch: true,
            pinned: false,
            snap: false,
            floating: false,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return ImageScroll(
                  constraints: constraints,
                  imageController: _imageController,
                  images: widget.images,
                  status: widget.violation.status,
                );
              },
            ),
          ),
          // Content Section with Animation
          SliverList(
            delegate: SliverChildListDelegate([
              FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Title with Status Chip
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget
                                    .violation
                                    .locationDetails
                                    .additionalLocation,
                                style: TextStyle(
                                  fontFamily: FontFamilies.interDisplay,
                                  color: AppColors.instance.black600,
                                  fontWeight: FontFamilies.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Description
                        Text(
                          widget.violation.description,
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            color: AppColors.instance.black300,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth:
                                      200, // ← Adjust this: 180-220 feels perfect on most devices
                                ),
                                child: _buildAnonymouswidget(
                                  widget.violation.isAnonymous,
                                  widget.violation.reporter.name,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),

                            IntrinsicWidth(
                              child: _buildActionButtons(
                                widget.violation.updatedAt,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        Divider(color: AppColors.instance.grey300),
                        const SizedBox(height: 12),
                        Text(
                          "Additional Info",
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            color: AppColors.instance.black600,
                            fontSize: 16,
                            fontWeight: FontFamilies.bold,
                          ),
                        ),

                        const SizedBox(height: 10),
                        _buildAdditionalInfo(
                          title: "Security assignedTo:",
                          icon: Icons.security_outlined,
                          color: AppColors.instance.teal400,
                          leading: widget.violation.assignedTo?.name ?? "",
                        ),
                        const SizedBox(height: 12),
                        _buildAdditionalInfo(
                          title: "Important Level:",
                          icon: Icons.nature,
                          color: AppColors.instance.teal400,
                          leading: widget.violation.priority,
                        ),
                        const SizedBox(height: 12),
                        _buildAdditionalInfo(
                          title: "Violation ID:",
                          icon: Icons.report,
                          color: AppColors.instance.teal400,
                          leading: widget.violation.violationCode,
                        ),
                        const SizedBox(height: 12),
                        _buildAdditionalInfo(
                          title: "Case  status:",
                          icon: Icons.cases,
                          color: AppColors.instance.teal400,
                          leading: widget.violation.isOpen ? "Open" : "Close",
                        ),
                        const SizedBox(height: 12),
                        _buildAdditionalInfo(
                          title: "Property Owner:",
                          icon: Icons.verified_user,
                          color: AppColors.instance.teal400,
                          leading: widget.violation.propertyOwner.name,
                        ),
                        const SizedBox(height: 12),
                        _buildAdditionalInfo(
                          title: "Report category:",
                          icon: Icons.category,
                          color: AppColors.instance.teal400,
                          leading: widget.violation.category.name,
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
          // Comments Section Preview
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            sliver: SliverToBoxAdapter(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(reportProvider.notifier)
                          .setId(widget.violation.id);
                      showUserBottomSheet(
                        id: widget.violation.id,
                        context: context,
                        headertitle: "",
                        headersubtitle: "",
                        ref: ref,
                        bottom: BottomSheetView.commentvew,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage(AssetPaths.navMessages),
                            color: AppColors.instance.black500,
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              checkCount(
                                "(${widget.violation.commentsSummary.totalComments}) Comments",
                              ),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: FontFamilies.interDisplay,
                                fontSize: 14,
                                color: AppColors.instance.black500,
                                fontWeight: FontFamilies.bold,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: AppColors.instance.teal300,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String checkCount(String value) {
    try {
      int number = int.parse(value);

      if (number > 99) {
        return "99+";
      }

      return value;
    } catch (e) {
      return value;
    }
  }

  Widget _buildAdditionalInfo({
    required String title,
    required IconData icon,
    required Color color,
    required String leading,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.medium,
              color: AppColors.instance.black300,
            ),
          ),
        ),

        const SizedBox(width: 16),

        Flexible(
          child: Text(
            leading,
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(String date) {
    return Material(
      borderRadius: BorderRadius.circular(6),
      elevation: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 6,
        ), // Better padding
        decoration: BoxDecoration(
          color: AppColors.instance.grey200,
          border: Border.all(
            style: BorderStyle.solid,
            color: AppColors.instance.teal300,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: IntrinsicWidth(
          // ← Key: Only as wide as text needs
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 80,
            ), // Optional: prevent too narrow
            child: Text(
              "${formatToShortMonthDay(date)}, ${formatToTime(date)}",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.teal400,
                fontWeight: FontFamilies.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnonymouswidget(bool isAnonymous, String reporterName) {
    return Card(
      color: Colors.white,
      elevation: 1, // Optional: tiny shadow for depth (matches Material style)
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        ), // Slightly more comfortable
        child: Row(
          mainAxisSize: MainAxisSize.min, // ← Key: Only as wide as needed
          children: [
            Image.asset(
              isAnonymous ? AssetPaths.anonymous : AssetPaths.navProfileActive,
              height: 20,
              width: 16,
              color: AppColors.instance.teal300,
            ),
            const SizedBox(width: 6),
            Flexible(
              // ← Allows text to shrink/clip if too long
              child: Text(
                isAnonymous ? "Anonymous" : reporterName,
                overflow:
                    TextOverflow.ellipsis, // ← Clean clipping for long names
                maxLines: 1,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black500,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
