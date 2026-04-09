// ignore_for_file: unused_result

import 'dart:developer';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/local_store/User_localdata_provider.dart';
import 'package:curnectgate/core/local_store/getUserprofile_file_provider.dart';
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/provider/Voting_setting_provider.dart';
import 'package:curnectgate/features/estate_management/elections/provider/poll_provider.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_provider/getWorkOdder_provider.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_provider/workformprovider.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/buildSar_Widget.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/dashBordRowcard.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/headCard.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/quikLink_card.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/vewMoreButton.dart';
import 'package:curnectgate/features/member_management/membership_ID/provider/digitalD_status.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/expired_used_count_provider.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/ActiveData_widget.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/general_notification_count_widget.dart';
import 'package:curnectgate/features/operations/notifications/event/event_widget/event_limit_data.dart';
import 'package:curnectgate/features/operations/notifications/provider/getevent_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:curnectgate/features/operations/violation/report_provider/getReport_provider.dart';
import 'package:curnectgate/features/payment/provider/dashbord_provider.dart';
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

    return Scaffold(
      backgroundColor: Colors.white,

      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            _buildAppBar(context, ref),
            Expanded(
              child: RefreshIndicator(
                color: AppColors.instance.yellow500,
                onRefresh: () async {
                  await Future.wait([
                    ref.refresh(expiredCountProvider("used").future),
                    ref.refresh(expiredCountProvider("expired").future),
                    ref.read(pollProvider.notifier).refreshPoll(context, ref),
                    ref
                        .read(votingSettingsProvider.notifier)
                        .refreshVotingSetting(context, ref),
                    ref
                        .read(workOrderProvider.notifier)
                        .refreshWorkOrders(context, ref),
                    ref
                        .read(userReportProvider.notifier)
                        .refreshReports(context, ref),
                    ref
                        .read(getEventProvider.notifier)
                        .refreshEvent(context, ref, ""),
                    //Newlife3310
                    ref
                        .read(paymentDashbordProvider.notifier)
                        .refreshPaymentDashbord(context, ref),
                  ]);
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Headcard(),
                      const SizedBox(height: 15),
                      _buildRow(context, ref),
                      const SizedBox(height: 15),

                      DashbordData(
                        builder:
                            (context, data) => _buildDueCard(
                              data as PaymentDashboardData,
                              context,
                              ref,
                            ),
                      ),

                      const SizedBox(height: 20),
                      _buildTopTitile("STATISTICS"),
                      const SizedBox(height: 10),
                      Statistics(),

                      const SizedBox(height: 20),
                      _buildTopTitile("QUICK LINK"),

                      const SizedBox(height: 10),

                      _buildQuikLink(ref, context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopTitile(String title) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black500,
            fontWeight: FontFamilies.bold,
          ),
        ),
        SizedBox(width: 10),
        Expanded(child: Divider(color: AppColors.instance.grey300)),
        // Expanded(
        //   child: Container(height: 1.0, color: AppColors.instance.black600),
        // ),
      ],
    );
  }

  // Widget _otherLinks({required String title, required VoidCallback onTap}) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 10),
  //     child: InkWell(
  //       onTap: onTap,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             title,
  //             style: TextStyle(
  //               fontFamily: FontFamilies.interDisplay,
  //               color: AppColors.instance.black600,
  //               fontWeight: FontFamilies.bold,
  //               fontSize: 13,
  //             ),
  //           ),
  //           Icon(
  //             Icons.arrow_forward_ios,
  //             color: AppColors.instance.black600,
  //             size: 14,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  Widget _buildQuikLink(WidgetRef ref, BuildContext context) {
    final authState = ref.watch(authProvider);
    final user = authState.user;
    final fullname = authState.fullname;
    final adminEmail = user?["estate"]?["contact_email"] ?? "";
    final estateName = user?['estate_name'] ?? "";
    final role = ref.watch(userRoleProvider);

    return Wrap(
      spacing: 5, // horizontal gap between cards
      runSpacing: 10, // vertical gap between rows

      children: [
        role.when(
          data: (data) {
            if (data.isNotEmpty) {
              if (data.toLowerCase().contains("landlord") ||
                  data.toLowerCase().contains("spouse")) {
                return QuikLinkCard(
                  isfund: false,
                  onTap: () {
                    context.pushNamed(AppRoutes.getMemberInfo);
                  },
                  title: "Add Family",
                  icon: Icons.person_add_alt_1,
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
        QuikLinkCard(
          isfund: false,
          onTap: () {
            showUserBottomSheet(
              context: context,
              headertitle: "",
              headersubtitle: "",
              ref: ref,
              bottom: BottomSheetView.events,
            );
          },
          title: "Event",
          icon: Icons.event,
        ),
        QuikLinkCard(
          isfund: true,
          onTap: () {
            context.pushNamed(AppRoutes.paymentMethod);
          },
          title: "Add Fund",
          icon: Icons.payments,
        ),
        QuikLinkCard(
          isfund: false,
          onTap: () {
            context.pushNamed(AppRoutes.residentDirectory);
          },
          title: "Resident",
          icon: Icons.home_outlined,
        ),

        QuikLinkCard(
          isfund: false,
          onTap: () {
            showUserBottomSheet(
              context: context,
              headertitle: "",
              headersubtitle: "",
              ref: ref,
              bottom: BottomSheetView.residentEmgencyContacts,
            );
          },
          title: "Emergency",
          icon: Icons.emergency,
        ),
        QuikLinkCard(
          isfund: false,
          onTap: () {
            _launchSupportEmail(
              adminEmail: adminEmail,
              estateName: estateName,
              userName: fullname ?? "",
            );
          },
          title: "Support",
          icon: Icons.email,
        ),
      ],
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

  Widget _buildAppBar(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final reminderprovider = ref.read(reminderProvider.notifier);
    final notifier = ref.read(workOrderFormProvider.notifier);

    final profileFile = ref.watch(profilePicProvider);
    return SafeArea(
      child: Container(
        height: 70,
        width: size.width,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.only(left: 12),
              decoration: BoxDecoration(
                color: AppColors.instance.teal100,
                shape: BoxShape.circle,
                border: Border.all(
                  style: BorderStyle.solid,
                  color: AppColors.instance.teal400,
                ),
                image:
                    profileFile != null
                        ? DecorationImage(
                          image: FileImage(profileFile),
                          fit: BoxFit.cover,
                        )
                        : null,
              ),
              child: Center(
                child:
                    profileFile != null
                        ? null
                        : Image.asset(
                          AssetPaths.navProfileActive,
                          width: 25,

                          color: AppColors.instance.black600,
                        ),
              ),
            ),
            Spacer(),
            Row(
              children: [
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
                    child: Icon(
                      Icons.event,
                      color: AppColors.instance.black600,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                NotificationCount(
                  onTap: () {
                    context.pushNamed(AppRoutes.notification);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
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
    final isDue = (data?.totalOutstanding ?? 0) > 0;
    final rawAmount = data?.totalOutstanding ?? 0.00;
    final displayAmount = "₦${formatPrice(rawAmount.toString())}";

    // Use MediaQuery for safe, proportional sizing
    final screenWidth = MediaQuery.sizeOf(context).width;
    final maxAmountWidth =
        screenWidth * 0.65; // 65% of screen → safe on small devices

    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.instance.teal400,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Amount Due",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.grey200.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              // const SizedBox(height: 6),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxAmountWidth),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    displayAmount,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.grey200,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      height: 1.1,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Align(
            alignment:
                Alignment.centerRight, // or Alignment.bottomRight if you prefer
            child: InkWell(
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
                width: 100,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color:
                      !isDue
                          ? AppColors.instance.grey400
                          : AppColors.instance.black600.withOpacity(.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Pay Now",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color:
                          !isDue
                              ? AppColors.instance.black300
                              : AppColors.instance.grey200,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
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
          title: "Violation",
          icon: AssetPaths.dashboardReports,
          onTap: () {
            context.pushNamed(AppRoutes.violation);
          },
        ),
      ],
    );
  }

  // Widget _buildvisitorRow() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       CountDataForAll<ExpiredCountResponse>(
  //         provider: expiredCountProvider("used"),
  //         emptyBody: Visitoractivecount(title: "Total today", count: "0"),
  //         builder:
  //             (data) => Visitoractivecount(
  //               title: "Total today",
  //               count: '${data.data?.count ?? 0}',
  //             ),
  //       ),

  //       SizedBox(width: 10),
  //       CountDataForAll<ActiveCountResponse>(
  //         provider: getActiveCountProvider,
  //         emptyBody: Visitoractivecount(title: "Active", count: '0'),
  //         builder:
  //             (data) => Visitoractivecount(
  //               title: "Active",
  //               count: '${data.data?.count ?? 0}',
  //             ),
  //       ),

  //       SizedBox(width: 10),
  //       CountDataForAll<ExpiredCountResponse>(
  //         provider: expiredCountProvider("expired"),
  //         emptyBody: Visitoractivecount(title: "Expired", count: "0"),
  //         builder:
  //             (data) => Visitoractivecount(
  //               title: "Expired",
  //               count: '${data.data?.count ?? 0}',
  //             ),
  //       ),
  //     ],
  //   );
  // }

  Future<void> _launchSupportEmail({
    required String adminEmail,
    required String estateName,
    required String userName,
  }) async {
    final String subject = 'Support Request - $estateName';
    final String body =
        'Hello Admin,\n\nI need assistance.\n\nUser: $userName\nEstate: $estateName\n\nThank you.';

    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map(
            (MapEntry<String, String> e) =>
                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
          )
          .join('&');
    }

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: adminEmail,
      query: encodeQueryParameters(<String, String>{
        'subject': subject,
        'body': body,
      }),
    );

    final Uri gmailUri = Uri(
      scheme: 'googlegmail',
      path: '/co',
      query: encodeQueryParameters(<String, String>{
        'to': adminEmail,
        'subject': subject,
        'body': body,
      }),
    );

    try {
      if (await canLaunchUrl(gmailUri)) {
        await launchUrl(gmailUri, mode: LaunchMode.externalApplication);
      } else if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(emailUri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('Could not launch email app: $e');
    }
  }
}
