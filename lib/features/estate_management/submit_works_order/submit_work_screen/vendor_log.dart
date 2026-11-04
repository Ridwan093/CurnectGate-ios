import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_screen/work_requst_screen.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/worker_data.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class VendorLog extends ConsumerWidget {
  VendorLog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: _buildBody(size, ref, context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: InkWell(
        onTap: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new),
      ),
    );
  }

  Widget _buildBody(Size size, WidgetRef ref, BuildContext context) {
    return Column(
      children: [
        _buildAddMemberButton(size, context, ref),
        const SizedBox(height: 30),
        Expanded(child: _buildContent(size, context, ref)),
      ],
    );
  }

  Widget _buildAddMemberButton(Size size, BuildContext context, WidgetRef ref) {
    final provider = ref.read(formProvider.notifier);
    return InkWell(
      onTap: () {
        provider.restaddMemberFillds();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SubmitWorkOrderPage()),
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
            "Submit Work Order +",
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

  Widget _buildContent(Size size, BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Vendor Log",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 20,
                  fontWeight: FontFamilies.bold,
                  color: AppColors.instance.black600,
                ),
              ),
              // CustomStatusDropdown(
              //   statusOptions: _statusOptions,
              //   initialStatus: 'Pending',
              //   onStatusChanged: (newStatus) {
              //     log('Selected status: $newStatus');
              //     // Handle status change
              //   },
              // ),
            ],
          ),

          const SizedBox(height: 23),

          Expanded(child: WorkOderData()),
        ],
      ),
    );
  }
}
