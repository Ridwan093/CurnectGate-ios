// tab_contents.dart
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class AllTabContent extends StatelessWidget {
  AllTabContent({super.key}); // Your list here
  final List<Map<String, dynamic>> activities = [
    {
      "icon": AssetPaths.addMember,
      "title": "Added to wallet",
      "date": "May 2 2024",
      "amount": "+₦24.000",
      "isPositive": true,
    },
    {
      "icon": AssetPaths.maintenance,
      "title": "Maintenance",
      "date": "May 1 2024",
      "amount": "-₦15.000",
      "isPositive": false,
    },
    {
      "icon": AssetPaths.maintenance,
      "title": "Maintenace",
      "date": "April 30 2024",
      "amount": "-₦17.000",
      "isPositive": false,
    },
    // Add more as needed
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final activity = activities[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor:
              AppColors.instance.teal100,
            child:activity['isPositive']?Icon(Icons.add,color:AppColors.instance.black600): Image.asset(activity['icon'],width: 20,),
          ),
          title: Text(activity['title'],style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color:AppColors.instance.black600,
              fontSize: 13,
              fontWeight: FontFamilies.bold
            ),),
          subtitle: Text(activity['date'],style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 10,
              color:  AppColors.instance.black300,
              fontWeight: FontFamilies.medium,
            ),),
          trailing: Text(
            activity['amount'],
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: activity['isPositive'] ? AppColors.instance.teal500: AppColors.instance.black300,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}

class DueTabContent extends StatelessWidget {
  const DueTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Due Tab Content'));
  }
}

class DepositTabContent extends StatelessWidget {
  const DepositTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Deposit Tab Content'));
  }
}
