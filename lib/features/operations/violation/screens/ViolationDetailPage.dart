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
                          children: [
                            _buildAnonymouswidget(
                              widget.violation.isAnonymous,
                              widget.violation.reporter.name,
                            ),
                            _buildActionButtons(widget.violation.updatedAt),
                          ],
                        ),
                        const SizedBox(height: 12), // Space before new section
                        // Report User Info Section
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
      // Convert string to integer
      int number = int.parse(value);
      // Check if number is greater than 99
      if (number > 99) {
        return "99+";
      }
      // Return original value if 99 or less
      return value;
    } catch (e) {
      // Handle invalid input (non-numeric string)
      return value; // or return "0" or another fallback based on your needs
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
        Row(
          children: [
            // Icon(icon, color: color),
            // SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.medium,
                color: AppColors.instance.black300,
              ),
            ),
          ],
        ),

        Text(
          leading,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black600,
            fontSize: 12,
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
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.instance.grey200,
          border: Border.all(
            style: BorderStyle.solid,
            color: AppColors.instance.teal300,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          "${formatToShortMonthDay(date)}, ${formatToTime(date)}",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.teal400,
            fontWeight: FontFamilies.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildAnonymouswidget(bool isAnonymous, String reporterName) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
        child: Row(
          children: [
            Image.asset(
              isAnonymous ? AssetPaths.anonymous : AssetPaths.navProfileActive,
              height: 20,
              width: 16,
              color: AppColors.instance.teal300,
            ),
            SizedBox(width: 4),
            Text(
              isAnonymous ? "Anonymous" : reporterName,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
