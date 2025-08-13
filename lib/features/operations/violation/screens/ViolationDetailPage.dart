import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/violation/model/report_models/violation.dart';
import 'package:curnectgate/features/operations/violation/widget/buildCommentList.dart';
import 'package:curnectgate/features/operations/violation/widget/build_sroll_effet.dart';
import 'package:curnectgate/features/operations/violation/widget/commentInput.dart';
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
  // ignore: library_private_types_in_public_api
  _ViolationDetailPageState createState() => _ViolationDetailPageState();
}

class _ViolationDetailPageState extends ConsumerState<ViolationDetailPage>
    with TickerProviderStateMixin {
  late final PageController _imageController;
  late final AnimationController _animationController;
  late final AnimationController _animationController2;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _fadeAnimation2;
  late final Animation<Offset> _slideAnimation;
  late final Animation<Offset> _slideAnimation2;

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
    _slideAnimation2 = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController2,
        curve: Curves.easeInOutCubic,
      ),
    );

    _fadeAnimation2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController2,
        curve: Curves.easeInOutCubic,
      ),
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

    // Start animation after build completes
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

  // e.g., "5m ago" or "Yesterday"

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
        slivers: [
          // Image Carousel Section
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            stretch: true, // Allows the app bar to stretch when over-scrolled
            pinned: false, // Not pinned to stay flexible
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
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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

                      const SizedBox(height: 16),

                      // Description
                      Text(
                        widget.violation.description,
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          color: AppColors.instance.black300,

                          fontSize: 12,
                        ),
                      ),

                      const SizedBox(height: 10),
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
                      const SizedBox(height: 24),

                      // Action Buttons
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Comments Section
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Image(
                            image: AssetImage(AssetPaths.navMessages),
                            color: AppColors.instance.black500,
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "( ${widget.violation.commentsSummary.totalComments} ) Comments",
                              overflow: TextOverflow.ellipsis,

                              style: TextStyle(
                                fontFamily: FontFamilies.interDisplay,
                                fontSize: 15,
                                color: AppColors.instance.black500,
                                fontWeight: FontFamilies.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Buildcommentlist(),
                      const SizedBox(height: 16),
                      Commentinput(
                        animationController2: _animationController2,
                        fadeAnimation2: _fadeAnimation2,
                        slideAnimation2: _slideAnimation2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(String date) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 1,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.instance.grey200,
          border: Border.all(
            style: BorderStyle.solid,
            color: AppColors.instance.teal300,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          "${formatToShortMonthDay(date)}, ${formatToTime(date)}",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.teal400,
            fontWeight: FontFamilies.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildAnonymouswidget(bool isAnonymous, String reporterName) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            Image.asset(
              isAnonymous ? AssetPaths.anonymous : AssetPaths.navProfileActive,
              height: 30,
              width: 20,
              color: AppColors.instance.teal300,
            ),
            SizedBox(width: 5),
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
