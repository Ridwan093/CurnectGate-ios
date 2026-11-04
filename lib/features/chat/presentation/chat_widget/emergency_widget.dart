import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyWidget extends StatelessWidget {
  const EmergencyWidget({super.key});
  Future<void> _launchPhoneDialer(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            Text(
              "Have an emergency?",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                fontSize: 20,
                color: AppColors.instance.black600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Call this emergency contact",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 12,
                color: AppColors.instance.black300,
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),

        // Primary option tile
        _buildEmergencycard(),

        const SizedBox(height: 5),
      ],
    );
  }

  Widget _buildEmergencycard() {
    return Container(
      height: 100,
      color: AppColors.instance.grey300,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        onTap: () => _launchPhoneDialer("+2348130376047"),
        leading: Material(
          shape: CircleBorder(),
          elevation: .5,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.instance.grey200,
            ),
            child: Center(
              child: Image.asset(
                AssetPaths.chatemergency,
                width: 25,
                height: 25,
              ),
            ),
          ),
        ),
        title: Text(
          "Emergency line",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 15,
          ),
        ),
        subtitle: Text(
          "+2349040020300",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 15,
            color: AppColors.instance.error600,
          ),
        ),
      ),
    );
  }
}
