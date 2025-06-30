import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/userProfile/provider/profileState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Setpreference extends ConsumerWidget {
  const Setpreference({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody(ref, context));
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.instance.black600,
          size: 14,
        ),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetPaths.dashboardNotification, width: 30),
        ),
      ],
    );
  }

  Widget _buildBody(WidgetRef ref, BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Set Preference",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 16,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
            ),
          ),
          SizedBox(height: 10),
          _buildListTile(context: context, ref: ref),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required WidgetRef ref,
    required BuildContext context,
  }) {
    final isEnabled = ref.watch(switchProvider);
    final notifier = ref.read(switchProvider.notifier);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: ListTile(
        title: Text(
          'Show my profile in directory',
          style: TextStyle(
            fontWeight: FontFamilies.bold,
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black600,
            fontSize: 12,
          ),
        ),
        subtitle: Text(
          "Hide or show your profile in the directory",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 10,
            color: AppColors.instance.black300,
          ),
        ),
        trailing: Switch(
          focusColor: AppColors.instance.black300,
          activeColor: AppColors.instance.black600,
          thumbColor: WidgetStatePropertyAll(AppColors.instance.grey200),
          value: isEnabled,
          onChanged: (value) async {
            try {
              await notifier.toggleSwitch(value);
            } catch (e) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Failed to update: $e')));
              // Revert UI if API fails
              // ignore: invalid_use_of_protected_member
              notifier.state = !value;
            }
          },
        ),
      ),
    );
  }
}
