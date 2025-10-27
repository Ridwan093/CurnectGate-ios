import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VotnowContainer extends ConsumerWidget {
  const VotnowContainer({super.key});

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
        children: const [
          Text(
            'How to Vote',
            style: TextStyle(
              fontWeight: FontFamilies.bold,
              fontFamily: FontFamilies.interDisplay,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '\u2022 Select ONE candidate for each position',
            style: TextStyle(fontFamily: FontFamilies.interDisplay),
          ),
          SizedBox(height: 4),
          Text(
            '\u2022 Review your choices before submitting',
            style: TextStyle(fontFamily: FontFamilies.interDisplay),
          ),
          SizedBox(height: 4),
          Text(
            '\u2022 You can only vote once per position',
            style: TextStyle(fontFamily: FontFamilies.interDisplay),
          ),
        ],
      ),
    );
  }
}
