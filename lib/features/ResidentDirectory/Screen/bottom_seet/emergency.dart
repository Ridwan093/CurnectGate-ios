import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Residentmergency extends ConsumerWidget {
  const Residentmergency({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.close, color: AppColors.instance.black600),
                ),
              ),
              SizedBox(height: 40),
              Text(
                "Emergency contacts",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 18,
                  color: AppColors.instance.black600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Call an emergency contact",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 13,
                  color: AppColors.instance.black300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildContainer(
            size: size,
            title: "Emergency line",
            subtitle: "+234 81203894898",
            icon: Icons.emergency
          ),
          _buildContainer(
            size: size,
            title: "Fire service",
            subtitle: "+234 81203894898",
            icon: Icons.local_fire_department
          ),
         
        ],
      ),
    );
  }

  Widget _buildContainer({
    required Size size,
    required String title,
    required String subtitle,
    required IconData icon
  }) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      padding: EdgeInsets.all(8),

      width: size.width,
      decoration: BoxDecoration(
        color: AppColors.instance.grey200,

        borderRadius: BorderRadius.circular(5),
      ),

      child: ListTile(
        leading: Material(
          elevation: 1,
          shape: CircleBorder(),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(icon, color: AppColors.instance.error600),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black600,
            fontWeight: FontFamilies.bold,
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.error600,
            fontWeight: FontFamilies.bold,
            fontSize: 14,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
