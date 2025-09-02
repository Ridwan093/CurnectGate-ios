import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/ResidentDirectory/Screen/tab_screen/resident.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/security/widget/custom_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResidentTab extends ConsumerStatefulWidget {
  ResidentTab({super.key});

  @override
  ConsumerState<ResidentTab> createState() => _ResidentState();
}

class _ResidentState extends ConsumerState<ResidentTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final searchState = ref.watch(residentSearchProvider);
    // final searchNotifier = ref.read(residentSearchProvider.notifier);

    return Scaffold(
      appBar: _buildAppBar(ref, context),
      body: SafeArea(
        child: Column(
          children: [
            // Header section (title, subtitle, close button)
            MyCustomTabBar(
              controller: _tabController,
              tabs: [Tab(child: Text('Resident')), Tab(text: 'Committee')],
              labelColor: Colors.grey.shade300,
              unselectedLabelColor: AppColors.instance.black300,
              labelStyle: TextStyle(
                fontSize: 14,
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
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
                children: [Residentss(), Text("Committe")],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(WidgetRef ref, BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.instance.black600,
          size: 14,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: InkWell(
            onTap:
                () => showUserBottomSheet(
                  context: context,
                  headertitle: "",
                  headersubtitle: "",
                  ref: ref,
                  bottom: BottomSheetView.residentEmgencyContacts,
                ),
            child: Icon(
              Icons.add_ic_call_outlined,
              weight: .8,
              color: AppColors.instance.error600,
            ),
          ),
        ),
      ],
    );
  }
}
