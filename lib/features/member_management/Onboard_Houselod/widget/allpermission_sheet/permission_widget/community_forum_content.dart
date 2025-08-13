import 'dart:developer';

import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/permision_slug_model/permission_model.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/provider.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/permission_widget/reusable_reason_widget.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunityForumContent extends ConsumerStatefulWidget {
  final Map<String, Permission>? permission;
  final int id;
  const CommunityForumContent({
    super.key,
    required this.id,
    required this.permission,
  });

  @override
  ConsumerState<CommunityForumContent> createState() =>
      _VisitorInivitaitonCotentState();
}

class _VisitorInivitaitonCotentState
    extends ConsumerState<CommunityForumContent> {
  final _rasoncontoller = TextEditingController();
  final _max1Controller = TextEditingController();
  final _max2Contoller = TextEditingController();

  Permission? get gateAccess => widget.permission?['community_forum'];

  bool? get communityEnable =>
      ref.watch(notificationProviders).isCommunityEnabel ?? false;

  bool? get moderated => ref.watch(notificationProviders).moderated ?? false;

  void initState() {
    super.initState();
    // _initializeState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeState();
    });
  }

  void _initializeState() {
    final notifier = ref.read(notificationProviders.notifier);
    final communityForum = widget.permission?['community_forum'];

    if (communityForum != null) {
      notifier.togglecommunityforum(communityForum.isActive ?? false);

      notifier.togglemoderated(communityForum.conditions?.moderated ?? false);
    }
  }

  void restform() {
    _max1Controller.clear();
    _max2Contoller.clear();
    _rasoncontoller.clear();
  }

  void dispose() {
    super.dispose();
    _max1Controller.dispose();
    _max2Contoller.dispose();
    _rasoncontoller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notificationProviders);
    final notifier = ref.read(notificationProviders.notifier);
    final providerstate = ref.read((formProvider.notifier));
    final isLoading = ref.watch(formProvider).communityAccessLoading ?? false;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          Text(
            "Community forum",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.instance.black600,
              fontWeight: FontFamilies.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // Main container
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.instance.grey300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                // Enable Visitor Invitation switch
                _buildSwitchContainer(
                  title: "Enable Community Forum ",
                  value: communityEnable ?? false,
                  onChanged: notifier.togglecommunityforum,
                ),
                const SizedBox(height: 12),

                // Requires Approval switch
                _buildSwitchContainer(
                  title: "Moderated",
                  value: moderated ?? false,
                  onChanged: notifier.togglemoderated,
                ),
                const SizedBox(height: 12),
                ReusableReasonWidget(
                  controller: _rasoncontoller,
                  onChanged: (value) {
                    notifier.updateOtherReason(value);
                  },
                  isEnable: !communityEnable!,
                ),
                const SizedBox(height: 20),

                // Max Visitors per day
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Maximum daily posts",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontFamilies.bold,
                        color: AppColors.instance.black600,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      height: 40,
                      child: TextField(
                        controller: _max1Controller,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.instance.black500,
                            ),

                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.instance.black500,
                            ),

                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.instance.black500,
                            ),

                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          hintText: "(1)",
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            notifier.updateMaxpost(int.parse(value));
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Max Visitors per day
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Maximum daily comments",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontFamilies.bold,
                        color: AppColors.instance.black600,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      height: 40,
                      child: TextField(
                        controller: _max2Contoller,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.instance.black500,
                            ),

                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.instance.black500,
                            ),

                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.instance.black500,
                            ),

                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          hintText: "(1)",
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            notifier.updateMaxcomment(int.parse(value));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Save button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    communityEnable!
                        ? Colors.black
                        : AppColors.instance.black300,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed:
                  isLoading
                      ? null
                      : () {
                        if (communityEnable!) {
                          if (_rasoncontoller.text.isEmpty) {
                            log("Red------------->");
                            showCustomSuccessToast(
                              context: context,
                              message: "Please add a reason",
                              color: AppColors.instance.grey500,
                              icon: Icons.error,
                              iconColors: AppColors.instance.black600,
                              positionNumber: 70,
                            );
                          } else if (_max2Contoller.text.isEmpty) {
                            showCustomSuccessToast(
                              context: context,
                              message: "Please add max comment",
                              color: AppColors.instance.grey500,
                              icon: Icons.error,
                              iconColors: AppColors.instance.black600,
                              positionNumber: 70,
                            );
                          } else if (_max1Controller.text.isEmpty) {
                            showCustomSuccessToast(
                              context: context,
                              message: "Please add  max post",
                              color: AppColors.instance.grey500,
                              icon: Icons.error,
                              iconColors: AppColors.instance.black600,
                              positionNumber: 70,
                            );
                          } else if (_rasoncontoller.text.length < 15) {
                            showCustomSuccessToast(
                              context: context,
                              message: "Reason must be at least 15 characters",
                              color: AppColors.instance.grey500,
                              icon: Icons.error,
                              iconColors: AppColors.instance.black600,
                              positionNumber: 70,
                            );
                          } else {
                            providerstate.setcommnunityForumPermission(
                              context: context,
                              id: widget.id,
                              ref: ref,
                            );
                             restform();
                          }
                        } else {
                          providerstate.setcommnunityForumPermission(
                            context: context,
                            id: widget.id,
                            ref: ref,
                          );
                           restform();
                        }
                       
                      },
              child:
                  isLoading
                      ? Loadingstates()
                      : const Text(
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchContainer({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
            ),
          ),
          Switch(
            inactiveThumbColor: Colors.white,
            activeTrackColor: AppColors.instance.teal200,

            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
