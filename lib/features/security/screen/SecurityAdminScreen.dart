import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/local_store/User_localdata_provider.dart';
import 'package:curnectgate/core/local_store/getUserprofile_file_provider.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/poll/poll_item_summary.dart';
import 'package:curnectgate/features/estate_management/elections/models/slected_eletion_type_model.dart';
import 'package:curnectgate/features/estate_management/elections/provider/eletion_provider.dart';
import 'package:curnectgate/features/estate_management/elections/provider/poll_provider.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/errore_message.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/votingSettingCheck.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/general_notification_count_widget.dart';
import 'package:curnectgate/features/security/provider/duty_provider.dart';
import 'package:curnectgate/features/security/provider/formState.dart';
import 'package:curnectgate/features/security/provider/permmission_handler.dart';
import 'package:curnectgate/features/security/provider/scanProvider.dart';
import 'package:curnectgate/features/security/widget/Scan_widget.dart';
import 'package:curnectgate/features/security/widget/security_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

/// 072015 visitor Otp
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

    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) {
        if (isScanning) {
          state.resetForm();
          ref.read(qrScanProvider.notifier).state = false;
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.instance.grey200,

        body: Stack(
          children: [
            if (!isScanning) _buildBody(size, ref),
            if (isScanning) ScanWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(Size size, WidgetRef ref) {
    final isSmallScreen = size.height < 700 || size.width < 380;
    final errorMessage = ref.watch(electionProvider).isError;

    return SizedBox(
      height: size.height,
      width: size.height,
      child: Column(
        children: [
          SizedBox(
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              color: AppColors.instance.grey200,
              child: _buildHeader(ref),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              color: AppColors.instance.yellow500,
              onRefresh: () async {
                await Future.wait([
                  ref.read(dutyProvider.notifier).refreshDuty(context, ref),
                  ref.read(pollProvider.notifier).refreshPoll(context, ref),
                ]);
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 16,
                  top: isSmallScreen ? 10 : 25,
                ),
                child: Column(
                  children: [
                    PremiumSecurityHeader(),
                    const SizedBox(height: 15),
                    _buildCheckOutbutto(),
                    const SizedBox(height: 15),

                    if ((errorMessage).isNotEmpty) ...[
                      AnimatedErrorCard(
                        message: errorMessage,
                        onClose: () {
                          ref.read(electionProvider.notifier).setError(null);
                        },
                      ),
                    ] else ...[
                      _buildPollCard(context, ref),
                    ],

                    const SizedBox(height: 15),
                    _buildQuickActions(ref),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(WidgetRef ref) {
    final profileFile = ref.watch(profilePicProvider);
    final authState = ref.watch(authProvider);
    final user = authState.user;
    final fullname = authState.fullname ?? "User";
    final String role = user?["role"] ?? "Security Officer";

    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.height < 700 || size.width < 380;

    final fontScale = isSmallScreen ? 0.9 : 1.0;

    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              CircleAvatar(
                radius: isSmallScreen ? 26 : 32,
                backgroundImage:
                    profileFile != null ? FileImage(profileFile) : null,
                backgroundColor: AppColors.instance.teal100,
                child:
                    profileFile != null
                        ? null
                        : Image.asset(
                          AssetPaths.navProfileActive,
                          width: 25,
                          color: AppColors.instance.black600,
                        ),
              ),
              const SizedBox(width: 12),

              /// ⭐ TEXT AREA MUST ALSO EXPAND
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      fullname,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 18 * fontScale,
                        fontWeight: FontWeight.bold,
                        color: AppColors.instance.black600,
                      ),
                    ),
                    Text(
                      role.replaceAll("_", " "),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14 * fontScale,
                        color: AppColors.instance.black600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        /// RIGHT SIDE
        NotificationCount(
          color: AppColors.instance.black600,
          onTap: () {
            context.pushNamed(AppRoutes.securitynotification);
          },
          width: 10,
        ),
      ],
    );
  }

  Widget _buildActionButton(
    String label,
    Color color,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.instance.grey200, size: 20),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.instance.grey200,
                  fontWeight: FontFamilies.bold,
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPollCard(BuildContext context, WidgetRef ref) {
    final pollAsync = ref.watch(pollProvider);

    return Votingsettingcheck(
      child: pollAsync.when(
        data: (data) {
          final polls = data?.data?.polls ?? [];
          final activePolls =
              polls
                  .where(
                    (p) =>
                        (p.status ?? "").toLowerCase().contains('active') ||
                        (p.status ?? "").toLowerCase().contains('live'),
                  )
                  .toList();
          if (activePolls.isEmpty) {
            return const Text("Empty");
          }
          return _buildStaticPollCard(context, ref, activePolls);
        },
        loading: () => SizedBox.shrink(),
        error: (error, stack) {
          try {
            // Handle session expiration first
            if (error.toString().contains("Unauthorized")) {
              return SizedBox.shrink();
            }

            // Try to show cached data if available
            final cachedReport = ref.read(pollProvider).value;
            final activePolls = cachedReport?.data?.polls;
            if (activePolls != null && activePolls.isNotEmpty) {
              return _buildStaticPollCard(context, ref, activePolls);
            }

            // No cached data available
            return SizedBox.shrink();
          } catch (e) {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildStaticPollCard(
    BuildContext context,
    WidgetRef ref,
    List<PollItemSummary> activePolls,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.18),
            blurRadius: 16,
            spreadRadius: 4,
            offset: const Offset(0, 6),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (activePolls.isNotEmpty) {
              showSelectElectionBottomSheet(
                context: context,
                ref: ref,
                activePolls: activePolls,
              );
            }
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.instance.teal100,
                child: Icon(
                  Icons.how_to_vote,
                  color: AppColors.instance.teal400,
                ),
              ),
              title: Text(
                "Elections/Polls",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontWeight.bold,
                  color: AppColors.instance.black600,
                  fontSize: 15,
                ),
              ),
              subtitle: Text(
                "Latest Poll/Elections in your community",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontWeight.w500,
                  color: AppColors.instance.black300,
                  fontSize: 13,
                ),
              ),
              trailing: SizedBox(
                width: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      activePolls.length.toString(),
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontWeight.bold,
                        color: AppColors.instance.black600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckOutbutto() {
    final notifier = ref.read(oTpformProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: _buildActionButton(
            "Check In",
            AppColors.instance.yellow600,
            Icons.login,
            () {
              notifier.updateValidationType("");

              showUserBottomSheet(
                context: context,
                headertitle: "checkin",
                headersubtitle: "",
                ref: ref,
                bottom: BottomSheetView.visitorValidation,
              );
            }, // add your check-in handler
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildActionButton(
            "Check Out",
            AppColors.instance.teal400,
            Icons.logout,
            () {
              notifier.updateValidationType("");

              showUserBottomSheet(
                context: context,
                headertitle: "checkout",
                headersubtitle: "",
                ref: ref,
                bottom: BottomSheetView.visitorValidation,
              );
            }, // add your check-out handler
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions(WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildOTPAccessCard(context, ref)],
    );
  }

  Widget _buildOTPAccessCard(BuildContext context, WidgetRef ref) {
    final state = ref.read(oTpformProvider.notifier);

    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _buildFeatureButton(
                    AssetPaths.maintenanceLog,
                    "Validate Entry      ",
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
          ],
        ),
        Positioned(
          // left: 0,
          // right: 0,
          // top: 25,
          child: _buildCenterClickButton(
            onTap: () async {
              final hasPermission = await checkCameraPermission(context);
              if (!hasPermission) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Camera permission required")),
                );
                return;
              }
              state.resetForm();
              ref.read(qrScanProvider.notifier).state = true;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCenterClickButton({required VoidCallback onTap}) {
    final size = MediaQuery.sizeOf(context);
    final isSmallScreen = size.height < 700 || size.width < 380;
    return Container(
      alignment: Alignment.center,
      height: isSmallScreen ? 110 : 130,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.instance.teal400,
        boxShadow: [
          BoxShadow(
            spreadRadius: 5.0,
            blurRadius: 2.0,

            offset: Offset.fromDirection(1.0),
            color: Colors.white,
          ),
        ],
      ),
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.instance.grey200,
              boxShadow: [
                BoxShadow(
                  spreadRadius: 5.0,
                  blurRadius: 2.0,

                  offset: Offset.fromDirection(1.0),
                  color: Colors.grey.shade300,
                ),
              ],
            ),
            child: Center(
              child: Icon(
                Icons.qr_code_scanner,
                color: AppColors.instance.teal400,
              ),
            ),
          ),
        ),
      ),
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
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Text(
                label,
                maxLines:
                    label.toLowerCase().contains("validate entry") ? 2 : null,
                textAlign:
                    label.toLowerCase().contains("validate entry")
                        ? TextAlign.left
                        : TextAlign.center,

                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontFamilies.bold,
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                ),
                // maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
