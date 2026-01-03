import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/dashbord_Model/payment_dashboard_data.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/validation_option/widget/featureNotavailableDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class DashbordContent extends ConsumerWidget {
  final PaymentDashboardData? data;
  const DashbordContent({super.key, required this.data});
  String formatPrice(String price) {
    final number = double.tryParse(price) ?? 0.0;
    final formatter = NumberFormat('#,##0.00');
    return formatter.format(number);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        _buildbalanceCard(size, context, data),
        SizedBox(height: 20),
        _buildDueCard(
          data!.totalOutstanding.toString(),
          data?.totalOutstanding == 0,
          size,
          ref,
          context,
          data,
        ),
      ],
    );
  }

  Widget _buildDueCard(
    String amount,
    bool isDue,
    Size size,
    WidgetRef ref,
    BuildContext context,
    PaymentDashboardData? data,
  ) {
    return Container(
      padding: EdgeInsets.all(12),
      height: isDue ? 50 : 60,
      width: size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.instance.grey300,
            spreadRadius: .9,
            blurRadius: 1,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child:
          isDue
              ? Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "No upcoming dues",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black400,
                    fontWeight: FontFamilies.medium,
                    fontSize: 13,
                  ),
                ),
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "Total dua amount is ₦${formatPrice(amount)}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.black400,
                        fontWeight: FontFamilies.medium,
                        fontSize: 13,
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

  Widget _buildbalanceCard(
    Size size,
    BuildContext context,
    PaymentDashboardData? data,
  ) {
    return Container(
      height: 150,
      width: size.width,

      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: .9,
            color: AppColors.instance.grey300,
          ),
        ],
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your balance",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black400,
              ),
            ),

            Text(
              "₦${formatPrice(data?.walletBalance ?? "")}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
                fontWeight: FontFamilies.bold,
                fontSize: 27,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  height: 3,
                  width: size.width / 2 - 100,
                  color: AppColors.instance.teal300,
                ),
                Expanded(
                  child: Container(
                    height: 3,
                    width: size.width / 2,
                    color: AppColors.instance.teal200,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                _buildWalletbutton(
                  data: "Fund wallet",
                  onTap: () {
                    context.pushNamed(AppRoutes.paymentMethod);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => PaymentMethodScreen(),
                    //   ),
                    // );
                  },
                ),
                SizedBox(width: 10),
                _buildWalletbutton(
                  data: "Setup Autopay",
                  onTap: () {
                    showFuturNotAvailableDialog(context, "Setup Autopay");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletbutton({
    required String data,
    required VoidCallback onTap,
  }) {
    return Expanded(
      // ← Now correctly placed
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 35, // Keep your exact height
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ), // Horizontal only
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.instance.black600, width: 1.5),
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent,
          ),
          child: Center(
            child: Text(
              data,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
