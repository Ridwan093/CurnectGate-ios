import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/radios_widget/customradio.dart';
import 'package:flutter/material.dart';

class CustomRadioTile extends StatelessWidget {
  final String role;
  final String description;
  final String? selectedRole;
  final void Function(String?) onChanged;

  const CustomRadioTile({
    super.key,
    required this.role,
    required this.description,
    required this.selectedRole,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedRole == role;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.instance.grey300 : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppColors.instance.grey300 : Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(role),
            trailing: CustomRadio(
              selected: isSelected,
              onTap: () => onChanged(role),
            ),
            onTap: () => onChanged(role),
          ),
          if (isSelected)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                description,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 11,
                  color: AppColors.instance.black400,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
