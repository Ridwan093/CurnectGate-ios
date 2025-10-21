import 'dart:developer';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/violation/model/report_models/violation.dart';
import 'package:curnectgate/features/operations/violation/screens/ViolationDetailPage.dart';
import 'package:curnectgate/features/security/provider/resolved_provider.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/violation_card.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ResolvedData extends ConsumerWidget {
  const ResolvedData({super.key});

  String formatDate(String dateString) {
    // Parse the ISO 8601 string to DateTime
    DateTime dateTime = DateTime.parse(dateString);

    // Format the DateTime to "Month Day, Year" (e.g., "July 8, 2025")
    return DateFormat('MMMM d, yyyy').format(dateTime);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(resovedProvider);

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref.read(resovedProvider.notifier).refreshReports(context, ref),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: reportAsync.when(
          data: (report) {
            try {
              final violations = report?.data.violations;
              if (violations != null && violations.isNotEmpty) {
                return _buildReportList(violations, ref);
              } else {
                return _buildEmptyBody();
              }
            } catch (e) {
              return _buildErrorUI('Failed to load reports', ref, context);
            }
          },
          loading: () {
            try {
              final cachedReport = ref.read(resovedProvider).value;
              final cachedViolations = cachedReport?.data.violations;
              return cachedViolations != null && cachedViolations.isNotEmpty
                  ? _buildReportList(cachedViolations, ref)
                  : _buildLoadingState();
            } catch (e) {
              return _buildLoadingState();
            }
          },
          error: (error, stack) {
            try {
              // Handle session expiration first
              if (error.toString().contains("Unauthenticated")) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ref.read(authProvider.notifier).seassionExpire(context, ref);
                });
                return _buildSessionExpiredUI(context, ref);
              }

              // Try to show cached data if available
              final cachedReport = ref.read(resovedProvider).value;
              final cachedViolations = cachedReport?.data.violations;
              if (cachedViolations != null && cachedViolations.isNotEmpty) {
                return Column(
                  children: [
                    _buildReportList(cachedViolations, ref),
                    _buildNetworkWarningBanner(error.toString()),
                  ],
                );
              }

              // No cached data available
              return _buildErrorUI(
                error.toString().contains("connection")
                    ? "Connection failed. Please check your network"
                    : "Failed to load reports",
                ref,
                context,
              );
            } catch (e) {
              log(e.toString());
              return _buildErrorUI(
                "An unexpected error occurred",
                ref,
                context,
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildReportList(List<Violation> violations, WidgetRef ref) {
    return ListView.builder(
      itemCount: violations.length,
      itemBuilder: (context, index) {
        var data = violations[index];
        return InkWell(
          onTap: (){
             Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return FadeTransition(
                    opacity: animation,
                    child: ViolationDetailPage(
                      violation: data,
                      images: data.evidence.mediaUrls,
                    ),
                  );
                },
              ));
          },
          child: ParkingViolationCard(
            isInvestigation: true,
            imageUrl: data.evidence.mediaUrls.first.toString(),
            violationType: data.locationDetails.additionalLocation,
            reportedBy: data.isAnonymous ? "Anonymous" : data.reporter.name,
          
            resolutionType: "Awareness",
            date: formatDate(data.updatedAt),
            onDismiss: () {
              // Handle dismiss action
              showUserBottomSheet(
                context: context,
                headertitle: "Dismiss this violation?",
                headersubtitle:
                    "Select reason for dismissing this violation report",
                ref: ref,
                bottom: BottomSheetView.securitydismissViolation,
                id: data.id
              );
            },
            onAccept: () {
              // Handle accept action
              print("Violation accepted");
            },
          ),
        );
      },
    );
  }

  Widget _buildEmptyBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetPaths.dashboardWorkOrder, height: 100, width: 100),
          const SizedBox(height: 10),
          Text(
            "Your report List appear here",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black300,
              fontSize: 12,
              fontWeight: FontFamilies.medium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: CircularProgressIndicator(color: AppColors.instance.yellow500),
    );
  }

  Widget _buildSessionExpiredUI(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Session expired. Please login again."),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed:
                () => ref
                    .read(authProvider.notifier)
                    .seassionExpire(context, ref),
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }

  Widget _buildNetworkWarningBanner(String error) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.orange[100],
      child: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: Colors.orange),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "Showing cached data. ${error.split(':').first}",
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorUI(String error, WidgetRef ref, BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            "Error loading reports",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 16,
              color: AppColors.instance.black600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            error,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black400,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.instance.grey200,
            ),
            onPressed:
                () => ref
                    .read(resovedProvider.notifier)
                    .refreshReports(context, ref),
            child: Text(
              "Try Again",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
