import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/OTP_Activation/screen/Activate_Otp_screen.dart';
import 'package:curnectgate/features/%20operations/violation/report_provider/getReport_provider.dart';
import 'package:curnectgate/features/%20operations/violation/report_provider/report_provider.dart';
import 'package:curnectgate/features/%20operations/violation/widget/report_body.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/vendor_fileter.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportViolation extends ConsumerStatefulWidget {
  const ReportViolation({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ReportviolationState();
}

class _ReportviolationState extends ConsumerState<ReportViolation> {
  @override
  void initState() {
    super.initState(); // Always call super.initState() first
    // Your initialization code here
  }

  void restState() {
    ref.read(reportProvider.notifier).resetState();
  }

  final List<String> _statusOptions = [
    'All',
    'Pending',
    'Investigating',
    'Dismissed',
    'Resolved',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SizedBox(
        height: size.height,

        child: _buildBody(size, ref, context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: const Icon(Icons.arrow_back_ios_new),
    );
  }

  Widget _buildBody(Size size, WidgetRef ref, BuildContext context) {
    return Column(
      children: [
        _buildAddMemberButton(size, context, ref),
        const SizedBox(height: 30),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Otpactivation()),
                );
              },
              child: Text(
                "Report violation",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 25,
                  fontWeight: FontFamilies.bold,
                  color: AppColors.instance.black600,
                ),
              ),
            ),
            CustomStatusDropdown(
              statusOptions: _statusOptions,
              initialStatus: 'All',
              onStatusChanged: (newStatus) {
                // log('Selected status: $newStatus');
                // Handle status change
                ref
                    .read(reportProvider.notifier)
                    .setReportFilter(newStatus.toLowerCase());
                ref
                    .read(userReportProvider.notifier)
                    .refreshReports(context, ref);
              },
            ),
          ],
        ),
        const SizedBox(height: 25),
        Expanded(child: ReportBody()),
      ],
    );
  }

  Widget _buildAddMemberButton(Size size, BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        showUserBottomSheet(
          context: context,
          headertitle: "Report violation",
          headersubtitle: "Report issues like noise, parking, or misconduct",
          ref: ref,
          bottom: BottomSheetView.reportviolation,
        );
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
          color: AppColors.instance.black600,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Report violation +",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.grey200,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
