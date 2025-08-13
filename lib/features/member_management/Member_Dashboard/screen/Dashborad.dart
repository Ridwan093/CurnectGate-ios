import 'dart:math';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/active_provider.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/activites_log.dart';
import 'package:curnectgate/features/operations/notifications/event/model/event_model.dart';
import 'package:curnectgate/features/operations/notifications/provider/eventprovider.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/screen/viewAll.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/dasboardEventCard.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/dashBordRowcard.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/empty_body.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/headCard.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/reusable_vistor_card.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/vewMoreButton.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/visitorActiveCount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Dashborad extends ConsumerWidget {
  Dashborad({super.key});
  int maxItems = 2;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Headcard(),
              SizedBox(height: 15),
              _buildRow(context),
              SizedBox(height: 25),
              Text(
                "YOUR DUES",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                  fontWeight: FontFamilies.bold,
                ),
              ),
              SizedBox(height: 15),
              _buildDueCard("95,000"),
              SizedBox(height: 20),
              Text(
                "VISITOR ACTIVITIES",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                  fontWeight: FontFamilies.bold,
                ),
              ),
              SizedBox(height: 15),
              _buildvisitorRow(),
              _buildContent(size, context, ref),
              SizedBox(height: 24),
              Text(
                "EVENTS",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                  fontWeight: FontFamilies.bold,
                ),
              ),
              SizedBox(height: 24),
              _buildEventContent(ref, context, size),
              SizedBox(height: 25),
              Text(
                "OTHER LINK",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                  fontWeight: FontFamilies.bold,
                ),
              ),
              SizedBox(height: 25),
              _otherLinks(
                title: "ADD FAMILY",
                onTap: () async {
                  SharedPrefsService().clearAuthData();
                },
              ),
              Divider(color: AppColors.instance.grey400),
              _otherLinks(title: "ACCOUNT SETTINGS", onTap: () {}),
              Divider(color: AppColors.instance.grey400),
              SizedBox(height: 5),
              _otherLinks(title: "VISITORS LOG", onTap: () {}),
              SizedBox(height: 20),
              Text(
                "NEED SAFETY HELP?",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                  fontWeight: FontFamilies.bold,
                ),
              ),
              SizedBox(height: 10),
              _buildSaftyRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSaftyRow() {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: _buildSaftyBox(
            onTap: () {},
            imagepath: AssetPaths.dashboardemergency,
            title: 'Emergency',
          ),
        ),
        Expanded(
          child: _buildSaftyBox(
            onTap: () {},
            imagepath: AssetPaths.dashboardCall,
            title: 'Support',
          ),
        ),
      ],
    );
  }

  Widget _buildSaftyBox({
    required String imagepath,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 10, left: 10),
        height: 80,

        decoration: BoxDecoration(
          color: AppColors.instance.grey300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          spacing: 10,

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagepath, width: 20),
            Text(
              title,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
                fontWeight: FontFamilies.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _otherLinks({required String title, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
                fontWeight: FontFamilies.bold,
                fontSize: 13,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.instance.black600,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventContent(WidgetRef ref, BuildContext context, Size size) {
    final state = ref.watch(eventsProvider);

    return Column(
      children: [
        if (state.events.isNotEmpty) ...[
          SizedBox(
            width: size.width,
            height: 300,
            child: _buildEventList(state.events, true, false, ref, context),
          ),
          ViewMoreButton(
            buttontext: "All events",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewAllPage()),
              );
            },
          ),
        ] else
          EmptyBody(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewAllPage()),
              );
            },
            imagepath: AssetPaths.dashboardEvents,
            emptyMessag: "Your visitor activity will appear here",
            buttonTexe: "View all",
          ),
      ],
    );
  }

  Widget _buildEventList(
    List<Event> events,
    bool showActions,
    bool isCancel,
    WidgetRef ref,
    BuildContext context,
  ) {
    final notifier = ref.read(eventsProvider.notifier);

    return ListView.builder(
      controller: PrimaryScrollController.of(context),
      itemCount: events.length,
      itemBuilder:
          (context, index) => DasboardEventcard(
            iscancle: isCancel,
            event: events[index],
            showActions: showActions,
            onGoing: notifier.toggleEventAttendance,
            onTap: () => notifier.selectEvent(events[index]),
          ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: 50,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(AssetPaths.userAvatar2),
        ),
      ),
      actions: [
        Image.asset(AssetPaths.dashboardcalenderSetting, width: 20),
        SizedBox(width: 15),
        _buildNotificationBell(1000, context),
      ],
    );
  }

  Widget _buildContent(Size size, BuildContext context, WidgetRef ref) {
    final generatedList = ref.watch(
      generateNotifierProvider.select((s) => s.generatedList),
    );

    return Column(
      children: [
        if (generatedList.isNotEmpty) ...[
          SizedBox(height: 200, child: _buildMemberList(ref, size)),
          ViewMoreButton(
            buttontext: "View all",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewAllPage()),
              );
            },
          ),
        ] else
          EmptyBody(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewAllPage()),
              );
            },
            imagepath: AssetPaths.dashboardActivities,
            emptyMessag: "Your visitor activity will appear here",
            buttonTexe: "View all",
          ),
      ],
    );
  }

  Widget _buildMemberList(WidgetRef ref, Size size) {
    final generatedList = ref.watch(
      generateNotifierProvider.select((s) => s.generatedList),
    );
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: min(2, generatedList.length),
      itemBuilder: (BuildContext context, int index) {
        final generatedLists = generatedList[index];
        return VisitorCard(
          userName: generatedLists.vistorName,
          purposeOfVisit: generatedLists.purposeofVisit,
          selectedDate: generatedLists.selectedDate,
          selectedTime: generatedLists.selectedTime,
          onChangePressed: () {},
        );
      },
    );
  }

  Widget _buildDueCard(String amount) {
    return Container(
      padding: EdgeInsets.all(12),
      height: 65,
      decoration: BoxDecoration(
        color: AppColors.instance.teal300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Amount Due:  #$amount",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontWeight: FontFamilies.bold,
            ),
          ),
          Container(
            height: 35,
            width: 70,
            decoration: BoxDecoration(
              color: AppColors.instance.black600,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                "Pay due",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.grey200,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Dashbordrowcard(
            title: "Digital ID",
            icon: AssetPaths.dashboardIdVerification,
            onTap: () async {
              final authData = await SharedPrefsService().getAuthData();
              bool status = authData?['user']?['digital_id_status'];

              if (status) {
                context.pushNamed(AppRoutes.digitalIDMember);
              } else {
                context.pushNamed(AppRoutes.digitalIDStarter);
              }
            },
          ),
          SizedBox(width: 10),
          Dashbordrowcard(
            title: "Work Order",
            icon: AssetPaths.dashboardWorkOrder,
            onTap: () {},
          ),
          SizedBox(width: 10),
          Dashbordrowcard(
            title: "Visitor",
            icon: AssetPaths.dashboardVisitors,
            onTap: () {
              context.pushNamed(AppRoutes.vendorLog);
            },
          ),
          SizedBox(width: 10),
          Dashbordrowcard(
            title: "Report",
            icon: AssetPaths.dashboardReports,
            onTap: () {
              context.pushNamed(AppRoutes.violation);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildvisitorRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Visitoractivecount(title: "Total today", count: '0'),
          SizedBox(width: 10),
          Visitoractivecount(title: "Active", count: "0"),
          SizedBox(width: 10),
          Visitoractivecount(title: "Expired", count: "0"),
        ],
      ),
    );
  }

  Widget _buildNotificationBell(int count, BuildContext context) {
    String displayCount = _formatCount(count);

    return Padding(
      padding: const EdgeInsets.only(right: 35),
      child: InkWell(
        onTap: () {
          // context.pushNamed(AppRoutes.notification);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ActivityPage()),
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              AssetPaths.dashboardNotification,
              width: 25,
              height: 25,
            ),
            if (count > 0)
              Positioned(
                top: -6,
                right: count > 999 ? -20 : -10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.instance.yellow500,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    displayCount,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.instance.black600,
                      fontFamily: FontFamilies.interDisplay,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Format number into compact form (e.g., 1k, 1.2M)
  String _formatCount(int count) {
    if (count >= 1000000) {
      return "${(count / 1000000).toStringAsFixed(1)}M";
    } else if (count >= 1000) {
      return "${(count / 1000).toStringAsFixed(1)}k";
    } else {
      return count.toString();
    }
  }
}
