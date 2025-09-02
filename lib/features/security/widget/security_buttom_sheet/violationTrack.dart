import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/security/widget/custom_tabbar.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/bottom_tap/violation_track_tab/Investigating.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/bottom_tap/violation_track_tab/Resolved.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/bottom_tap/violation_track_tab/dismissing_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Violationtrack extends ConsumerStatefulWidget {
  final String title;
  final String subtitle;
  const Violationtrack({
    super.key,
    required this.subtitle,
    required this.title,
  });

  @override
  ConsumerState<Violationtrack> createState() => _ViolationtrackState();
}

class _ViolationtrackState extends ConsumerState<Violationtrack>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Header section (title, subtitle, close button)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontFamilies.bold,
                    fontSize: 20,
                    color: AppColors.instance.black600,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  widget.subtitle,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 12,
                    color: AppColors.instance.black300,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          MyCustomTabBar(
            controller: _tabController,
            tabs: [
              Tab(child: Text('Investigating')),
              Tab(text: 'Resolved'),
              Tab(text: 'Dismissed'),
            ],
            labelColor: Colors.grey.shade300,
            unselectedLabelColor: AppColors.instance.black300,
            labelStyle: TextStyle(
              fontSize: 14,
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
            ),
            unselectedLabelStyle: TextStyle(fontSize: 14, color: Colors.black),
            tabBackgroundColor: AppColors.instance.grey300,
            tabBorderColor: AppColors.instance.grey300,
            tabForegroundColor: Colors.white,
            isScrollable: false,
            indicatorColor: Colors.white,
            indicatorAnimation: TabIndicatorAnimation.elastic,
            labelPadding: EdgeInsets.symmetric(horizontal: 16.0),
          ),
          SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [PendingWidget(), Resolved(), Dismissing()],
            ),
          ),
        ],
      ),
    );
  }
}
