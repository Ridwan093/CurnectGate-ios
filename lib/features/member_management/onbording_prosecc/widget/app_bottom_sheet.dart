import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/get_workOder/work_order.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/revokeWorkOder.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/basic_permission.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/removeConfirmation_sheet.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/bottomsheet_details.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/generateOTP_with_validity.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/scheduleOTPS.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/calendar_event_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/Event/resv_model/rsvp_event_history.dart';
import 'package:curnectgate/features/operations/notifications/event/model/EventCodes/event_code_model.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/remider/reminder_model.dart';
import 'package:curnectgate/features/operations/violation/widget/report_file_uplode.dart';
import 'package:curnectgate/features/operations/violation/widget/violation_form_bottom_sheet.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/dashbord_Model/payment_dashboard_data.dart';
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
  PaymentDashboardData? dashbordData,
  RsvpEventHistory? rsvpdata,
  String? digital_id_code,
  String? access_type,
  String? location,
  String? additional_notes,
  String? device_id,
  WorkOrder? vendor,

  int? id,
  ReminderModel? activity,
}) {
  ref.read(bottomSheetStateProvider.notifier).state =
      BottomSheetView.userDetails;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: true,
    useSafeArea: true,
    isDismissible: true,
    useRootNavigator: true,
    backgroundColor: Colors.transparent,
    constraints: const BoxConstraints(
      maxWidth: double.infinity,
      minWidth: double.infinity,
    ),
    builder: (BuildContext context) {
      final bottomInset = MediaQuery.of(context).viewInsets.bottom;
      final safeBottom = MediaQuery.of(context).padding.bottom;

      return Container(
        width: MediaQuery.sizeOf(context).width,
        padding:
            bottom == BottomSheetView.securityViolationTrack ||
                    bottom == BottomSheetView.mentainLog ||
                    bottom == BottomSheetView.optionForIdAndCode ||
                    bottom == BottomSheetView.optionForAll ||
                    bottom == BottomSheetView.optionForScan ||
                    bottom == BottomSheetView.events ||
                    bottom == BottomSheetView.eventsDetails ||
                    bottom == BottomSheetView.workOderSeletion ||
                    bottom == BottomSheetView.eventRsvpDetails ||
                    bottom == BottomSheetView.afterphoto ||
                    bottom == BottomSheetView.permitAccces
                ? null
                : const EdgeInsets.all(20),

        // ✅ PRO FIX — handle BOTH keyboard and nav bar
        margin: EdgeInsets.only(bottom: bottomInset),

        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),

        child: Padding(
          // ✅ protects against nav bar
          padding: EdgeInsets.only(bottom: safeBottom),
          child: Consumer(
            builder: (context, ref, _) {
              final currentView = ref.watch(bottomSheetStateProvider);

              return AnimatedSwitcher(
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
                  dashbordData,
                  id,
                  digital_id_code,
                  access_type,
                  location,
                  additional_notes,
                  device_id,
                  rsvpdata,
                  vendor,
                  activity,
                ),
              );
            },
          ),
        ),
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
  PaymentDashboardData? dashborddata,
  int? id,
  String? digital_id_code,
  String? access_type,
  String? location,
  String? additional_notes,
  String? device_id,
  RsvpEventHistory? event,
  WorkOrder? workOder,
  ReminderModel? activity,
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
        dashborddata: dashborddata,
        digital_id_code: digital_id_code,
        access_type: access_type,
        location: location,
        additional_notes: additional_notes,
        device_id: device_id,
        event: event,
        workOder: workOder,
        activity: activity,
      );
    case BottomSheetView.permissions:
      return BasicPermission(id: id ?? 0);

    case BottomSheetView.deleteConfirmation:
      return RemoveconfirmationSheet(id: id, userName: userName);
    case BottomSheetView.vendorLog:
      return RemoveconfirmationSheet(id: id, userName: userName);
    case BottomSheetView.revokevendorconfirm:
      return Revokeworkoder(id: id ?? 0);
    case BottomSheetView.revorkActiveOtpConfirmation:
      return _buildrevokActiveOtp(context, ref);

    case BottomSheetView.setCofew:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );

    // validateEventCode,
    // cornfirmEventCode,
    // grantEventCode,
    // denyEventcode,
    // grantMessage,
    // denyMessage,

    case BottomSheetView.termsAndCondition:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.validateEventCode:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.cornfirmEventCode:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.grantEventCode:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.denyEventcode:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.grantMessage:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.denyMessage:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );

    case BottomSheetView.afterphoto:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );

    case BottomSheetView.selectedAdminforChat:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.selectedCommitteeChat:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.selectedSecurityChat:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.initChat:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        location: location,
        bottom: bottom,
      );

    case BottomSheetView.eventRsvpDetails:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
        event: event,
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
        location: location,
      );

    case BottomSheetView.checkOutWithpermitConfirm:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.checkoutPermitdeny:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );

    case BottomSheetView.digitalIdDenymessage:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.digitalIDaprovedMessage:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.digitalIdApproved:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.digitalIdDeny:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
        digital_id_code: digital_id_code ?? "",
        access_type: access_type ?? "",
        location: location ?? "",
        additional_notes: additional_notes ?? "",
        device_id: device_id ?? "",
      );
    case BottomSheetView.digitalIdConfirm:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
        digital_id_code: digital_id_code,
        access_type: access_type,
        location: location,
        additional_notes: additional_notes,
        device_id: device_id,
      );

    case BottomSheetView.cheoutPermitDenymessage:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.checkoutpermitapprovedmessaage:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.checkOutPermitApproved:
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
    case BottomSheetView.validateVendor:
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
        location: location,
      );
    case BottomSheetView.workOderSeletion:
      return BottomsheetDetails(
        id: id,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.validateWorker:
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
        id: id,
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
      return ReportFileUpload(
        title: "Upload file",
        subtitle: "Attach image from your gallery",
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

    case BottomSheetView.fundingAmount:
      return BottomsheetDetails(
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );

    case BottomSheetView.paymentSuccess:
      return BottomsheetDetails(
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.generateOtpwithperiod:
      return BottomsheetDetails(
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.validatorcustom:
      return BottomsheetDetails(
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
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
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
        dashborddata: dashborddata,
      );

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

    /// FROM HER------->

    case BottomSheetView.vendoraccesCodConfirm:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.vendorCheckIn:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.vendorCheckOut:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.vendorcheckinMessage:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.vendorCheckoutmessage:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );

    /// to her
    case BottomSheetView.vendoraccesCodeDeny:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.vendorAccessCodeDeyMessage:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );

    /// TO HER ----.
    ///// from here
    case BottomSheetView.vendorCodeCornfirm:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.vendorCodeApproved:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.vendorCodeDeny:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.vendorCodeDenyMessage:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );
    case BottomSheetView.vendorCodeApprovedMessage:
      return BottomsheetDetails(
        eventData: vendor,
        headertitle: userName,
        headersubtitle: userRole,
        bottom: bottom,
      );

    /// to her
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
    case BottomSheetView.deleteAccount:
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
