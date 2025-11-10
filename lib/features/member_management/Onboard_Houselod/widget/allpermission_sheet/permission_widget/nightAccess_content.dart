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

class NightAccessContent extends ConsumerStatefulWidget {
  final Map<String, Permission>? permission;
  final int id;
  const NightAccessContent({
    super.key,
    required this.id,
    required this.permission,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PackingAccessContentState();
}

class _PackingAccessContentState extends ConsumerState<NightAccessContent> {
  final _rasoncontoller = TextEditingController();
  final _max1Controller = TextEditingController();
  Permission? get packing => widget.permission?['night_access'];

  bool? get isNightEnable =>
      ref.watch(notificationProviders).isNightEnable ?? false;

  void initState() {
    super.initState();
    // _initializeState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeState();
    });
  }

  void _initializeState() {
    final notifier = ref.read(notificationProviders.notifier);
    final nightAccess = widget.permission?['parking_access'];

    if (nightAccess != null) {
      notifier.toggleNightaccess(nightAccess.isActive ?? false);
    }
  }

  void restform() {
    _max1Controller.clear();

    _rasoncontoller.clear();
  }

  void dispose() {
    super.dispose();
    _max1Controller.dispose();

    _rasoncontoller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notificationProviders);
    final notifier = ref.read(notificationProviders.notifier);
    final provider = ref.read(formProvider.notifier);
    final isLoading = ref.watch(formProvider).nightAccessLoading;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          Text(
            "Night access",
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
                  title: "Enable night access",
                  value: state.isNightEnable ?? false,
                  onChanged: notifier.toggleNightaccess,
                ),
                const SizedBox(height: 12),

                // Requires Approval switch
                ReusableReasonWidget(
                  controller: _rasoncontoller,
                  onChanged: (value) {
                    notifier.updateOtherReason(value);
                  },
                  isEnable: false,
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
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed:
                  !isLoading!
                      ? () {
                        if (isNightEnable!) {
                          if (_rasoncontoller.text.isEmpty) {
                            showCustomSuccessToast(
                              context: context,
                              message: "Please add a reason",
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

                            // providerstate.setFacilityPermission(
                            //   context: context,
                            //   id: widget.id,
                            //   ref: ref,
                            // );
                          } else {
                            provider.setNightAccesspermission(
                              context: context,
                              id: widget.id,
                              ref: ref,
                            );
                            restform();
                          }
                        } else {
                          provider.setNightAccesspermission(
                            context: context,
                            id: widget.id,
                            ref: ref,
                          );
                          restform();
                        }
                      }
                      : null,
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
