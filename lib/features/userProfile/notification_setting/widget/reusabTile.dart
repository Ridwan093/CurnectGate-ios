import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/permission_loading_provider.dart';
import 'package:curnectgate/features/userProfile/notification_setting/widget/oldSchoolSwcth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildListTile extends ConsumerWidget {
  WidgetRef? ref;
  final bool isEnabled;
  final BuildContext context;
  final String dec;
  final String title;
  final Function(bool)? onChanged;
  BuildListTile({
    super.key,
    this.ref,
    required this.isEnabled,
    required this.context,
    required this.dec,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final isLoading = ref.watch(permissionLoadingProvider(title));
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontFamilies.bold,
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black600,
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          dec,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 10,
            color: AppColors.instance.black300,
          ),
        ),
        trailing: OldSchoolSwitch(
          isLoading: isLoading,
          value: isEnabled,
          onChanged: (value) async {
            if (onChanged != null) {
              await onChanged!(value); // ✅ Actually triggers the API logic
            }
          },
        ),
      ),
    );
  }
}
