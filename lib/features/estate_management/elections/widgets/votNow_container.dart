import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/election_Setting/voting_settings_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VotnowContainer extends ConsumerWidget {
  final VotingSettingsData data;
  const VotnowContainer({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.instance.yellow100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.instance.yellow500),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Voting Rules',
            style: TextStyle(
              fontWeight: FontFamilies.bold,
              fontFamily: FontFamilies.interDisplay,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '${data.settings?.votingRules ?? ""}',
            style: TextStyle(fontFamily: FontFamilies.interDisplay),
          ),
          SizedBox(height: 4),
          Text(
            '5. ${data.settings?.disclaimerText ?? ""}',
            style: TextStyle(fontFamily: FontFamilies.interDisplay),
          ),
        ],
      ),
    );
  }
}
