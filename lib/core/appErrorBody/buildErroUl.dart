import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Builderroul extends ConsumerWidget {
  final String error;
  final VoidCallback onTap;
  final String firstMessae;

  const Builderroul({
    super.key,
    required this.error,
    required this.onTap,
    required this.firstMessae,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Decide whether to show full error or shortened version
    final displayError =
        _shouldShowFullError(error) ? error.trim() : _shortenError(error);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: AppColors.instance.error600,
            ),
            const SizedBox(height: 16),
            Text(
              firstMessae,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 16,
                color: AppColors.instance.black600,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              displayError,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: _shouldShowFullError(error) ? 15 : 16,
                color: AppColors.instance.black400,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.instance.grey200,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
              ),
              onPressed: onTap,
              child: Text(
                "Try Again",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ====================== Helper Methods ======================

  bool _shouldShowFullError(String errorText) {
    final lower = errorText.toLowerCase().trim();

    const specialKeywords = [
      'access denied',
      'permission',
      'session',
      'subscription',
      'plan',
      'unauthorized', // good to add
      'expired', // for session expired
    ];

    return specialKeywords.any((keyword) => lower.contains(keyword));
  }

  String _shortenError(String errorText) {
    final trimmed = errorText.trim();

    // If there's a ":", show only the part before it
    if (trimmed.contains(':')) {
      final short = trimmed.split(':').first.trim();
      return short.isNotEmpty ? short : trimmed;
    }

    // No ":" → return full (but you can limit length if you want)
    return trimmed.length > 120 ? '${trimmed.substring(0, 117)}...' : trimmed;
  }
}
