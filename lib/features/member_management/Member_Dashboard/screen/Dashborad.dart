import 'dart:math';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/property_agreement/agreement_sign_screen.dart';
import 'package:curnectgate/features/%20operations/property_agreement/utils.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_provider/workformprovider.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/dashBordRowcard.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/empty_body.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/headCard.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/reusable_vistor_card.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/vewMoreButton.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/visitorActiveCount.dart';
import 'package:curnectgate/features/member_management/membership_ID/provider/digitalD_status.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/active_provider.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/general_notification_count_widget.dart';
import 'package:curnectgate/features/operations/notifications/event/event_widget/event_limit_data.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Dashborad extends ConsumerWidget {
  Dashborad({super.key});
  int maxItems = 2;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: _buildAppBar(context, ref),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Headcard(),
              SizedBox(height: 15),
              _buildRow(context, ref),
              SizedBox(height: 25),
              Text(
                "YOUR DUES",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                  fontWeight: FontFamilies.bold,
                ),
              ),
              SizedBox(height: 15),
              _buildDueCard("95,000"),
              SizedBox(height: 20),
              Text(
                "VISITOR ACTIVITIES",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                  fontWeight: FontFamilies.bold,
                ),
              ),
              SizedBox(height: 15),
              _buildvisitorRow(),
              _buildContent(size, context, ref),
              SizedBox(height: 24),
              Text(
                "EVENTS",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                  fontWeight: FontFamilies.bold,
                ),
              ),
              SizedBox(height: 24),
              _buildEventContent(ref, context, size),
              SizedBox(height: 25),
              Text(
                "OTHER LINK",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                  fontWeight: FontFamilies.bold,
                ),
              ),
              SizedBox(height: 25),
              _otherLinks(
                title: "ADD FAMILY",
                onTap: () async {
                  context.pushNamed(AppRoutes.getMemberInfo);
                },
              ),
              Divider(color: AppColors.instance.grey400),
              _otherLinks(title: "ACCOUNT SETTINGS", onTap: () {}),
              Divider(color: AppColors.instance.grey400),
              SizedBox(height: 5),
              _otherLinks(
                title: "RESIDENT DIRECTORY",
                onTap: () {
                  context.pushNamed(AppRoutes.residentDirectory);
                },
              ),
              SizedBox(height: 20),
              Text(
                "NEED SAFETY HELP?",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                  fontWeight: FontFamilies.bold,
                ),
              ),
              SizedBox(height: 10),
              _buildSaftyRow(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSaftyRow(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: _buildSaftyBox(
            onTap: () {},
            imagepath: AssetPaths.dashboardemergency,
            title: 'Emergency',
          ),
        ),
        Expanded(
          child: _buildSaftyBox(
            onTap: () {
              push(context, AgreementSignScreen());
            },
            imagepath: AssetPaths.dashboardCall,
            title: 'Support',
          ),
        ),
      ],
    );
  }

  Widget _buildSaftyBox({
    required String imagepath,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 10, left: 10),
        height: 80,

        decoration: BoxDecoration(
          color: AppColors.instance.grey300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          spacing: 10,

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagepath, width: 20),
            Text(
              title,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
                fontWeight: FontFamilies.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _otherLinks({required String title, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
                fontWeight: FontFamilies.bold,
                fontSize: 13,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.instance.black600,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventContent(WidgetRef ref, BuildContext context, Size size) {
    final reminderprovider = ref.read(reminderProvider.notifier);
    final notifier = ref.read(workOrderFormProvider.notifier);

    return Column(
      children: [
        SizedBox(height: 200, child: EventLimitData()),
        ViewMoreButton(
          buttontext: "All events",
          onTap: () {
            reminderprovider.resetAll();
            notifier.updateEndDate(null);
            notifier.updateStartDate(null);
            notifier.updateWorkType("", 0);
            showUserBottomSheet(
              context: context,
              headertitle: "",
              headersubtitle: "",
              ref: ref,
              bottom: BottomSheetView.seletctEvent,
            );
          },
        ),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, WidgetRef ref) {
    final reminderprovider = ref.read(reminderProvider.notifier);
    final notifier = ref.read(workOrderFormProvider.notifier);
    return AppBar(
      leadingWidth: 50,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(AssetPaths.userAvatar2),
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            reminderprovider.resetAll();
            notifier.updateEndDate(null);
            notifier.updateStartDate(null);
            notifier.updateWorkType("", 0);
            showUserBottomSheet(
              context: context,
              headertitle: "",
              headersubtitle: "",
              ref: ref,
              bottom: BottomSheetView.seletctEvent,
            );
          },
          child: Image.asset(AssetPaths.dashboardcalenderSetting, width: 20),
        ),
        SizedBox(width: 15),
        NotificationCount(
          onTap: () {
            context.pushNamed(AppRoutes.notification);
          },
        ),
      ],
    );
  }

  Widget _buildContent(Size size, BuildContext context, WidgetRef ref) {
    final generatedList = ref.watch(
      generateNotifierProvider.select((s) => s.generatedList),
    );

    return Column(
      children: [
        if (generatedList.isNotEmpty) ...[
          SizedBox(height: 200, child: _buildMemberList(ref, size)),
          ViewMoreButton(buttontext: "View all", onTap: () {}),
        ] else
          EmptyBody(
            onTap: () {},
            imagepath: AssetPaths.dashboardActivities,
            emptyMessag: "Your visitor activity will appear here",
            buttonTexe: "View all",
          ),
      ],
    );
  }

  Widget _buildMemberList(WidgetRef ref, Size size) {
    final generatedList = ref.watch(
      generateNotifierProvider.select((s) => s.generatedList),
    );
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: min(2, generatedList.length),
      itemBuilder: (BuildContext context, int index) {
        final generatedLists = generatedList[index];
        return VisitorCard(
          userName: generatedLists.vistorName,
          purposeOfVisit: generatedLists.purposeofVisit,
          selectedDate: generatedLists.selectedDate,
          selectedTime: generatedLists.selectedTime,
          onChangePressed: () {},
        );
      },
    );
  }

  Widget _buildDueCard(String amount) {
    return Container(
      padding: EdgeInsets.all(12),
      height: 65,
      decoration: BoxDecoration(
        color: AppColors.instance.teal300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Amount Due:  #$amount",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontWeight: FontFamilies.bold,
            ),
          ),
          Container(
            height: 35,
            width: 70,
            decoration: BoxDecoration(
              color: AppColors.instance.black600,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                "Pay due",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.grey200,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(workOrderFormProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Dashbordrowcard(
          title: "Digital ID",
          icon: AssetPaths.dashboardIdVerification,
          onTap: () async {
            ref.read(formProvider.notifier).updateRegenerateDigiterCode("");
            ref.read(formProvider.notifier).updateGenrateMemberIdLoading(false);

            final status = await ref.read(digitalIdStatusProvider.future);

            if (status.hasDigitalId) {
              context.pushNamed(AppRoutes.digitalIDMember);
            } else {
              context.pushNamed(AppRoutes.digitalIDStarter);
            }
          },
        ),
        SizedBox(width: 10),
        Dashbordrowcard(
          title: "Work Order",
          icon: AssetPaths.dashboardWorkOrder,
          onTap: () {
            notifier.updateEndDate(null);
            notifier.updateStartDate(null);
            notifier.updateWorkType("", 0);
            context.pushNamed(AppRoutes.workOrder);
          },
        ),
        SizedBox(width: 10),
        Dashbordrowcard(
          title: "Visitor",
          icon: AssetPaths.dashboardVisitors,
          onTap: () {
            context.pushNamed(AppRoutes.vendorLog);
          },
        ),
        SizedBox(width: 10),
        Dashbordrowcard(
          title: "Report",
          icon: AssetPaths.dashboardReports,
          onTap: () {
            context.pushNamed(AppRoutes.violation);
          },
        ),
      ],
    );
  }

  Widget _buildvisitorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visitoractivecount(title: "Total today", count: '0'),
        SizedBox(width: 10),
        Visitoractivecount(title: "Active", count: "0"),
        SizedBox(width: 10),
        Visitoractivecount(title: "Expired", count: "0"),
      ],
    );
  }
}
