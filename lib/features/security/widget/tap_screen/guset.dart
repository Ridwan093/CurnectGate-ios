import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class Guset extends StatelessWidget {
  const Guset({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          _buildContainer(size),
          _buildContainer(size),
          _buildContainer(size),
          _buildContainer(size),
        ],
      ),
    );
  }

  Widget _buildContainer(Size size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        child: Container(
        
          height: 100,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              _buildDetailRow(title: "Name", value: "Mr. john benjamin"),
              _buildDetailRow(title: "Type", value: "Guest"),
              _buildDetailRow(title: "Allowed", value: "3"),
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
                color: AppColors.instance.black300,
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
