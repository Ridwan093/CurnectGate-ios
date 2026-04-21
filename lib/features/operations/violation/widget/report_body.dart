import 'dart:developer';

import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/violation/model/report_models/violation.dart';
import 'package:curnectgate/features/operations/violation/report_provider/getReport_provider.dart';
import 'package:curnectgate/features/operations/violation/widget/report_card.dart';
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
              final violations = report?.data?.violations ?? [];
              return violations.isNotEmpty
                  ? _buildReportList(violations)
                  : _buildEmptyBody();
              // if (violations != null && violations.isNotEmpty) {
              //   return _buildReportList(violations);
              // } else {
              //   return _buildEmptyBody();
              // }
            } catch (e) {
              return Builderroul(
                error: e.toString(),
                onTap:
                    () => ref
                        .read(userReportProvider.notifier)
                        .refreshReports(context, ref),
                firstMessae: "Faile to load violation?",
              );
            }
          },
          loading: () {
            return Loadingstates();
          },
          error: (error, stack) {
            try {
              // Handle session expiration first
              if (error.toString().contains("Unauthorized")) {
                return Expiresessionbody();
              }

              // Try to show cached data if available
              final cachedReport = ref.read(userReportProvider).value;
              final cachedViolations = cachedReport?.data?.violations ?? [];
              if (cachedViolations.isNotEmpty) {
                return _buildReportList(cachedViolations);
              }

              // No cached data available
              return Builderroul(
                error: error.toString(),
                onTap:
                    () => ref
                        .read(userReportProvider.notifier)
                        .refreshReports(context, ref),
                firstMessae: "Faile to load violation?",
              );
            } catch (e) {
              log(e.toString());
              return Builderroul(
                error: e.toString(),
                onTap:
                    () => ref
                        .read(userReportProvider.notifier)
                        .refreshReports(context, ref),
                firstMessae: "Faile to load violation?",
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetPaths.dashboardReports, height: 100, width: 100),
            const SizedBox(height: 10),
            Text(
              "Your violation appear here",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black300,
                fontSize: 12,
                fontWeight: FontFamilies.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
