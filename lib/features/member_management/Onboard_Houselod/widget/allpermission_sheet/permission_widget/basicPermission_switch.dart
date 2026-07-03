import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/permission_loading_provider.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/permission_widget/permission_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasicpermissionSwitch extends ConsumerWidget {
  final bool value;
  final String permissionSlug;
  final void Function(bool) onChanged;
  final String title;
  final String subtitle;

  const BasicpermissionSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.subtitle,
    required this.permissionSlug,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(permissionLoadingProvider(permissionSlug));
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          fontSize: 13,
          fontWeight: FontFamilies.bold,
          color: AppColors.instance.black600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          fontSize: 10,
          fontWeight: FontFamilies.medium,
          color: AppColors.instance.black300,
        ),
      ),
      trailing: CustomSwitch(
        value: value,
        isLoading: isLoading,
        onChanged: onChanged,
      ),
      minVerticalPadding: 0,
      visualDensity: VisualDensity.compact,
      // ignore: unnecessary_null_comparison
      onTap: onChanged != null ? () => onChanged(!value) : null,
    );
  }
}
