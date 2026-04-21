import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/dashbord_Model/payment_dashboard_data.dart';
import 'package:curnectgate/features/payment/widget/custom_tab_view.dart';
import 'package:curnectgate/features/payment/widget/payment_data/dasbordData.dart';
import 'package:curnectgate/features/payment/widget/payment_data_content/dashbord_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PaymentScreen extends ConsumerWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: _buildAppBar(),
      body: SizedBox(
        width: size.width,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(14, 14, 14, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 20,
                  color: AppColors.instance.black600,
                ),
              ),
              SizedBox(height: 20),
              DashbordData(
                builder:
                    (context, data) =>
                        DashbordContent(data: data as PaymentDashboardData),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Activities",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 20,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.pushNamed(AppRoutes.paymentHistory);
                    },
                    child: Text(
                      "See all",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontFamilies.bold,
                        fontSize: 13,
                        color: AppColors.instance.teal300,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: BoxConstraints(
                  // Fallback for small devices
                  maxHeight: MediaQuery.of(context).size.height * 0.3,
                ),
                child: CustomTabView(), // Must handle internal scrolling
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey.shade100,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(Icons.settings),
        ),
      ],
    );
  }
}
