import 'dart:developer';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/violation/model/reportList_model.dart';
import 'package:curnectgate/features/%20operations/violation/report_provider/getReport_provider.dart';
import 'package:curnectgate/features/%20operations/violation/widget/report_card.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportBody extends ConsumerWidget {
  const ReportBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(userReportProvider);

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref
              .read(userReportProvider.notifier)
              .refreshReports(context, ref),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: reportAsync.when(
          data: (report) {
            try {
              final violations = report?.data.violations;
              if (violations != null && violations.isNotEmpty) {
                return _buildReportList(violations);
              } else {
                return _buildEmptyBody();
              }
            } catch (e) {
              return _buildErrorUI('Failed to load reports', ref, context);
            }
          },
          loading: () {
            try {
              final cachedReport = ref.read(userReportProvider).value;
              final cachedViolations = cachedReport?.data.violations;
              return cachedViolations != null && cachedViolations.isNotEmpty
                  ? _buildReportList(cachedViolations)
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
              final cachedReport = ref.read(userReportProvider).value;
              final cachedViolations = cachedReport?.data.violations;
              if (cachedViolations != null && cachedViolations.isNotEmpty) {
                return Column(
                  children: [
                    _buildReportList(cachedViolations),
                    _buildNetworkWarningBanner(error.toString()),
                  ],
                );
              }

              // No cached data available
              return _buildErrorUI(
                error.toString().contains("The connection errored")
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

  Widget _buildReportList(List<Violation> violations) {
    return ListView.builder(
      itemCount: violations.length,
      itemBuilder: (context, index) {
        return ReportCard(violation: violations[index]);
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
                    .read(userReportProvider.notifier)
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
