import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class InfoMessage extends StatelessWidget {
  final String icon;
  final String message;

  const InfoMessage({super.key, required this.icon, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.instance.blue100,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Row(
        children: [
          Image.asset(icon, width: 20),

          if (message == "Find this ID in your estate welcome letter/") ...[
            const SizedBox(width: 15),
            _buildseeMore(),
          ] else ...[
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 12,
                  color: AppColors.instance.black600,
                  fontWeight: FontFamilies.bold,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildseeMore() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              color: AppColors.instance.black600,
              fontWeight: FontFamilies.bold,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "email.",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 12,
                  color: AppColors.instance.black600,
                  fontWeight: FontFamilies.bold,
                ),
              ),
              SizedBox(width: 5),
              InkWell(
                onTap: () {},
                child: Text(
                  "see sample",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 11,
                    color: AppColors.instance.black600,
                    fontWeight: FontFamilies.bold,

                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
