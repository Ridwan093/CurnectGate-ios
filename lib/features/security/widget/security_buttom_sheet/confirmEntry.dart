import 'dart:convert';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/customPath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../member_management/tabState/permission_tab_state.dart';

class Confirmentry extends ConsumerWidget {
  final String name;
  final String type;
  final int id;
  Confirmentry({
    super.key,
    required this.name,
    required this.type,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, dynamic> extractedData = json.decode(type);
    final Map<String, dynamic> data = json.decode(name);
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.close, color: AppColors.instance.black600),
            ),
          ),
          SizedBox(height: 25),
          Text(
            "Confirm Entry",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontSize: 14,
              fontWeight: FontFamilies.bold,
            ),
          ),
          SizedBox(height: 30),
          _buildUserInfoBox(
            size: size,
            extractedData: extractedData,
            data: data,
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: _buildFeatureButton(
                  onTap: () {
                    showUserBottomSheet(
                      id: id,
                      context: context,
                      headertitle: "",
                      headersubtitle: extractedData['id'].toString(),
                      ref: ref,
                      bottom: BottomSheetView.denyEntry,
                    );
                  },
                  title: "Deny Access",
                  color: AppColors.instance.grey500,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _buildFeatureButton(
                  onTap: () {
                    showUserBottomSheet(
                      id: id,
                      context: context,
                      headertitle: data["visitor_name"] ?? "N/A",

                      headersubtitle: "",
                      ref: ref,
                      bottom: BottomSheetView.specifyNumberofGust,
                    );
                  },
                  title: "Grant Access",
                  color: AppColors.instance.black600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfoBox({
    required Size size,
    required Map<String, dynamic> extractedData,
    required Map<String, dynamic> data,
  }) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      width: size.width,

      decoration: BoxDecoration(
        color: AppColors.instance.grey300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          PentagonContainer(
            width: 80,
            height: 80,
            color: AppColors.instance.teal400,

            child: Center(
              child:
                  extractedData['media_url'] == null
                      ? Icon(
                        Icons.person_3_sharp,
                        color: AppColors.instance.grey200,
                        size: 26,
                      )
                      : Image.network(
                        extractedData['media_url'] ?? "N/A",
                        fit: BoxFit.cover,
                      ),
            ),
          ),
          SizedBox(height: 20),
          _buildText(
            title: "Name",
            subtitle:
                "${extractedData['firstname'].toString().toUpperCase()}  ${extractedData['lastname'].toString().toUpperCase()}",
          ),
          SizedBox(height: 20),
          _buildText(
            title: "Type",
            subtitle: extractedData['role'].toString().toUpperCase(),
          ),
          SizedBox(height: 20),
          _buildText(
            title: "House Address",
            subtitle: extractedData["estate_name"] ?? "N/A",
          ),
        ],
      ),
    );
  }

  Widget _buildText({required String title, required String subtitle}) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 12,
            color: AppColors.instance.black300,
          ),
        ),
        SizedBox(height: 5),
        Text(
          subtitle,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,

            color: AppColors.instance.black600,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureButton({
    required VoidCallback onTap,
    required String title,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.grey200,
            ),
          ),
        ),
      ),
    );
  }
}
