import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/OTP_Activation/widget/generateOTP_with_validity.dart';
import 'package:curnectgate/features/%20operations/violation/widget/report_file_uplode.dart';
import 'package:curnectgate/features/%20operations/violation/widget/violation_form_bottom_sheet.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/venodrLod_model.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/member_management/widget/bottomsheet_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void showUserBottomSheet({
  required BuildContext context,
  required String headertitle,
  required String headersubtitle,
  required WidgetRef ref,
  required BottomSheetView bottom,
  VendorLogModel? vendor,
}) {
  ref.read(bottomSheetStateProvider.notifier).state =
      BottomSheetView.userDetails;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: true,
    isDismissible: true,
    useRootNavigator: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Consumer(
        builder: (context, ref, wid) {
          final currentView = ref.watch(bottomSheetStateProvider);
          return Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _buildCurrentView(
                currentView,
                context,
                ref,
                headertitle,
                headersubtitle,
                bottom,
                vendor,
              ),
            ),
          );
        },
      );
    },
  );
}

Widget _buildCurrentView(
  BottomSheetView view,
  BuildContext context,
  WidgetRef ref,
  String userName,
  String userRole,
  BottomSheetView bottom,
  VendorLogModel? vendor,
) {
  switch (view) {
    case BottomSheetView.userDetails:
      return BottomsheetDetails(
        vendor: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.permissions:
      return _buildPermissionsView(context, ref);
    case BottomSheetView.deleteConfirmation:
      return _buildDeleteConfirmationView(context, ref, userName);
    case BottomSheetView.vendorLog:
      return _buildDeleteConfirmationView(context, ref, userName);
    case BottomSheetView.revokevendorconfirm:
      return _buildVendorDeleteConfirmationView(context, ref);
    // start conversation buttom sheet
    case BottomSheetView.startConversation:
      return BottomsheetDetails(
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    // message file uploded bottom sheet
    case BottomSheetView.messageuplodefile:
      return BottomsheetDetails(
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    //messageEmagency bottom sheet
    case BottomSheetView.messageEmergency:
      return BottomsheetDetails(
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );

    ///chatsettin buttomshett
    case BottomSheetView.chatSettings:
      return bottom == BottomSheetView.chatSettings
          ? Text("")
          : SizedBox.shrink();
    case BottomSheetView.reportviolation:
      return BottomsheetDetails(
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.reportfileuplode:
      return ReportFileUplode(
        title: "Uplode file",
        subtitle: "Attache image from your gallery",
      );
    case BottomSheetView.resolutionTime:
      return BottomsheetDetails(
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.manageOTPforvisitor:
      return BottomsheetDetails(
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.generateOtpwithperiod:
      return ViolationFormBottomSheet(
        widget: GenerateOTPWithValidity(),
        title: "Generate OTP with validity period",
        subtitle: "select a date and time for the OTP to be generate ",
      );
    case BottomSheetView.scheduleOtp:
      return BottomsheetDetails(
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
  }
}

Widget _buildPermissionsView(BuildContext context, WidgetRef ref) {
  final permissionData = [
    {
      'type': PermissionType.managePayments,
      'title': 'Manage Payments',
      'subtitle': 'Let this user manage payment',
    },
    {
      'type': PermissionType.accessAllNotifications,
      'title': 'Access All Notifications',
      'subtitle': 'Let this user manage notification',
    },
    {
      'type': PermissionType.createManageVisitors,
      'title': 'Create and Manage Visitors',
      'subtitle': 'Can schedule, edit, or delete visitor entries.',
    },
    {
      'type': PermissionType.deactivatePass,
      'title': 'Deactivate pass',
      'subtitle': 'Remove access to the digital pass',
    },
  ];

  return Column(
    key: const ValueKey('permissions'),
    mainAxisSize: MainAxisSize.min,
    children: [
      // Header with back button
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
      Container(
        decoration: BoxDecoration(
          color: AppColors.instance.grey300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children:
              permissionData
                  .map(
                    (permission) => SwitchListTile(
                      thumbColor: WidgetStateProperty.resolveWith<Color>((
                        states,
                      ) {
                        if (states.contains(WidgetState.selected)) {
                          return AppColors.instance.grey200;
                        }
                        return AppColors.instance.grey200;
                      }),
                      activeTrackColor: AppColors.instance.black500,
                      inactiveTrackColor: AppColors.instance.grey300,

                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      title: Text(
                        permission['title'].toString(),
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: 13,
                          fontWeight: FontFamilies.bold,
                          color: AppColors.instance.black600,
                        ),
                      ),
                      subtitle: Text(
                        permission['subtitle'].toString(),
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: 10,
                          fontWeight: FontFamilies.medium,
                          color: AppColors.instance.black300,
                        ),
                      ),
                      value: ref
                          .watch(permissionsProvider)
                          .contains(permission['type'] as PermissionType),
                      onChanged:
                          (value) => ref
                              .read(permissionsProvider.notifier)
                              .toggle(permission['type'] as PermissionType),
                    ),
                  )
                  .toList(),
        ),
      ),
      const SizedBox(height: 20),
      _button(
        onPressed: () => Navigator.of(context).pop(),
        buttiontitle: "Close",
      ),
    ],
  );
}

Widget _buildDeleteConfirmationView(
  BuildContext context,
  WidgetRef ref,
  String userName,
) {
  return Column(
    key: const ValueKey('deleteConfirmation'),
    mainAxisSize: MainAxisSize.min,
    children: [
      Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed:
              () =>
                  ref.read(bottomSheetStateProvider.notifier).state =
                      BottomSheetView.userDetails,
          icon: Icon(Icons.close, color: AppColors.instance.black600),
        ),
      ),
      const SizedBox(height: 16),
      Text(
        'Are you sure you want to remove\n $userName?',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          fontWeight: FontFamilies.bold,
          color: AppColors.instance.black600,
        ),
      ),
      const SizedBox(height: 70),
      _button(
        onPressed: () {
          // Add your delete logic here
          Navigator.of(context).pop();
        },
        buttiontitle: "Yes, Continue",
      ),
    ],
  );
}

//  vendor log revoke confirmation------------->
Widget _buildVendorDeleteConfirmationView(BuildContext context, WidgetRef ref) {
  return Column(
    key: const ValueKey('deleteVendorConfirmation'),
    mainAxisSize: MainAxisSize.min,
    children: [
      Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed:
              () =>
                  ref.read(bottomSheetStateProvider.notifier).state =
                      BottomSheetView.userDetails,
          icon: Icon(Icons.close, color: AppColors.instance.black600),
        ),
      ),
      const SizedBox(height: 16),
      Text(
        'Revoke vendoe Log?',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          fontWeight: FontFamilies.bold,
          color: AppColors.instance.black600,
        ),
      ),
      Text(
        'Are you sure you want to revoke vendor log?',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          fontWeight: FontFamilies.medium,
          color: AppColors.instance.black300,
          fontSize: 15,
        ),
      ),
      const SizedBox(height: 70),
      _button(
        onPressed: () {
          // Add your delete logic here
          Navigator.of(context).pop();
        },
        buttiontitle: "Yes, Revoke",
      ),
    ],
  );
}

Widget _button({
  required VoidCallback onPressed,
  required String buttiontitle,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.instance.black600,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          buttiontitle,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 15,
            fontWeight: FontFamilies.medium,
            color: AppColors.instance.grey200,
          ),
        ),
      ),
    ),
  );
}
