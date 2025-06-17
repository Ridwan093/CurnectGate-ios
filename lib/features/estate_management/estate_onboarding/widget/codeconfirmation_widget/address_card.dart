import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  final String icon;
  final String address;
  final String code;
  const AddressCard({
    super.key,
    required this.icon,
    required this.address,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.instance.blue100,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Row(
            children: [
              Image.asset(icon, width: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  address,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 12,
                    color: AppColors.instance.black600,
                    fontWeight: FontFamilies.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Material(
          elevation: 0.1,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),

          color: Colors.grey.shade100.withOpacity(.7),
          child: Container(
            height: 110,
            padding: const EdgeInsets.only(left: 10,right: 10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Column(children: [
                Expanded(child: _buildestatelable(label: "Estate Code", triling: code)),
               
                 Expanded(child: _buildestatelable(label: "Estate Name", triling: "Greenwood Estate"))
                
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildestatelable({required String label, required String triling}) {

    return ListTile(title: Text(label,style: TextStyle(
      fontFamily: FontFamilies.interDisplay,
      color: AppColors.instance.black400,
      fontWeight: FontFamilies.bold,
      fontSize: 12
    ),), trailing: Text(triling,style: TextStyle(
      fontFamily: FontFamilies.interDisplay,
      color: AppColors.instance.black600,
      fontWeight: FontFamilies.bold,
      fontSize: 12
    ),));
  }
}
