import 'dart:math';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/OTP_Activation/provider/active_provider.dart';
import 'package:curnectgate/features/%20operations/OTP_Activation/screen/Activate_Otp_screen.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/screen/viewAll.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/dashBordRowcard.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/empty_body.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/headCard.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/reusable_vistor_card.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/vewMoreButton.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/visitorActiveCount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dashborad extends ConsumerWidget {
  Dashborad({super.key});
  int maxItems = 2;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: _buildAppBar(),
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
                ),
              ),
              SizedBox(height: 15),
              _buildvisitorRow(),
              _buildContent(size, context, ref),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
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
        _buildNotificationBell(),
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
            onTap: () {},
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Otpactivation()),
              );
            },
          ),
          SizedBox(width: 10),
          Dashbordrowcard(
            title: "Report",
            icon: AssetPaths.dashboardReports,
            onTap: () {},
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

  Widget _buildNotificationBell() {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Stack(
        clipBehavior: Clip.none, // allows badge to overflow if needed
        children: [
          Image.asset(AssetPaths.dashboardNotification, width: 25, height: 20),
          Positioned(
            top: -4,
            right: -4,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.instance.yellow500,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                "1000",
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
    );
  }
}
