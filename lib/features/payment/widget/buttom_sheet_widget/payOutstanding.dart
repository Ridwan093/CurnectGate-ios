import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/screen/DuePayment.dart';
import 'package:curnectgate/features/payment/screen/select_duetoPay.dart';
import 'package:flutter/material.dart';

class PayOutstanding extends StatelessWidget {
  final String headertitle;
  const PayOutstanding({super.key, required this.headertitle});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        key: const ValueKey('userDetails'),
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header section
          Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                headertitle,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 18,
                  color: AppColors.instance.black600,
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
          const SizedBox(height: 50),

          _buildPrimaryOptionTile(
            title: "Pay full amount",
            subtitle: "Pay the total ",
            second: "(#53,067)",
            last: "  now",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DuePayment()),
              );
            },
          ),
          const SizedBox(height: 5),
          _buildPrimaryOptionTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DuePaymentSelection()),
              );
            },
            title: "Pay custom amount",
            subtitle: "Pay part now, part later",
          ),
        ],
      ),
    );
  }

  Widget _buildPrimaryOptionTile({
    required String title,
    required String subtitle,
    VoidCallback? onTap,
    String? second,
    last,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100,
        color: AppColors.instance.grey300,
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),

          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontFamilies.bold,
                    color: AppColors.instance.black300,
                    fontSize: 13,
                  ),
                  children: [
                    TextSpan(text: subtitle),
                    TextSpan(
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontFamilies.bold,
                        fontSize: 13,
                        color: AppColors.instance.black600,
                      ),
                      text: second,
                    ),
                    TextSpan(text: last),
                  ],
                ),
              ),
              if (second != null) ...[
                SizedBox(height: 5),
                Text(
                  "Low wallet balance:#0.00",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontFamilies.bold,
                    fontSize: 11,
                    color: AppColors.instance.error500,
                  ),
                ),
              ],
            ],
          ),
          title: Text(
            title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
