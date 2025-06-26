import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dashborad extends ConsumerWidget {
  const Dashborad({super.key});

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
              _buildDashboardHeardCard(size),
              SizedBox(height: 15),
              _buildRow(),
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
            _buildvisitorRow()
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

  Widget _buildRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _builddashboardRowCard(
            title: "Digital ID",
            icon: AssetPaths.dashboardIdVerification,
            onTap: () {},
          ),
          SizedBox(width: 10),
          _builddashboardRowCard(
            title: "Work Order",
            icon: AssetPaths.dashboardWorkOrder,
            onTap: () {},
          ),
          SizedBox(width: 10),
          _builddashboardRowCard(
            title: "Visitor",
            icon: AssetPaths.dashboardVisitors,
            onTap: () {},
          ),
          SizedBox(width: 10),
          _builddashboardRowCard(
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
          _buildVisitorActivitesCard(
            title: "Total today",
            count: '0',
            onTap: () {},
          ),
          SizedBox(width: 10),
          _buildVisitorActivitesCard(
            title: "Active",
            count: "0",
            onTap: () {},
          ),
          SizedBox(width: 10),
          _buildVisitorActivitesCard(
            title: "Expired",
            count: "0",
            onTap: () {},
          ),
         
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

  Widget _buildVisitorActivitesCard(
    {
      required String title,
      required String count,
     required VoidCallback onTap
    }
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 8),
        height: 60,
        width: 100,
        decoration: BoxDecoration(
          color: AppColors.instance.grey300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 11,
                color: AppColors.instance.black300,
                fontWeight: FontFamilies.bold,
              ),
            ),
            SizedBox(height: 2),
            Expanded(
              child: Text(
                count,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 22,
                  color: AppColors.instance.black600,
                  fontWeight: FontFamilies.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardHeardCard(Size size) {
    return Column(
      children: [
        Material(
          color: AppColors.instance.teal400,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.all(12),
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.instance.teal400,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Greenville.",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 25,
                        color: AppColors.instance.grey200,
                        fontWeight: FontFamilies.bold,
                      ),
                    ),
                    Text(
                      "ESTATE",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 14,
                        wordSpacing: 10,
                        letterSpacing: 10,
                        color: AppColors.instance.grey400,
                        fontWeight: FontFamilies.medium,
                      ),
                    ),
                  ],
                ),
                Image.asset(AssetPaths.qrCode, width: 40, height: 40),
              ],
            ),
          ),
        ),
        Material(
          elevation: 3,
          color: AppColors.instance.teal200.withOpacity(.9),
          // ignore: deprecated_member_use
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.all(12),
            height: 100,
            width: size.width,
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: AppColors.instance.teal400.withOpacity(.8),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "MEMBER",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 14,

                    color: AppColors.instance.grey400,
                    fontWeight: FontFamilies.medium,
                  ),
                ),
                Text(
                  "Benjamin Afolabi",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 19,
                    color: AppColors.instance.grey200,
                    fontWeight: FontFamilies.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _builddashboardRowCard({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          height: 90,
          width: 70,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon, width: 20),
              SizedBox(height: 17),
              Text(
                title,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 11,
                  color: AppColors.instance.black600,
                  fontWeight: FontFamilies.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
