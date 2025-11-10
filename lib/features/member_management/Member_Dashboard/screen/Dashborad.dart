import 'dart:math';

import 'package:curnectgate/core/%20utils/service/notification_service.dart';
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
              _otherLinks(
                title: "ACCOUNT SETTINGS",
                onTap: () {
                  context.pushNamed(AppRoutes.manageLoging);
                },
              ),
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
    return InkWell(
      onTap: () async {
        final token = await NotificationService().getToken();
        NotificationService().sendNotificationToAll(
          bearerToken:
              "ya29.c.c0ASRK0GY7bnJjYWhVtS4au26Eb2-tbUAEIZL4kLQhZEx1_r1h1jVCXLv3oFhhTbBhAGuTt1hqHHQj6DAv8VUahygJEG2_XgBTM3oOT9BLykDkAQtMO_uzxAx0uIxwvM54cnxvyeHgWWPCO_oy0i4q7q7ZOmiIb5LN80J5ii_FJDtlARdKnrkHJl48u8eKmuOk1apoM84iUYFiQ7oy3Bpe2xGJq_f3LAYTMxFvQBWj-S9zPioLMcsCAX03UmuuPRhQBsPiq34g3Jdc43-hI78jWNqVMjNZxvS9idYWjmttYHvEVTdrvo28dXrkKssY-u6_N3InOCTW2iGrahcZinOl4JaX7zmYinGQAMBbFrgwfVuCfcKvLNYLHzy6N385C84e_nrigbniU7-8f2nYt2UFt2Bhu2xvXi9mzm8sUhsy_ou5ilYiMydRvO1uRz0U3tW98FQbygwzV9la2M6QMxS2Ztup3gtlol2j9hsiufYeMqiqqkhybMOOyre4k09iVs-2c0dR0qMqfs6zalfbYp795YlM6Q-kWmaI5ozqRn5xyvvbXSeFV7zx_t7Rqk9yViv6v6SIRiWcn0zpgJFSyb_uVIFrzs_St1beRnxwZWygI-XougUgBg4rcXjz0SXep33oS3Jry8SQfJ6ulJeUWMMxgs9runriW7qBuZup-hhVm4_o5a1VhZ-Ul5wYU8u0j9jOSazz1z8U0oFidh5vRg4jbRpdJ-bYVhox5nU7FjtiRqiuJexSyVwy0rrIlyZxW20zJ1gMitnU_sVMU8BqhibBb_JtY1pjYy-R-_rlmM2tmU2ldvl8jd35SM8pZvd8aSzoJFkg-1uwok7VFsBtk8J0XrMn0ylnsBcdif0YJ5S8ZgZ9wxRun1dpJ0Z2FJuezv9M0jkcucyX7JBmQ_m3bVsVU0mX8sVdpo9axrplYu-jJg5nd8mhWjpB5r_RcYtJ0Zlm4SVWgkwpwVhF-4dfww5RdqUusddZnJczQnlwxOlgg3xVbWQS04cFno",
          message:
              "The magority of the comminuty was not coming to the meeting.",
          messageType: "chat",
          senderName: "James Muller",
          senderProfilePix: "https://avatars.githubusercontent.com/u/1?v=4",
          senderId: "12",
          tokens: [token ?? ""],
        );
      },
      child: Container(
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
