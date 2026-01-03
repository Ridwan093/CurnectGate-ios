import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/permission_widget/hurs_days_widget.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddRestrictions extends ConsumerWidget {
  final int id;
  AddRestrictions({super.key, required this.id});
  final _controler = TextEditingController();
  final hours = [
    '1 hr',
    '2 hrs',
    '3 hrs',
    '6 hrs',
    '12 hrs',
    '18 hrs',
    '24 hrs',
  ];
  final days = [
    'Monday',
    'Tusady',
    'Wednsday',
    'Thusday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(formProvider);
    final notifier = ref.read(formProvider.notifier);

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          Text(
            "Restrictions",
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
                  title: "Enable Restrictions",
                  value: state.restrictionValue ?? false,
                  onChanged: notifier.updateRestrictionValue,
                ),
                const SizedBox(height: 12),

                // Requires Approval switch
                TextField(
                  keyboardType: TextInputType.name,
                  controller: _controler,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.instance.black500,
                      ),

                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.none),

                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.none),

                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "add reason",
                    hintStyle: TextStyle(
                      color: AppColors.instance.black300,
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.medium,
                    ),
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      notifier.updateRestrictionReason(value);
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          HoursAndDays(
            onChanged: (value) {
              notifier.updateRestrictionHours(value);
            },
            title: "Hours:",
            items: hours,
            selectedValue: state.restrictionHours ?? "",
          ),
          const SizedBox(height: 10),
          HoursAndDays(
            onChanged: (value) {
              notifier.updateRestrictiondays(value);
            },
            title: "Days:",
            items: days,
            selectedValue: state.restrictionDays ?? "",
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
                  state.restrictionDays!.isEmpty &&
                          state.restrictionHours!.isEmpty &&
                          state.restrictionReasion!.isEmpty
                      ? null
                      : () {
                        // Save logic
                        notifier.landlordRestrictions(
                          context: context,
                          id: id,
                          ref: ref,
                          value: state.restrictionValue ?? false,
                        );
                        _controler.clear();
                      },
              child:
                  state.basicPermissionLoading!
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
          Flexible(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black600,
              ),
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
