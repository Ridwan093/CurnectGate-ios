import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/eletionData/poll_data.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/votingSettingCheck.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/member_management/tabState/tab_state.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/count_data.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/general_notification_count_widget.dart';
import 'package:curnectgate/features/security/model/count_model/violation_count_response.dart';
import 'package:curnectgate/features/security/provider/formState.dart';
import 'package:curnectgate/features/security/provider/getViolaationCount.dart';
import 'package:curnectgate/features/security/provider/permmission_handler.dart';
import 'package:curnectgate/features/security/provider/scanProvider.dart';
import 'package:curnectgate/features/security/widget/Scan_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

// class SecurityDashboard extends ConsumerStatefulWidget {
//   @override
//   _SecurityDashboardState createState() => _SecurityDashboardState();
// }

// class _SecurityDashboardState extends ConsumerState<SecurityDashboard>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;

//   @override
//   void initState() {
//     super.initState();

//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1000),
//     );

//     _animationController.forward();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   String getFormattedDate() {
//     final now = DateTime.now();
//     final formatter = DateFormat('E, MMM, d');
//     return formatter.format(now);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final state = ref.read(oTpformProvider.notifier);
//     final isScanning = ref.watch(qrScanProvider);

//     final size = MediaQuery.sizeOf(context);
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton:
//           isScanning
//               ? null
//               : InkWell(
//                 onTap: () async {
//                   final hasPermission = await checkCameraPermission(context);

//                   if (!hasPermission) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text("Camera permission required"),
//                       ),
//                     );
//                     return;
//                   }
//                   state.resetForm();
//                   ref.read(qrScanProvider.notifier).state = true;
//                 },

//                 child: Container(
//                   height: 35,
//                   width: 120,
//                   padding: EdgeInsets.only(
//                     left: 10,
//                     right: 10,
//                     top: 5,
//                     bottom: 5,
//                   ),
//                   decoration: BoxDecoration(
//                     color: AppColors.instance.black600,
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Center(
//                     child: Row(
//                       children: [
//                         const Text(
//                           "Validate entry",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontFamily: FontFamilies.interDisplay,
//                             fontSize: 12,
//                           ),
//                         ),
//                         SizedBox(width: 5),
//                         Flexible(
//                           child: const Icon(
//                             Icons.qr_code_scanner,
//                             size: 13,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//       body: Stack(
//         children: [
//           if (!isScanning) _buildBody(ref),
//           if (isScanning) ScanWidget(),
//         ],
//       ),
//     );
//   }

//   Widget _buildBody(WidgetRef ref) {
//     return Center(
//       // ← NEW: Centers everything
//       child: ConstrainedBox(
//         constraints: const BoxConstraints(
//           maxWidth: 600,
//         ), // ← NEW: Phone-like width on tablet
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             final size = Size(
//               constraints.maxWidth,
//               constraints.maxHeight,
//             ); // Use constrained width
//   final topContainerHeight = size.height * 0.0;
//                 final desiredOverlap = 60.0;
//                 final safeTopPadding = (topContainerHeight - desiredOverlap)
//                     .clamp(16.0, double.infinity);
//             return SizedBox(
//               height: MediaQuery.of(context).size.height,
//               child: Stack(
//                 children: [
//                   // Background containers
//                   Column(
//                     children: [
//                       Container(
//                         width: size.width,
//                         height: size.height * .2,
//                         color: AppColors.instance.teal400,
//                       ),
//                       Expanded(child: Container(color: Colors.grey[100])),
//                     ],
//                   ),

//                   // Scrollable content
//                   Positioned(
//                     top: 0,
//                     left: 0,
//                     right: 0,
//                     bottom: 0,
//                     child: SingleChildScrollView(
//                       padding: EdgeInsets.only(
//                     top: safeTopPadding,

//                     left: 16,
//                     right: 16,
//                   ),

//                       child: Column(
//                         children: [
//                           _buildHeader(ref),
//                           SizedBox(height: 20),
//                           _buildWelcomeCard(size),
//                           SizedBox(height: 20),
//                           _buildViolationsCard(),
//                           SizedBox(height: 15),
//                           Votingsettingcheck(child: PollDatas(canRoute: true)),
//                           SizedBox(height: 15),
//                           _buildQuickActions(ref),
//                           SizedBox(height: 80),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//   // Widget _buildBody(Size size, WidgetRef ref) {
//   //   return SizedBox(
//   //     height: size.height,
//   //     child: Stack(
//   //       children: [
//   //         // Background containers
//   //         Column(
//   //           children: [
//   //             // Top teal container
//   //             Container(
//   //               width: size.width,
//   //               height: size.height * .2,
//   //               color: AppColors.instance.teal400,
//   //               child: SizedBox(),
//   //             ),
//   //             // Bottom grey container
//   //             Expanded(child: Container(color: Colors.grey[100])),
//   //           ],
//   //         ),

//   //         // Header positioned at top of teal container
//   //         Positioned(
//   //           top: MediaQuery.of(context).padding.top + 16,
//   //           left: 16,
//   //           right: 16,
//   //           child: Text(""),
//   //         ),

//   //         // Scrollable content - FIXED: Ensure non-negative padding
//   //         Positioned(
//   //           top: 0,
//   //           left: 0,
//   //           right: 0,
//   //           bottom: 0,
//   //           child: LayoutBuilder(
//   //             builder: (context, constraints) {
//   //               // Calculate safe top padding that won't be negative
//   //               final topContainerHeight = size.height * 0.0;
//   //               final desiredOverlap = 60.0;
//   //               final safeTopPadding = (topContainerHeight - desiredOverlap)
//   //                   .clamp(16.0, double.infinity);

//   //               return SingleChildScrollView(
//   //                 padding: EdgeInsets.only(
//   //                   top: safeTopPadding,

//   //                   left: 16,
//   //                   right: 16,
//   //                 ),
//   //                 child: Column(
//   //                   children: [
//   //                     _buildHeader(ref),

//   //                     SizedBox(height: 20),
//   //                     _buildWelcomeCard(size),
//   //                     SizedBox(height: 20),
//   //                     _buildViolationsCard(),
//   //                     SizedBox(height: 15),
//   //                     Votingsettingcheck(child: PollDatas(canRoute: true)),
//   //                     SizedBox(height: 15),
//   //                     _buildQuickActions(ref),
//   //                     SizedBox(height: 80), // Extra space for FAB
//   //                   ],
//   //                 ),
//   //               );
//   //             },
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }

//   Widget _buildHeader(WidgetRef ref) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           'Security',
//           style: TextStyle(
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//             color: AppColors.instance.grey200,
//             fontFamily: FontFamilies.interDisplay,
//           ),
//         ),
//         NotificationCount(
//           color: AppColors.instance.grey200,
//           onTap: () {
//             context.pushNamed(AppRoutes.securitynotification);
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildWelcomeCard(Size size) {
//     final getusername = ref.watch(firstnameProvider);
//     final getmemberid = ref.watch(securityEmployeeID);

//     return Card(
//       color: Colors.white,
//       elevation: 5,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: getusername.when(
//                     data: (data) {
//                       final name = data;
//                       if (name.isNotEmpty) {
//                         return Text(
//                           'Welcome, $name',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontFamily: FontFamilies.interDisplay,
//                             fontWeight: FontFamilies.bold,
//                             color: AppColors.instance.black600,
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         );
//                       } else {
//                         return SizedBox();
//                       }
//                     },
//                     error: (e, StackTrace s) => SizedBox(),
//                     loading: () => SizedBox(),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 getmemberid.when(
//                   data: (data) {
//                     final name = data;
//                     if (name.isNotEmpty) {
//                       return _securityID(name);
//                     } else {
//                       return SizedBox();
//                     }
//                   },
//                   error: (e, StackTrace s) => SizedBox(),
//                   loading: () => SizedBox(),
//                 ),
//               ],
//             ),
//             SizedBox(height: 8),
//             Text(
//               getFormattedDate(),
//               style: TextStyle(
//                 fontSize: 12,
//                 fontFamily: FontFamilies.interDisplay,
//                 color: AppColors.instance.black500,
//                 fontWeight: FontFamilies.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             Divider(color: AppColors.instance.grey400),
//             SizedBox(height: 8),
//             CountDataForAll<ViolationCountResponse>(
//               provider: violationCountProvider("used"),
//               emptyBody: _violationTrack("0"),
//               builder: (data) {
//                 // Safely get the pending count
//                 final pendingCount = data.data?.byStatus?['pending'] ?? 0;

//                 return _violationTrack(pendingCount.toString());
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _violationTrack(String count) {
//     return InkWell(
//       onTap: () {
//         showUserBottomSheet(
//           context: context,
//           headertitle: "Violations",
//           headersubtitle: "Track violation residents",
//           ref: ref,
//           bottom: BottomSheetView.securityViolationTrack,
//         );
//       },
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Text(
//                 "Track Violations",
//                 style: TextStyle(
//                   fontFamily: FontFamilies.interDisplay,
//                   color: AppColors.instance.teal400,
//                   fontWeight: FontFamilies.bold,
//                 ),
//               ),
//               SizedBox(width: 10),
//               _countContainer(count),
//             ],
//           ),
//           Icon(
//             Icons.arrow_forward_ios,
//             size: 13,
//             color: AppColors.instance.black300,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _countContainer(String count) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//       decoration: BoxDecoration(
//         color: AppColors.instance.teal300,
//         borderRadius: BorderRadius.circular(3),
//       ),
//       child: Text(
//         count,
//         style: TextStyle(
//           fontFamily: FontFamilies.interDisplay,
//           color: AppColors.instance.teal400,
//           fontWeight: FontFamilies.bold,
//           fontSize: 10,
//         ),
//       ),
//     );
//   }

//   Widget _securityID(String memberId) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       decoration: BoxDecoration(
//         border: Border.all(color: AppColors.instance.black600, width: 1),
//         borderRadius: BorderRadius.circular(14),
//       ),
//       child: Text(
//         memberId,
//         style: TextStyle(
//           fontFamily: FontFamilies.interDisplay,
//           fontSize: 11,
//           color: AppColors.instance.black600,
//           fontWeight: FontFamilies.bold,
//         ),
//       ),
//     );
//   }

//   Widget _buildViolationsCard() {
//     return Card(
//       elevation: 4,
//       color: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Updates',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: AppColors.instance.black300,
//                 fontWeight: FontFamilies.bold,
//                 fontFamily: FontFamilies.interDisplay,
//               ),
//             ),
//             SizedBox(height: 16),
//             CountDataForAll<ViolationCountResponse>(
//               provider: violationCountProvider("used"),
//               emptyBody: _buildViolationItem(
//                 () {
//                   showUserBottomSheet(
//                     context: context,
//                     headertitle: "Violations",
//                     headersubtitle: "Track violation residents",
//                     ref: ref,
//                     bottom: BottomSheetView.securityViolationTrack,
//                   );
//                 },
//                 'You have new updates',
//                 '0 Violations to attend to',
//                 AssetPaths.vaolationIcon,
//                 "0", // fallback count
//               ),
//               builder: (data) {
//                 // Safely get the pending count
//                 final pendingCount = data.data?.byStatus?['pending'] ?? 0;

//                 return _buildViolationItem(
//                   () {
//                     showUserBottomSheet(
//                       context: context,
//                       headertitle: "Violations",
//                       headersubtitle: "Track violation residents",
//                       ref: ref,
//                       bottom: BottomSheetView.securityViolationTrack,
//                     );
//                   },
//                   'You have new updates',
//                   '$pendingCount Violations to attend to',
//                   AssetPaths.vaolationIcon,
//                   '$pendingCount', // only pending
//                 );
//               },
//             ),

//             SizedBox(height: 12),
//             Divider(color: AppColors.instance.grey400),
//             SizedBox(height: 12),
//             _buildViolationItem(
//               () {
//                 ref.read(tabStateProvider.notifier).resetTochat();
//               },
//               'You have new updates',
//               'New message from your estate',
//               AssetPaths.discussion,
//               "2",
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildViolationItem(
//     VoidCallback ontap,
//     String title,
//     String description,
//     String icon,
//     String count,
//   ) {
//     return InkWell(
//       onTap: ontap,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Row(
//               children: [
//                 Image.asset(icon, width: 25, height: 25),
//                 SizedBox(width: 10),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             title,
//                             style: TextStyle(
//                               fontFamily: FontFamilies.interDisplay,
//                               color: AppColors.instance.black400,
//                               fontWeight: FontFamilies.bold,
//                               fontSize: 12,
//                             ),
//                           ),
//                           SizedBox(width: 8),
//                           _countContainer(count),
//                         ],
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         description,
//                         style: TextStyle(
//                           fontFamily: FontFamilies.interDisplay,
//                           color: AppColors.instance.black600,
//                           fontWeight: FontFamilies.bold,
//                           fontSize: 11,
//                         ),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Icon(
//             Icons.arrow_forward_ios,
//             size: 12,
//             color: AppColors.instance.black600,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildQuickActions(WidgetRef ref) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Quick actions',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontFamilies.bold,
//             color: AppColors.instance.black300,
//             fontFamily: FontFamilies.interDisplay,
//           ),
//         ),
//         SizedBox(height: 12),
//         _buildOTPAccessCard(context, ref),
//       ],
//     );
//   }

//   Widget _buildOTPAccessCard(BuildContext context, WidgetRef ref) {
//     final state = ref.read(oTpformProvider.notifier);

//     return Column(
//       children: [
//         SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: _buildFeatureButton(
//                 AssetPaths.maintenanceLog,
//                 "Validate Entry",
//                 () {
//                   state.resetForm();
//                   showUserBottomSheet(
//                     context: context,
//                     headertitle: "",
//                     headersubtitle: "",
//                     ref: ref,
//                     bottom: BottomSheetView.optionForIdAndCode,
//                   );
//                 },
//               ),
//             ),
//             SizedBox(width: 10),
//             Expanded(
//               child: _buildFeatureButton(
//                 AssetPaths.vaolationIcon,
//                 "Violations",
//                 () {
//                   showUserBottomSheet(
//                     context: context,
//                     headertitle: "Violations",
//                     headersubtitle: "Track violation residents",
//                     ref: ref,
//                     bottom: BottomSheetView.securityViolationTrack,
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: _buildFeatureButton(
//                 AssetPaths.visitorLo,
//                 "Maintain Logs",
//                 () {
//                   showUserBottomSheet(
//                     context: context,
//                     headertitle: "Access Logs",
//                     headersubtitle: "Track access logs residents",
//                     ref: ref,
//                     bottom: BottomSheetView.mentainLog,
//                   );
//                 },
//               ),
//             ),
//             SizedBox(width: 10),
//             Expanded(
//               child: _buildFeatureButton(
//                 AssetPaths.emgencySecurity,
//                 "Emergencies",
//                 () {
//                   showUserBottomSheet(
//                     context: context,
//                     headertitle: "",
//                     headersubtitle: "",
//                     ref: ref,
//                     bottom: BottomSheetView.residentEmgencyContacts,
//                   );
//                   // showUserBottomSheet(
//                   //   context: context,
//                   //   headertitle: "",
//                   //   headersubtitle: "",
//                   //   ref: ref,
//                   //   bottom: BottomSheetView.workEmgencyContacts,
//                   // );
//                 },
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 28),
//       ],
//     );
//   }

//   Widget _buildFeatureButton(String icon, String label, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         height: 100,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 4,
//               offset: Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(icon, width: 30, height: 30),
//             SizedBox(height: 8),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8),
//               child: Text(
//                 label,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontFamilies.bold,
//                   fontFamily: FontFamilies.interDisplay,
//                   color: AppColors.instance.black600,
//                 ),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class SecurityDashboard extends ConsumerStatefulWidget {
  @override
  _SecurityDashboardState createState() => _SecurityDashboardState();
}

class _SecurityDashboardState extends ConsumerState<SecurityDashboard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  String getFormattedDate() {
    final now = DateTime.now();
    final formatter = DateFormat('E, MMM, d');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.read(oTpformProvider.notifier);
    final isScanning = ref.watch(qrScanProvider);

    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          isScanning
              ? null
              : InkWell(
                onTap: () async {
                  final hasPermission = await checkCameraPermission(context);
                  if (!hasPermission) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Camera permission required"),
                      ),
                    );
                    return;
                  }
                  state.resetForm();
                  ref.read(qrScanProvider.notifier).state = true;
                },
                child: IntrinsicWidth(
                  // ← Magic: only as wide as content needs
                  child: Container(
                    height: 36,
                    constraints: const BoxConstraints(
                      minWidth: 110,
                      maxWidth: 160, // Safe upper limit
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.instance.black600,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Flexible(
                          // ← Allows text to shrink if super tight
                          child: Text(
                            "Validate entry",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: FontFamilies.interDisplay,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow:
                                TextOverflow.ellipsis, // ← Final safety net
                            maxLines: 1,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.qr_code_scanner,
                          size: 15,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      body: Stack(
        children: [
          if (!isScanning) _buildBody(size, ref),
          if (isScanning) ScanWidget(),
        ],
      ),
    );
  }

  Widget _buildBody(Size size, WidgetRef ref) {
    return SizedBox(
      height: size.height,
      child: Stack(
        children: [
          // Background containers
          Column(
            children: [
              // Top teal container
              Container(
                width: size.width,
                height: size.height * .2,
                color: AppColors.instance.teal400,
                child: SizedBox(),
              ),
              // Bottom grey container
              Expanded(child: Container(color: Colors.grey[100])),
            ],
          ),

          // Header positioned at top of teal container
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            right: 16,
            child: Text(""),
          ),

          // Scrollable content - FIXED: Ensure non-negative padding
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Calculate safe top padding that won't be negative
                final topContainerHeight = size.height * 0.0;
                final desiredOverlap = 60.0;
                final safeTopPadding = (topContainerHeight - desiredOverlap)
                    .clamp(16.0, double.infinity);

                return SingleChildScrollView(
                  padding: EdgeInsets.only(
                    top: safeTopPadding,

                    left: 16,
                    right: 16,
                  ),
                  child: Column(
                    children: [
                      _buildHeader(ref),

                      SizedBox(height: 20),
                      _buildWelcomeCard(size),
                      SizedBox(height: 20),
                      _buildViolationsCard(),
                      SizedBox(height: 15),
                      Votingsettingcheck(child: PollDatas(canRoute: true)),
                      SizedBox(height: 15),
                      _buildQuickActions(ref),
                      SizedBox(height: 80), // Extra space for FAB
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Security',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.instance.grey200,
            fontFamily: FontFamilies.interDisplay,
          ),
        ),
        NotificationCount(
          color: AppColors.instance.grey200,
          onTap: () {
            context.pushNamed(AppRoutes.securitynotification);
          },
        ),
      ],
    );
  }

  Widget _buildWelcomeCard(Size size) {
    final getusername = ref.watch(firstnameProvider);
    final getmemberid = ref.watch(securityEmployeeID);

    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: getusername.when(
                    data: (data) {
                      final name = data;
                      if (name.isNotEmpty) {
                        return Text(
                          'Welcome, $name',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: FontFamilies.interDisplay,
                            fontWeight: FontFamilies.bold,
                            color: AppColors.instance.black600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                    error: (e, StackTrace s) => SizedBox(),
                    loading: () => SizedBox(),
                  ),
                ),
                SizedBox(width: 10),
                getmemberid.when(
                  data: (data) {
                    final name = data;
                    if (name.isNotEmpty) {
                      return _securityID(name);
                    } else {
                      return SizedBox();
                    }
                  },
                  error: (e, StackTrace s) => SizedBox(),
                  loading: () => SizedBox(),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              getFormattedDate(),
              style: TextStyle(
                fontSize: 12,
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black500,
                fontWeight: FontFamilies.bold,
              ),
            ),
            SizedBox(height: 8),
            Divider(color: AppColors.instance.grey400),
            SizedBox(height: 8),
            CountDataForAll<ViolationCountResponse>(
              provider: violationCountProvider("investigating"),
              emptyBody: _violationTrack("0"),
              builder: (data) {
                // Safely get the pending count
                final pendingCount = data.data?.byStatus?['investigating'] ?? 0;

                return _violationTrack(pendingCount.toString());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _violationTrack(String count) {
    return InkWell(
      onTap: () {
        showUserBottomSheet(
          context: context,
          headertitle: "Violations",
          headersubtitle: "Track violation residents",
          ref: ref,
          bottom: BottomSheetView.securityViolationTrack,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "Track Violations",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.teal400,
                  fontWeight: FontFamilies.bold,
                ),
              ),
              SizedBox(width: 10),
              _countContainer(count),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 13,
            color: AppColors.instance.black300,
          ),
        ],
      ),
    );
  }

  Widget _countContainer(String count) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.instance.teal300,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        count,
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: AppColors.instance.teal400,
          fontWeight: FontFamilies.bold,
          fontSize: 10,
        ),
      ),
    );
  }

  Widget _securityID(String memberId) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.instance.black600, width: 1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        memberId,
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          fontSize: 11,
          color: AppColors.instance.black600,
          fontWeight: FontFamilies.bold,
        ),
      ),
    );
  }

  Widget _buildViolationsCard() {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Updates',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.instance.black300,
                fontWeight: FontFamilies.bold,
                fontFamily: FontFamilies.interDisplay,
              ),
            ),
            SizedBox(height: 16),
            CountDataForAll<ViolationCountResponse>(
              provider: violationCountProvider("investigating"),
              emptyBody: _buildViolationItem(
                () {
                  showUserBottomSheet(
                    context: context,
                    headertitle: "Violations",
                    headersubtitle: "Track violation residents",
                    ref: ref,
                    bottom: BottomSheetView.securityViolationTrack,
                  );
                },
                'You have new updates',
                '0 Violations to attend to',
                AssetPaths.vaolationIcon,
                "0", // fallback count
              ),
              builder: (data) {
                // Safely get the pending count
                final pendingCount = data.data?.byStatus?['investigating'] ?? 0;

                return _buildViolationItem(
                  () {
                    showUserBottomSheet(
                      context: context,
                      headertitle: "Violations",
                      headersubtitle: "Track violation residents",
                      ref: ref,
                      bottom: BottomSheetView.securityViolationTrack,
                    );
                  },
                  'You have new updates',
                  '$pendingCount Violations to attend to',
                  AssetPaths.vaolationIcon,
                  '$pendingCount', // only pending
                );
              },
            ),

            SizedBox(height: 12),
            Divider(color: AppColors.instance.grey400),
            SizedBox(height: 12),
            _buildViolationItem(
              () {
                ref.read(tabStateProvider.notifier).resetTochat();
              },
              'You have new updates',
              'New message from your estate',
              AssetPaths.discussion,
              "2",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViolationItem(
    VoidCallback ontap,
    String title,
    String description,
    String icon,
    String count,
  ) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        // ← Add padding for touch comfort
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start, // ← Important for multi-line desc
          children: [
            // Icon
            Image.asset(icon, width: 25, height: 25),
            const SizedBox(width: 10),

            // Middle: Text content (takes available space safely)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + Count badge in a flexible row
                  IntrinsicHeight(
                    // ← Keeps badge aligned nicely
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontFamily: FontFamilies.interDisplay,
                              color: AppColors.instance.black400,
                              fontWeight: FontFamilies.bold,
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        _countContainer(count), // Badge stays at end
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black600,
                      fontWeight: FontFamilies.bold,
                      fontSize: 11,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Right arrow (always visible, aligned to top)
            Padding(
              padding: EdgeInsets.only(left: 8, top: 4),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 12,
                color: AppColors.instance.black600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick actions',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black300,
            fontFamily: FontFamilies.interDisplay,
          ),
        ),
        SizedBox(height: 12),
        _buildOTPAccessCard(context, ref),
      ],
    );
  }

  Widget _buildOTPAccessCard(BuildContext context, WidgetRef ref) {
    final state = ref.read(oTpformProvider.notifier);

    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _buildFeatureButton(
                AssetPaths.maintenanceLog,
                "Validate Entry",
                () {
                  state.resetForm();
                  showUserBottomSheet(
                    context: context,
                    headertitle: "",
                    headersubtitle: "",
                    ref: ref,
                    bottom: BottomSheetView.optionForIdAndCode,
                  );
                },
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _buildFeatureButton(
                AssetPaths.vaolationIcon,
                "Violations",
                () {
                  showUserBottomSheet(
                    context: context,
                    headertitle: "Violations",
                    headersubtitle: "Track violation residents",
                    ref: ref,
                    bottom: BottomSheetView.securityViolationTrack,
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _buildFeatureButton(
                AssetPaths.visitorLo,
                "Maintain Logs",
                () {
                  showUserBottomSheet(
                    context: context,
                    headertitle: "Access Logs",
                    headersubtitle: "Track access logs residents",
                    ref: ref,
                    bottom: BottomSheetView.mentainLog,
                  );
                },
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _buildFeatureButton(
                AssetPaths.emgencySecurity,
                "Emergencies",
                () {
                  showUserBottomSheet(
                    context: context,
                    headertitle: "",
                    headersubtitle: "",
                    ref: ref,
                    bottom: BottomSheetView.residentEmgencyContacts,
                  );
                  // showUserBottomSheet(
                  //   context: context,
                  //   headertitle: "",
                  //   headersubtitle: "",
                  //   ref: ref,
                  //   bottom: BottomSheetView.workEmgencyContacts,
                  // );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 28),
      ],
    );
  }

  Widget _buildFeatureButton(String icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 30, height: 30),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontFamilies.bold,
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
