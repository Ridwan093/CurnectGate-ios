import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/features/%20operations/OTP_Activation/provider/active_provider.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/code_check_widget/buildnotifymessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ValidityMessage extends ConsumerWidget {
  const ValidityMessage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expiryDateTime = ref.watch(
      generateNotifierProvider.select((state) => state.expiryDateTime),
    );

    if (expiryDateTime == null) {
      return const SizedBox.shrink();
    }

    final remaining = expiryDateTime.difference(DateTime.now());
    if (remaining.isNegative) {
      return const SizedBox.shrink();
    }

    final durationText = _formatDuration(remaining);

    return InfoMessage(
      size: 14,
      message: "Your scheduled OTP is valid within $durationText",
      icon: AssetPaths.location,
    );
  }

  String _formatDuration(Duration diff) {
    if (diff.inMinutes < 1) return 'less than a minute';
    if (diff.inMinutes < 60) {
      return '${diff.inMinutes} minute${diff.inMinutes == 1 ? '' : 's'}';
    }
    if (diff.inHours < 24) {
      return '${diff.inHours} hour${diff.inHours == 1 ? '' : 's'}';
    }
    if (diff.inDays < 30) {
      return '${diff.inDays} day${diff.inDays == 1 ? '' : 's'}';
    }
    if (diff.inDays < 365) {
      final months = (diff.inDays / 30).floor();
      return '$months month${months == 1 ? '' : 's'}';
    }
    final years = (diff.inDays / 365).floor();
    return '$years year${years == 1 ? '' : 's'}';
  }
}
