import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/screen/virtualAccount.dart';
import 'package:flutter/material.dart';

class FundingWallet extends StatelessWidget {
  final String headertitle;
  const FundingWallet({super.key, required this.headertitle});

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

          _buildPrimaryOptionTile(title: "Duration", trailing: "2 minutes"),
          const SizedBox(height: 5),
          _buildPrimaryOptionTile(title: "Funding limit", trailing: "No limit"),
          SizedBox(height: 20),
          _buildbutton(context),
        ],
      ),
    );
  }

  Widget _buildbutton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VirtualAccount()),
        );
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.instance.black600,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            "Continue",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,

              color: AppColors.instance.grey200,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPrimaryOptionTile({
    required String title,
    required String trailing,
  }) {
    return Container(
      height: 100,
      color: AppColors.instance.grey300,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),

        trailing: Text(
          trailing,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 15,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 13,
            color: AppColors.instance.black300,
          ),
        ),
      ),
    );
  }
}
