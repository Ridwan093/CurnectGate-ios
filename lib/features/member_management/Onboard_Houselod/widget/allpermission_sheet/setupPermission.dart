import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PermissionSetupScreen extends ConsumerWidget {
  final int id;
  const PermissionSetupScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Center text "Setup Permission"
          Text(
            'Set Permission',
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 15,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
            ),
          ),
          const SizedBox(height: 20),
          // Grey container with grid buttons
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
            decoration: BoxDecoration(
              color: AppColors.instance.grey300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Grid of permission buttons
                  Column(
                    children: [
                      // First row of buttons
                      Row(
                        children: [
                          Expanded(
                            child: _buildPermissionButton(
                              context,
                              AssetPaths.setCurfew,
                              "Set Curfew",
                              () {
                                showUserBottomSheet(
                                  context: context,
                                  headertitle: "",
                                  headersubtitle: "",
                                  ref: ref,
                                  bottom: BottomSheetView.setCofew,
                                  id: id,
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: _buildPermissionButton(
                              context,
                              AssetPaths.visitorivite,
                              "Visitor Invite",
                              () {
                                context.pop();
                                showUserBottomSheet(
                                  context: context,
                                  headertitle: "",
                                  headersubtitle: "",
                                  ref: ref,
                                  bottom: BottomSheetView.visitorIvitaion,
                                  id: id,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),

                      // Second row of buttons
                      Row(
                        children: [
                          Expanded(
                            child: _buildPermissionButton(
                              context,
                              AssetPaths.facility,
                              "Facility Access",
                              () {
                                showUserBottomSheet(
                                  context: context,
                                  headertitle: "",
                                  headersubtitle: "",
                                  ref: ref,
                                  bottom: BottomSheetView.facility,
                                  id: id,
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: _buildPermissionButton(
                              context,
                              AssetPaths.parkingaccess,
                              "Parking Access",
                              () {
                                context.pop();
                                showUserBottomSheet(
                                  context: context,
                                  headertitle: "",
                                  headersubtitle: "",
                                  ref: ref,
                                  bottom: BottomSheetView.parking,
                                  id: id,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),

                      // Third row of buttons
                      Row(
                        children: [
                          Expanded(
                            child: _buildPermissionButton(
                              context,
                              AssetPaths.forum,
                              "Gate Access",
                              () {
                                context.pop();
                                showUserBottomSheet(
                                  context: context,
                                  headertitle: "",
                                  headersubtitle: "",
                                  ref: ref,
                                  bottom: BottomSheetView.gateAccess,
                                  id: id,
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: _buildPermissionButton(
                              context,
                              AssetPaths.communutys,
                              "Community",
                              () {
                                context.pop();
                                showUserBottomSheet(
                                  context: context,
                                  headertitle: "",
                                  headersubtitle: "",
                                  ref: ref,
                                  bottom: BottomSheetView.communty,
                                  id: id,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),

                      // Fourth row of buttons
                      Row(
                        children: [
                          Expanded(
                            child: _buildPermissionButton(
                              context,
                              AssetPaths.maintenance,
                              "Night Access",
                              () {
                                context.pop();
                                showUserBottomSheet(
                                  context: context,
                                  headertitle: "",
                                  headersubtitle: "",
                                  ref: ref,
                                  bottom: BottomSheetView.nightAccess,
                                  id: id,
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: _buildPermissionButton(
                              context,
                              "",
                              "All Permission",
                              () {
                                context.pop();
                                showUserBottomSheet(
                                  context: context,
                                  headertitle: "",
                                  headersubtitle: "",
                                  ref: ref,
                                  bottom: BottomSheetView.setbasicpermission,
                                  id: id,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Black close button
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // Close action
                context.pop();
              },
              child: const Text(
                "Close",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Updated button widget
  Widget _buildPermissionButton(
    BuildContext context,
    String icon,
    String text,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 15,
          bottom: 15,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Image.asset(
                  icon,
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                ),
              ),
            SizedBox(width: 10),
            Flexible(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  color: AppColors.instance.black600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
