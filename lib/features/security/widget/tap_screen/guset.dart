import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class Guset extends StatelessWidget {
  const Guset({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        children: [
          _buildContainer(
            size: size,
            entrypath: AssetPaths.userAvatar1,
            entrytitle: "Allowed entry",
          ),
          _buildContainer(
            size: size,
            entrypath: AssetPaths.userAvatar2,
            entrytitle: "Denied entry",
          ),
          _buildContainer(
            size: size,
            entrypath: AssetPaths.userAvatar1,
            entrytitle: "Allowed entry",
          ),
          _buildContainer(
            size: size,
            entrypath: AssetPaths.userAvatar2,
            entrytitle: "Denied entry",
          ),
        ],
      ),
    );
  }

  Widget _buildContainer({
    required Size size,
    required String entrytitle,
    required String entrypath,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          width: size.width,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.instance.grey300),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: AssetImage(entrypath),
                    ),
                    SizedBox(width: 12),
                    Container(
                      padding: EdgeInsets.only(
                        left: 6,
                        right: 6,
                        top: 3,
                        bottom: 3,
                      ),
                      decoration: BoxDecoration(
                        border:
                            entrytitle.contains("Allowed")
                                ? null
                                : Border.all(
                                  color: AppColors.instance.error600,
                                ),
                        borderRadius: BorderRadius.circular(10),
                        color:
                            entrytitle.contains("Allowed")
                                ? AppColors.instance.teal100
                                : AppColors.instance.error200,
                      ),
                      child: Center(
                        child: Text(
                          entrytitle,
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 10,
                            color:
                                entrytitle.contains("Allowed")
                                    ? AppColors.instance.teal400
                                    : AppColors.instance.error600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              _buildDetailRow(title: "Name", value: "Mr. john benjamin"),
              _buildDetailRow(title: "Type", value: "Guest"),
              _buildDetailRow(title: "Time of Entry", value: "3:43 PM"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 13,
                color: AppColors.instance.black600,
              ),
            ),
          ),

          Text(
            value,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 13,
              color: AppColors.instance.black600,
            ),
          ),
        ],
      ),
    );
  }
}
