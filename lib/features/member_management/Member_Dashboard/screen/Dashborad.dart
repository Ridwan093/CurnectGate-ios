import 'dart:developer';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/local_store/User_localdata_provider.dart';
import 'package:curnectgate/core/local_store/getUserprofile_file_provider.dart';
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/eletionData/poll_data.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/votingSettingCheck.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_provider/workformprovider.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/dashBordRowcard.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/headCard.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/vewMoreButton.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/visitorActiveCount.dart';
import 'package:curnectgate/features/member_management/membership_ID/provider/digitalD_status.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/active_Otp_count/Expired_count/expired_count_response.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/active_Otp_count/active_count/active_count_response.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/active_count_provider.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/expired_used_count_provider.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/ActiveData_widget.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/count_data.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/general_notification_count_widget.dart';
import 'package:curnectgate/features/operations/notifications/event/event_widget/event_limit_data.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/dashbord_Model/payment_dashboard_data.dart';
import 'package:curnectgate/features/payment/widget/payment_data/dasbordData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Dashborad extends ConsumerWidget {
  Dashborad({super.key});
  int maxItems = 2;
  String formatPrice(String price) {
    final number = double.tryParse(price) ?? 0.0;
    final formatter = NumberFormat('#,##0.00');
    return formatter.format(number);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final role = ref.watch(userRoleProvider);

    return Scaffold(
      backgroundColor: Colors.white,
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
              SizedBox(height: 15),

              Votingsettingcheck(child: PollDatas(canRoute: true)),
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
              DashbordData(
                builder:
                    (context, data) => _buildDueCard(
                      data as PaymentDashboardData,
                      context,
                      ref,
                    ),
              ),

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
                "QUICK LINK",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                  fontWeight: FontFamilies.bold,
                ),
              ),
              SizedBox(height: 25),

              role.when(
                data: (data) {
                  if (data.isNotEmpty) {
                    if (data.toLowerCase().contains("landlord") ||
                        data.toLowerCase().contains("spouse")) {
                      return _otherLinks(
                        title: "ADD FAMILY",
                        onTap: () async {
                          context.pushNamed(AppRoutes.getMemberInfo);
                        },
                      );
                    } else {
                      return SizedBox();
                    }
                  } else {
                    return SizedBox();
                  }
                },
                error: (e, s) {
                  return SizedBox();
                },
                loading: () {
                  return SizedBox();
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
              _buildSaftyRow(context, ref),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSaftyRow(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.user;
    final fullname = authState.fullname;
    final adminEmail = user?["estate"]["contact_email"] ?? "";
    final estateName = user?['estate_name'] ?? "";

    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: _buildSaftyBox(
            onTap: () {
              showUserBottomSheet(
                context: context,
                headertitle: "",
                headersubtitle: "",
                ref: ref,
                bottom: BottomSheetView.residentEmgencyContacts,
              );
            },
            imagepath: AssetPaths.dashboardemergency,
            title: 'Emergency',
          ),
        ),
        Expanded(
          child: _buildSaftyBox(
            onTap: () {
              _launchSupportEmail(
                adminEmail: adminEmail,
                estateName: estateName,
                userName: fullname ?? "",
              );
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
        child: SingleChildScrollView(
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
              bottom: BottomSheetView.events,
            );
          },
        ),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, WidgetRef ref) {
    final reminderprovider = ref.read(reminderProvider.notifier);
    final notifier = ref.read(workOrderFormProvider.notifier);
    final profileFile = ref.watch(profilePicProvider);
    return AppBar(
      backgroundColor: Colors.white,
      leadingWidth: 50,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 20,
          backgroundImage:
              profileFile != null
                  ? FileImage(profileFile)
                  : AssetImage(AssetPaths.navProfileActive) as ImageProvider,
        ),
      ),
      actions: [
        // Tooltip(
        //   message: "Polls",
        //   preferBelow: false,
        //   child: InkWell(
        //     onTap: () {
        //       context.pushNamed(AppRoutes.newPoll);
        //     },
        //     child: const Padding(
        //       padding: EdgeInsets.all(12.0),
        //       child: Icon(Icons.poll_outlined, size: 26),
        //     ),
        //   ),
        // ),
        Tooltip(
          message: "Events", // Clear label
          preferBelow: false,
          child: InkWell(
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
    return SizedBox(height: 200, child: ActivedataWidget());
    // return Column(
    //   children: [
    //     if (generatedList.isNotEmpty) ...[
    //       SizedBox(height: 200, child: ActivedataWidget()),
    //       ViewMoreButton(buttontext: "View all", onTap: () {}),
    //     ] else
    //       EmptyBody(
    //         onTap: () {},
    //         imagepath: AssetPaths.dashboardActivities,
    //         emptyMessag: "Your visitor activity will appear here",
    //         buttonTexe: "View all",
    //       ),
    //   ],
    // );
  }

  Widget _buildDueCard(
    PaymentDashboardData? data,
    BuildContext context,
    WidgetRef ref,
  ) {
    final isDue = data?.totalOutstanding == 0;
    final amount = data?.totalOutstanding.toString();
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
          isDue
              ? Text(
                "No upcoming dues",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black400,
                  fontWeight: FontFamilies.medium,
                  fontSize: 13,
                ),
              )
              : Flexible(
                child: Text(
                  "Amount Due:  ₦${formatPrice(amount ?? "")}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                    fontWeight: FontFamilies.bold,
                  ),
                ),
              ),
          isDue
              ? Text("")
              : InkWell(
                onTap: () {
                  showUserBottomSheet(
                    context: context,
                    headertitle: "Pay Outstanding Due",
                    headersubtitle: "",
                    ref: ref,
                    dashbordData: data,
                    bottom: BottomSheetView.payOustanding,
                  );
                },
                child: Container(
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
              ),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context, WidgetRef ref) {
    final role = ref.watch(userRoleProvider);
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

            log(status.hasDigitalId.toString());
            if (status.canGenerate) {
              context.pushNamed(AppRoutes.digitalIDMember);
            } else {
              context.pushNamed(AppRoutes.digitalIDStarter);
            }
          },
        ),
        SizedBox(width: 10),

        role.when(
          data: (data) {
            if (data.isNotEmpty) {
              if (data.toLowerCase().contains("staff") ||
                  data.toLowerCase().contains("family_member")) {
                return SizedBox();
              } else {
                return Dashbordrowcard(
                  title: "Work Order",
                  icon: AssetPaths.dashboardWorkOrder,
                  onTap: () {
                    notifier.updateEndDate(null);
                    notifier.updateStartDate(null);
                    notifier.updateWorkType("", 0);
                    context.pushNamed(AppRoutes.workOrder);
                  },
                );
              }
            } else {
              return SizedBox();
            }
          },
          error: (e, s) {
            return SizedBox();
          },
          loading: () {
            return SizedBox();
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
        CountDataForAll<ExpiredCountResponse>(
          provider: expiredCountProvider("used"),
          emptyBody: Visitoractivecount(title: "Total today", count: "0"),
          builder:
              (data) => Visitoractivecount(
                title: "Total today",
                count: '${data.data?.count ?? 0}',
              ),
        ),

        SizedBox(width: 10),
        CountDataForAll<ActiveCountResponse>(
          provider: getActiveCountProvider,
          emptyBody: Visitoractivecount(title: "Active", count: '0'),
          builder:
              (data) => Visitoractivecount(
                title: "Active",
                count: '${data.data?.count ?? 0}',
              ),
        ),

        SizedBox(width: 10),
        CountDataForAll<ExpiredCountResponse>(
          provider: expiredCountProvider("expired"),
          emptyBody: Visitoractivecount(title: "Expired", count: "0"),
          builder:
              (data) => Visitoractivecount(
                title: "Expired",
                count: '${data.data?.count ?? 0}',
              ),
        ),
      ],
    );
  }

  Future<void> _launchSupportEmail({
    required String adminEmail,
    required String estateName,
    required String userName,
  }) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: adminEmail,
      query: Uri.encodeQueryComponent(
        'subject=Support Request - $estateName'
        '&body=Hello Admin,\n\n'
        'I need assistance.\n\n'
        'User: $userName\n'
        'Estate: $estateName\n\n'
        'Thank you.',
      ),
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch email app';
    }
  }
}
