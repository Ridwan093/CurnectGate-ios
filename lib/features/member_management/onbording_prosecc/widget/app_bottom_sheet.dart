import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/basic_permission.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/removeConfirmation_sheet.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/bottomsheet_details.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/active_provider.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/custom_validity.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/generateOTP_with_validity.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/scheduleOTPS.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/calendar_event_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/EventCodes/event_code_model.dart';
import 'package:curnectgate/features/operations/violation/widget/report_file_uplode.dart';
import 'package:curnectgate/features/operations/violation/widget/violation_form_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void showUserBottomSheet({
  required BuildContext context,
  required String headertitle,
  required String headersubtitle,
  required WidgetRef ref,
  required BottomSheetView bottom,
  CalendarEvent? event,
  EventCode? eventCode,
  int? id,
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
            padding:
                bottom == BottomSheetView.securityViolationTrack ||
                        bottom == BottomSheetView.mentainLog ||
                        bottom == BottomSheetView.optionForIdAndCode ||
                        bottom == BottomSheetView.optionForAll ||
                        bottom == BottomSheetView.optionForScan ||
                        bottom == BottomSheetView.events ||
                        bottom == BottomSheetView.eventsDetails
                    ? null
                    : EdgeInsets.all(20),
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
                event,
                eventCode,
                id,
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
  CalendarEvent? vendor,
  EventCode? eventcode,
  int? id,
) {
  switch (view) {
    case BottomSheetView.userDetails:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
        eventCode: eventcode,
        id: id,
      );
    case BottomSheetView.permissions:
      return BasicPermission(id: id ?? 0);

    case BottomSheetView.deleteConfirmation:
      return RemoveconfirmationSheet(id: id, userName: userName);
    case BottomSheetView.vendorLog:
      return RemoveconfirmationSheet(id: id, userName: userName);
    case BottomSheetView.revokevendorconfirm:
      return _buildVendorDeleteConfirmationView(context, ref);
    case BottomSheetView.revorkActiveOtpConfirmation:
      return _buildrevokActiveOtp(context, ref);

    case BottomSheetView.setCofew:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.eventSetting:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
        eventCode: eventcode,
      );
    case BottomSheetView.myeventCode:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.eventDeactive:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
        eventCode: eventcode,
      );
    case BottomSheetView.checkEventcode:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
        eventCode: eventcode,
      );
    case BottomSheetView.addpermitItems:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.seletctEvent:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.createdEvent:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.permitAccces:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.addRestrictions:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.setRestrictions:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.shedulPermit:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.schedulpermitItem:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.seletPermit:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.removedRestrictions:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.facility:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.events:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.eventsDetails:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.mentainLog:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.parking:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );

    case BottomSheetView.securitydismissViolation:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.additionForScan:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.denyEntry:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );

    case BottomSheetView.additionForDissmissedEntry:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.optionForAll:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.optionForIdAndCode:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.securityCommentMaker:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.securityViolationTrack:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.gateAccess:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.communty:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.nightAccess:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.visitorIvitaion:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.acceptCheckOut:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.commentvew:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.denyEntryConfirmation:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.workOdervalidation:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.visitorValidation:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.optionForScan:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.setbasicpermission:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.setPermission:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    // start conversation buttom sheet
    case BottomSheetView.revorkActiveOtp:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.startConversation:
      return BottomsheetDetails(
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.removedReminder:
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
        id: id,
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
      return FractionallySizedBox(
        heightFactor: 0.6,
        child: ViolationFormBottomSheet(
          titlefontSize: 18,
          subtitlefontSize: 13,
          widget: GenerateOTPWithValidity(),
          title: "Generate OTP with validity period",
          subtitle: "Select a date and time for the OTP to be generated.",
        ),
      );
    case BottomSheetView.validatorcustom:
      return CustomValidity(
        onChanged:
            (value) =>
                ref.read(generateNotifierProvider.notifier).setPeriod(value),
      );
    case BottomSheetView.scheduleOtp:
      return FractionallySizedBox(
        heightFactor: 0.7,
        child: ViolationFormBottomSheet(
          titlefontSize: 18,
          subtitlefontSize: 13,
          widget: ScheduleOTPinAdvance(),
          title: "Schedule OTPs in Advance",
          subtitle: "Select a date and time for the OTP to be generated.",
        ),
      );
    case BottomSheetView.activeOTPHistory:
      return ViolationFormBottomSheet(
        titlefontSize: 18,
        subtitlefontSize: 13,
        widget: ScheduleOTPinAdvance(),
        title: "OTP Usage History",
        subtitle: "Track who accessed your property and .",
      );
    case BottomSheetView.fundingWithbankTransfer:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.confirmEntry:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.payOustanding:
      return Text('payoustanding');
    case BottomSheetView.validatedOTP:
      return FractionallySizedBox(
        heightFactor: 0.6,
        child: ViolationFormBottomSheet(
          titlefontSize: 18,
          subtitlefontSize: 13,
          widget: GenerateOTPWithValidity(),
          title: "Validate OTP",
          subtitle: "Valiate access code to grant entry.",
        ),
      );
    case BottomSheetView.valdationConfrm:
      return FractionallySizedBox(
        heightFactor: 0.6,
        child: ViolationFormBottomSheet(
          titlefontSize: 18,
          subtitlefontSize: 13,
          widget: GenerateOTPWithValidity(),
          title: "Generate OTP with validity period",
          subtitle: "Select a date and time for the OTP to be generated.",
        ),
      );
    case BottomSheetView.specifyNumberofGust:
      return FractionallySizedBox(
        heightFactor: 0.6,
        child: ViolationFormBottomSheet(
          titlefontSize: 18,
          subtitlefontSize: 13,
          widget: GenerateOTPWithValidity(),
          title: "Generate OTP with validity period",
          subtitle: "Select a date and time for the OTP to be generated.",
        ),
      );
    case BottomSheetView.accesGranted:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.workEmgencyContacts:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.residentEmgencyContacts:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.notificationReminderFilter:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.addReminder:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.notificationSetting:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.remidermarks:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.profileUpdat:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.profilePiceUpdate:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.deactivateAccount:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.changePassword:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    // case BottomSheetView.preferenceSetting:
    //   return BottomsheetDetails(
    //     vendor: vendor,
    //     headertitle: userName,
    //     headersubtitle: userRole,
    //     bottom: bottom,
    //     options: options,
    //     onSelected: onSelected,
    //   );
  }
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
        'Revoke vendor Log?',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          fontWeight: FontFamilies.bold,
          color: AppColors.instance.black600,
        ),
      ),
      Text(
        'Are you sure you want to revoke vendor Log?',
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

Widget _buildrevokActiveOtp(BuildContext context, WidgetRef ref) {
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
        'Revoke Active Otp?',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          fontWeight: FontFamilies.bold,
          color: AppColors.instance.black600,
        ),
      ),
      Text(
        'Are you sure you want to revoke Active Otp?',
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
