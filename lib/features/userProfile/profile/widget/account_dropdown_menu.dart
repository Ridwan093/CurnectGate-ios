// widgets/account_dropdown_menu.dart
import 'package:curnectgate/core/style/colors.dart' show AppColors;
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountDropdownMenu extends ConsumerWidget {
  const AccountDropdownMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<String>(
      color: Colors.white,
      icon: const Icon(Icons.more_vert),
      itemBuilder:
          (context) => [
            _buildMenuItem('Update Profile Picture', Icons.camera_alt_outlined),

            _buildMenuItem('Change Your Name', Icons.person_outline),
            _buildMenuItem('Change Password', Icons.lock_outline),
            _buildMenuItem('Deactivate Account', Icons.delete_outline),
          ],
      onSelected: (value) => _handleSelection(context, value, ref),
    );
  }

  PopupMenuItem<String> _buildMenuItem(String title, IconData icon) {
    return PopupMenuItem<String>(
      value: title,
      child: ListTile(
        leading: Icon(icon, color: AppColors.instance.black600, size: 16),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 13,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black500,
          ),
        ),
      ),
    );
  }

  void _handleSelection(BuildContext context, String value, WidgetRef ref) {
    switch (value) {
      case 'Deactivate Account':
        showUserBottomSheet(
          context: context,
          headertitle: "",
          headersubtitle: "",
          ref: ref,
          bottom: BottomSheetView.deactivateAccount,
        );
        break;
      case 'Change Password':
        showUserBottomSheet(
          context: context,
          headertitle: "",
          headersubtitle: "",
          ref: ref,
          bottom: BottomSheetView.changePassword,
        );
        break;
      case 'Update Profile Picture':
        showUserBottomSheet(
          context: context,
          headertitle: "",
          headersubtitle: "",
          ref: ref,
          bottom: BottomSheetView.profilePiceUpdate,
        );
        break;
      case 'Change Your Name':
        showUserBottomSheet(
          context: context,
          headertitle: "",
          headersubtitle: "",
          ref: ref,
          bottom: BottomSheetView.profileUpdat,
        );
        break;
    }
  }
}
