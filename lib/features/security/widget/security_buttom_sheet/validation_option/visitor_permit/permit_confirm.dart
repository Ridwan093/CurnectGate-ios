import 'dart:convert';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../member_management/tabState/permission_tab_state.dart';

class ConfirmPermitentry extends ConsumerWidget {
  final String name;
  final String type;
  final int id;
  ConfirmPermitentry({
    super.key,
    required this.name,
    required this.type,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, dynamic> extractedData = json.decode(type);
    final Map<String, dynamic> data = json.decode(name);
    final clearancePermit = extractedData["data"]?["clearance_permit"];
    int id2 = clearancePermit["permit_id"] ?? 0;
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
            "Confirm Permit",
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
                    context.pop();
                    showUserBottomSheet(
                      id: id2,
                      context: context,
                      headertitle: "",
                      headersubtitle: extractedData['id'].toString(),
                      ref: ref,
                      bottom: BottomSheetView.checkoutPermitdeny,
                    );
                  },
                  title: "Deny permit",
                  color: AppColors.instance.grey500,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _buildFeatureButton(
                  onTap: () {
                    context.pop();
                    showUserBottomSheet(
                      id: id2,
                      context: context,
                      headertitle:
                          extractedData["data"]["visitor"]["code"] ?? "N/A",

                      headersubtitle: "",
                      ref: ref,
                      bottom: BottomSheetView.checkOutPermitApproved,
                    );
                  },
                  title: "Grant permit",
                  color: AppColors.instance.black600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget _buildUserInfoBox({
  //   required Size size,
  //   required Map<String, dynamic> extractedData,
  //   required Map<String, dynamic> data,
  // }) {
  //   return Container(
  //     padding: EdgeInsets.only(top: 10, bottom: 10),
  //     width: size.width,

  //     decoration: BoxDecoration(
  //       color: AppColors.instance.grey300,
  //       borderRadius: BorderRadius.circular(12),
  //     ),
  //     child: Column(
  //       children: [
  //         PentagonContainer(
  //           width: 80,
  //           height: 80,
  //           color: AppColors.instance.teal400,

  //           child: Center(
  //             child:
  //                 extractedData["visitor"]["generated_by"]['media_url'] == null
  //                     ? Icon(
  //                       Icons.person_3_sharp,
  //                       color: AppColors.instance.grey200,
  //                       size: 26,
  //                     )
  //                     : Image.network(
  //                       extractedData["visitor"]["generated_by"]['media_url'] ??
  //                           "N/A",
  //                       fit: BoxFit.cover,
  //                     ),
  //           ),
  //         ),
  //         SizedBox(height: 20),
  //         _buildText(
  //           title: "Name",
  //           subtitle:
  //               "${extractedData['firstname'].toString().toUpperCase()}  ${extractedData['lastname'].toString().toUpperCase()}",
  //         ),
  //         SizedBox(height: 20),
  //         _buildText(
  //           title: "Type",
  //           subtitle: extractedData['role'].toString().toUpperCase(),
  //         ),
  //         SizedBox(height: 20),
  //         _buildText(
  //           title: "House Address",
  //           subtitle: extractedData["estate_name"] ?? "N/A",
  //         ),
  //       ],
  //     ),
  //   );
  // }
  Widget _buildUserInfoBox({
    required Size size,
    required Map<String, dynamic> extractedData,
    required Map<String, dynamic> data,
  }) {
    final clearancePermit = extractedData["data"]?["clearance_permit"];
    final items = clearancePermit?["items_list"] ?? [];

    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      width: size.width,
      decoration: BoxDecoration(
        color: AppColors.instance.grey300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          /// Avatar
          // PentagonContainer(
          //   width: 80,
          //   height: 80,
          //   color: AppColors.instance.teal400,
          //   child: Center(
          //     child: extractedData["data"]?["otp"]?["generated_by"]?['media_url'] == null
          //         ? Icon(Icons.person_3_sharp,
          //             color: AppColors.instance.grey200, size: 26)
          //         : Image.network(
          //             extractedData["data"]?["otp"]?["generated_by"]?['media_url'] ??
          //                 "",
          //             fit: BoxFit.cover,
          //           ),
          //   ),
          // ),
          const SizedBox(height: 20),

          _buildText(
            title: "Guest Name",
            subtitle: "${extractedData['data']?['visitor']?['name'] ?? 'N/A'}",
          ),

          const SizedBox(height: 20),

          _buildText(
            title: "Generated By",
            subtitle:
                "${extractedData['data']?['otp']?['generated_by']?['firstname']?.toString().toUpperCase() ?? "N/A"}  ${extractedData['data']?['otp']?['generated_by']?['lastname']?.toString().toUpperCase() ?? "N/A"}",
          ),

          const SizedBox(height: 20),

          _buildText(
            title: "House Address",
            subtitle:
                extractedData["data"]?["otp"]?["generated_by"]?["estate_name"] ??
                "N/A",
          ),

          /// ✅ Clearance Permit Section (NEW)
          if (clearancePermit?["exists"] == true) ...[
            const SizedBox(height: 30),
            Text(
              "Clearance Permit",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                fontSize: 14,
                color: AppColors.instance.black600,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "${clearancePermit?["total_items"] ?? items.length} items allowed",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                fontSize: 12,
                color: AppColors.instance.teal400,
              ),
            ),

            const SizedBox(height: 15),

            /// Items List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                children: List.generate(items.length, (i) {
                  final item = items[i];
                  return Container(
                    width: size.width,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: AppColors.instance.grey200,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.instance.teal300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["name"] ?? "Unknown Item",
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontWeight: FontFamilies.bold,
                            fontSize: 13,
                            color: AppColors.instance.black600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          item["description"] ?? "",
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 11,
                            color: AppColors.instance.black400,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          item["category"] ?? "",
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 11,
                            color: AppColors.instance.teal400,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
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
