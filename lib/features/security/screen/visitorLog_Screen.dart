import 'package:curnectgate/features/security/widget/custom_tabbar.dart';
import 'package:flutter/material.dart';

class SegmentedTabScreen extends StatefulWidget {
  const SegmentedTabScreen({super.key});

  @override
  State<SegmentedTabScreen> createState() => _SegmentedTabScreenState();
}

class _SegmentedTabScreenState extends State<SegmentedTabScreen>
    with SingleTickerProviderStateMixin {
  String _selectedTab = 'Pending';
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Segmented Tabs')),
      body: MyCustomTabBar(
        controller: _tabController,
        tabs: [
          Tab(child: Text('Pending')),
          Tab(text: 'Approveed'),
          Tab(text: 'Dismissed'),
        ],
        // Ensure contrast with background
        labelColor: Colors.grey.shade300, // Selected tab text color
        unselectedLabelColor: Colors.grey.shade400,

        // Unselected tab text
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.amber,
        ),

        unselectedLabelStyle: TextStyle(fontSize: 14, color: Colors.black),
        tabBackgroundColor: Colors.grey.shade200,
        tabBorderColor: Colors.grey.shade300,

        tabForegroundColor: Colors.white,
        isScrollable: false,

        indicatorColor: Colors.white,

        indicatorAnimation: TabIndicatorAnimation.elastic,
        labelPadding: EdgeInsets.symmetric(horizontal: 16.0),
        // Important for dynamic width
      ),
    );
  }
}
