import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AgreementRequiredScreen extends StatelessWidget {
  const AgreementRequiredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.description_outlined,
                size: 64,
                color: AppColors.instance.yellow600,
              ),

              const SizedBox(height: 24),

              Text(
                "Signature Required",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontFamilies.bold,
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                "Before continuing, you must review and sign the property agreement.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: AppColors.instance.black500,
                  fontFamily: FontFamilies.interDisplay,
                ),
              ),

              const SizedBox(height: 32),

              InkWell(
                onTap: () {
                  context.pushNamed(AppRoutes.propertyAgreement);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: AppColors.instance.black600,
                    borderRadius: BorderRadius.circular(14),
                  ),

                  child: Center(
                    child: Text(
                      "Review & Sign Agreement",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.instance.grey200,
                        fontFamily: FontFamilies.interDisplay,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
