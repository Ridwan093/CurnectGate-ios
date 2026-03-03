import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class Dashbordrowcard extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const Dashbordrowcard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio:
            1.0, // Square card — change to 0.9 for taller, 1.2 for wider
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: const EdgeInsets.all(
                  12,
                ), // Comfortable inner spacing
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      icon,
                      width: 40, // Base size — will scale down if needed
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 13,
                        color: AppColors.instance.black600,
                        fontWeight: FontFamilies.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
