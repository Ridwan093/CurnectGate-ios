import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/generate_model.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/active_provider.dart';
import 'package:curnectgate/features/member_management/Member_Dashboard/widget/reusable_vistor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewAllPage extends ConsumerWidget {
  const ViewAllPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generatedList = ref.watch(
      generateNotifierProvider.select((s) => s.generatedList),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Visitors (${generatedList.length})',
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body:
          generatedList.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AssetPaths.dashboardActivities, width: 120),
                    const SizedBox(height: 20),
                    Text(
                      "No visitors found",
                      style: TextStyle(fontFamily: FontFamilies.interDisplay),
                    ),
                  ],
                ),
              )
              : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: generatedList.length,
                itemBuilder: (context, index) {
                  final visitor = generatedList[index];
                  return VisitorCard(
                    userName: visitor.vistorName,
                    purposeOfVisit: visitor.purposeofVisit,
                    selectedDate: visitor.selectedDate,
                    selectedTime: visitor.selectedTime,
                    onChangePressed: () {},
                    showExpiry: false, // Hide expiry in list view
                  );
                },
              ),
    );
  }

  void _showManageBottomSheet(
    BuildContext context,
    WidgetRef ref,
    GenerateState visitor,
  ) {
    // Your existing bottom sheet implementation
  }
}
