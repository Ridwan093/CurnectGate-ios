import 'dart:developer';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/ResidentDirectory/Screen/bottom_seet/emergency.dart';
import 'package:curnectgate/features/chat/data/provider/chat_provier.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/chat_setting_widget.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/emergency_widget.dart';
import 'package:curnectgate/features/chat/presentation/screens/messagbody.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/venodrLod_model.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_screen/work_requst_screen.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/Set_restrictions.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/add_restrictions.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/basic_permission.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/community_forum.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/facility.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/gate_access.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/night_acess.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/packingAccess.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/removed_restrictions.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/setCufew.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/setupPermission.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/visitotIvitaion.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/Active_history.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/revokedOTP.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/all_bottom_widget/addReminder.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/all_bottom_widget/filter.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/all_bottom_widget/mars_reminder.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/all_bottom_widget/notyeSettings.dart';
import 'package:curnectgate/features/operations/violation/widget/report_form.dart';
import 'package:curnectgate/features/operations/violation/widget/resulationTime.dart';
import 'package:curnectgate/features/operations/violation/widget/violation_form_bottom_sheet.dart';
import 'package:curnectgate/features/payment/widget/buttom_sheet_widget/funding_wallet.dart';
import 'package:curnectgate/features/payment/widget/buttom_sheet_widget/payOutstanding.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/MenatainLog.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/accessGranted.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/addComment.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/confirmEntry.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/dismissing_report.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/specifyNumberofGuest.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/validateOtp.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/validatorComfirmEntry.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/violationTrack.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/workEmergency.dart';
import 'package:curnectgate/features/userProfile/profile/widget/change_password_sheet.dart';
import 'package:curnectgate/features/userProfile/profile/widget/decativeAccount.dart';
import 'package:curnectgate/features/userProfile/profile/widget/updateUserProfile.dart';
import 'package:curnectgate/features/userProfile/profile/widget/uplodeImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BottomsheetDetails extends ConsumerWidget {
  final String headertitle;
  final String headersubtitle;
  final BottomSheetView bottom;
  VendorLogModel? vendor;
  int? id;

  BottomsheetDetails({
    super.key,
    required this.headertitle,
    required this.headersubtitle,
    required this.bottom,
    this.vendor,
    this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (bottom) {
      case BottomSheetView.chatSettings:
        return ChatSettingsBottomSheet();
      case BottomSheetView.messageEmergency:
        return EmergencyWidget();

      case BottomSheetView.reportviolation:
        return ViolationFormBottomSheet(
          widget: ReportForm(),
          title: headertitle,
          subtitle: headersubtitle,
        );
      case BottomSheetView.activeOTPHistory:
        return ActiveHistory();

      case BottomSheetView.resolutionTime:
        return ResolutionTimeline(id: id ?? 0, title: headertitle);
      case BottomSheetView.fundingWithbankTransfer:
        return FundingWallet(headertitle: headertitle);
      case BottomSheetView.payOustanding:
        return PayOutstanding(headertitle: headertitle);
      case BottomSheetView.confirmEntry:
        return Confirmentry(
          userprofilePc: "",
          name: headertitle,
          type: headersubtitle,
          houseAddress: "",
        );
      case BottomSheetView.validatedOTP:
        return Validateotp();
      case BottomSheetView.valdationConfrm:
        return ValidateConfirmEntry();
      case BottomSheetView.accesGranted:
        return Accessgranted();
      case BottomSheetView.specifyNumberofGust:
        return SpecifyumberOfGuest();
      case BottomSheetView.workEmgencyContacts:
        return WorkEmergency();
      case BottomSheetView.residentEmgencyContacts:
        return Residentmergency();
      case BottomSheetView.profileUpdat:
        return UpdateProfileDialog();
      case BottomSheetView.profilePiceUpdate:
        return UpdateProfilePrompt();

      case BottomSheetView.deactivateAccount:
        return DeactiveAccount();
      case BottomSheetView.changePassword:
        return ChangePasswordSheet();
      case BottomSheetView.notificationReminderFilter:
        return Filter();
      case BottomSheetView.notificationSetting:
        return SetCustomAlert();
      case BottomSheetView.addReminder:
        return AddReminder();
      case BottomSheetView.remidermarks:
        return MarksReminder(title: headertitle, subtitle: headersubtitle);

      case BottomSheetView.revorkActiveOtp:
        return Revokedotp(
          title: headertitle,
          subtitle: headersubtitle,
          id: id ?? 0,
        );

      case BottomSheetView.setCofew:
        return CurfewSettingsScreen(id: id ?? 0);
      case BottomSheetView.setbasicpermission:
        return BasicPermission(id: id ?? 0);
      case BottomSheetView.visitorIvitaion:
        return VisitorSettingsScreen(id: id ?? 0);
      case BottomSheetView.setPermission:
        return PermissionSetupScreen(id: id ?? 0);
      case BottomSheetView.facility:
        return FacilitySettingsScreen(id: id ?? 0);
      case BottomSheetView.parking:
        return PackingAccessSettingsScreen(id: id ?? 0);
      case BottomSheetView.setRestrictions:
        return SetRestrictions(id: id ?? 0, username: headertitle);
      case BottomSheetView.addRestrictions:
        return AddRestrictions(id: id ?? 0);
      case BottomSheetView.removedRestrictions:
        return RemovedRestrictions(id: id ?? 0, userName: headertitle);

      case BottomSheetView.gateAccess:
        return GateSettingsScreen(id: id ?? 0);
      case BottomSheetView.communty:
        return Community_Forum(id: id ?? 0);

      case BottomSheetView.nightAccess:
        return NightAccessSettingsScreen(id: id ?? 0);

      case BottomSheetView.securityViolationTrack:
        return Violationtrack(title: headertitle, subtitle: headersubtitle);

      case BottomSheetView.securityCommentMaker:
        return Addcomment(
          title: headertitle,
          reportBy: headersubtitle,
          date: "Date: July 8, 2025",
        );

      case BottomSheetView.securitydismissViolation:
        return DismissingReport(
          title: headertitle,
          reportBy: headersubtitle,
          id: id ?? 0,
        );
      case BottomSheetView.mentainLog:
        return MatainLog(title: headertitle, subtitle: headersubtitle);

      default:
        return SingleChildScrollView(
          child: Column(
            key: const ValueKey('userDetails'),
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header section
              Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  Text(
                    headertitle,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 20,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    headersubtitle,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 12,
                      color: AppColors.instance.black300,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              _buildPrimaryOptionTile(bottom, ref, context, id ?? 0),
              const SizedBox(height: 5),

              // Secondary option tile
              _buildSecondaryOptionTile(bottom, ref, context),
              const SizedBox(height: 5),
              if (bottom == BottomSheetView.permissions)
                _buildSetrestrictions(bottom, ref, context),

              if (bottom == BottomSheetView.messageuplodefile ||
                  bottom == BottomSheetView.permissions) ...[
                const SizedBox(height: 5),
                _buildthirdaryOptionTile(bottom, ref, context),
              ],

              const SizedBox(height: 5),
            ],
          ),
        );
    }
  }

  // Switch-case for the first ListTile (e.g., Edit or Set permissions)
  Widget _buildPrimaryOptionTile(
    BottomSheetView bottom,
    WidgetRef ref,
    BuildContext context,
    int id,
  ) {
    late VoidCallback onTap;
    late Widget leading;
    late String title;

    final chatNotifier = ref.watch(chatProvider.notifier);

    switch (bottom) {
      case BottomSheetView.vendorLog:
        onTap = () {
          log(vendor!.vendorName);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubmitWorkOrderPage(vendor: vendor),
            ),
          );
        };
        leading = CircleAvatar(
          backgroundColor: AppColors.instance.grey400,
          child: Center(
            child: Icon(
              Icons.drive_file_rename_outline_outlined,
              color: AppColors.instance.black600,
            ),
          ),
        );
        title = "Edit vendor Log";
        break;

      case BottomSheetView.permissions:
        onTap = () {
          context.pop();
          showUserBottomSheet(
            context: context,
            headertitle: "",
            headersubtitle: "",
            ref: ref,
            bottom: BottomSheetView.setbasicpermission,
            id: id,
          );
        };
        leading = CircleAvatar(
          backgroundColor: AppColors.instance.grey400,
          backgroundImage: AssetImage(AssetPaths.permission),
        );
        title = "Basic permissions";
        break;
      case BottomSheetView.startConversation:
        onTap = () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MessageScreens()),
          );
        };
        leading = CircleAvatar(
          backgroundColor: AppColors.instance.grey400,
          backgroundImage: AssetImage(AssetPaths.searchUser),
        );
        title = "Reach out to an estate Comittee";
        break;
      case BottomSheetView.manageOTPforvisitor:
        onTap = () async {
          ref.read(bottomSheetStateProvider.notifier).state =
              BottomSheetView.generateOtpwithperiod;
        };
        leading = Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.instance.grey400,
          ),
          child: Center(
            child: Image.asset(
              AssetPaths.generateOtpwithperiod,
              width: 25,
              height: 25,
            ),
          ),
        );
        title = "Generate OTP with Validity";
        break;
      case BottomSheetView.messageuplodefile:
      default:
        onTap = () async {
          Navigator.of(context).pop();
          await chatNotifier.pickImagefromcamera();
        };
        leading = Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.instance.grey400,
          ),
          child: Center(
            child: Image.asset(AssetPaths.takephoto, width: 25, height: 25),
          ),
        );

        // CircleAvatar(
        //   backgroundColor: AppColors.instance.grey400,
        //   backgroundImage: AssetImage(AssetPaths.takephoto),
        // );
        title = "Take Photo";
        break;
    }

    return Container(
      height: 100,
      color: AppColors.instance.grey300,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        onTap: onTap,
        leading: leading,
        title: Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  // Switch-case for the second ListTile (e.g., Revoke or Remove)
  Widget _buildSecondaryOptionTile(
    BottomSheetView bottom,
    WidgetRef ref,
    BuildContext context,
  ) {
    late VoidCallback onTap;
    late Widget leading;
    late String title;

    final chatNotifier = ref.watch(chatProvider.notifier);
    switch (bottom) {
      case BottomSheetView.vendorLog:
        onTap = () {
          ref.read(bottomSheetStateProvider.notifier).state =
              BottomSheetView.revokevendorconfirm;
        };
        leading = CircleAvatar(
          backgroundColor: AppColors.instance.error300,
          child: Center(
            child: Icon(Icons.restore, color: AppColors.instance.error500),
          ),
        );
        title = "Revoke vendor Log";
        break;
      case BottomSheetView.revorkActiveOtp:
        onTap = () {
          ref.read(bottomSheetStateProvider.notifier).state =
              BottomSheetView.revorkActiveOtpConfirmation;
        };
        leading = CircleAvatar(
          backgroundColor: AppColors.instance.error300,
          child: Center(
            child: Icon(Icons.restore, color: AppColors.instance.error500),
          ),
        );
        title = "Revoke active Otp";
        break;

      case BottomSheetView.permissions:
        onTap = () {
          context.pop();
          showUserBottomSheet(
            context: context,
            headertitle: "",
            headersubtitle: "",
            ref: ref,
            bottom: BottomSheetView.setPermission,
            id: id,
          );
        };
        leading = CircleAvatar(
          backgroundColor: AppColors.instance.grey400,
          child: Center(
            child: Image.asset(
              AssetPaths.setCurfeSetting,
              width: 20,
              height: 20,
            ),
          ),
        );
        title = "Permission";
        break;
      case BottomSheetView.startConversation:
        onTap = () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MessageScreens()),
          );
        };
        leading = CircleAvatar(
          backgroundColor: AppColors.instance.error300,
          backgroundImage: AssetImage(AssetPaths.reachout),
        );
        title = "Reach out to an estate Security";
        break;
      case BottomSheetView.messageuplodefile:
        onTap = () async {
          Navigator.of(context).pop();
          await chatNotifier.pickImage();
        };
        leading = Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.instance.grey400,
          ),
          child: Center(
            child: Image.asset(
              AssetPaths.choosfromgallery,
              width: 25,
              height: 25,
            ),
          ),
        );
        title = "Choose from Gallery";
        break;
      case BottomSheetView.manageOTPforvisitor:
        onTap = () async {
          ref.read(bottomSheetStateProvider.notifier).state =
              BottomSheetView.scheduleOtp;
        };
        leading = Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.instance.grey400,
          ),
          child: Center(
            child: Image.asset(AssetPaths.scheduleOtp, width: 25, height: 25),
          ),
        );
        title = "Schedule OTPs in Advance";
        break;
      case BottomSheetView.messageEmergency:
      default:
        onTap = () {};
        leading = SizedBox();
        title = "";
        break;
    }
    //// we only need one container for emergency?
    return bottom == BottomSheetView.messageEmergency
        ? SizedBox()
        : Container(
          height: 100,
          color: AppColors.instance.grey300,
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            onTap: onTap,
            leading: leading,
            title: Text(
              title,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                fontSize: 15,
              ),
            ),
          ),
        );
  }

  Widget _buildthirdaryOptionTile(
    BottomSheetView bottom,
    WidgetRef ref,
    BuildContext context,
  ) {
    late VoidCallback onTap;
    late Widget leading;
    late String title;
    final chatNotifier = ref.watch(chatProvider.notifier);

    switch (bottom) {
      case BottomSheetView.messageuplodefile:
        onTap = () async {
          Navigator.of(context).pop();
          await chatNotifier.pickFile();
        };
        leading = Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.instance.grey400,
          ),
          child: Center(
            child: Image.asset(AssetPaths.chooseFile, width: 25, height: 25),
          ),
        );
        title = "Choose file";
      case BottomSheetView.permissions:
        onTap = () {
          ref.read(bottomSheetStateProvider.notifier).state =
              BottomSheetView.deleteConfirmation;
        };
        leading = CircleAvatar(
          backgroundColor: AppColors.instance.error300,
          backgroundImage: AssetImage(AssetPaths.remove),
        );
        title = "Remove family member";
        break;
      default:
        onTap = () async {
          Navigator.of(context).pop();
          await chatNotifier.pickFile();
        };
        leading = Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.instance.grey400,
          ),
          child: Center(
            child: Image.asset(AssetPaths.chooseFile, width: 25, height: 25),
          ),
        );
        title = "Choose file";
        break;
    }

    return Container(
      height: 100,
      color: AppColors.instance.grey300,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        onTap: onTap,
        leading: leading,
        title: Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildSetrestrictions(
    BottomSheetView bottom,
    WidgetRef ref,
    BuildContext context,
  ) {
    late VoidCallback onTap;
    late Widget leading;
    late String title;

    switch (bottom) {
      case BottomSheetView.permissions:
        onTap = () {
          context.pop();
          showUserBottomSheet(
            context: context,
            headertitle: headertitle,
            headersubtitle: "",
            ref: ref,
            bottom: BottomSheetView.setRestrictions,
            id: id,
          );
        };
        leading = CircleAvatar(
          backgroundColor: AppColors.instance.grey400,
          child: Center(
            child: Image.asset(
              AssetPaths.setRestrictions,
              width: 20,
              height: 20,
            ),
          ),
        );
        title = "Set restriction";
        break;
      default:
        onTap = () {
          ref.read(bottomSheetStateProvider.notifier).state =
              BottomSheetView.deleteConfirmation;
        };
        leading = CircleAvatar(
          backgroundColor: AppColors.instance.error300,
          backgroundImage: AssetImage(AssetPaths.setRestrictions),
        );
        title = "Set restriction";
        break;
    }

    return Container(
      height: 100,
      color: AppColors.instance.grey300,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        onTap: onTap,
        leading: leading,
        title: Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
