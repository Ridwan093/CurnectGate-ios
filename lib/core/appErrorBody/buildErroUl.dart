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

    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxHeight < 300;

        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error_outline,
                  size: isCompact ? 32 : 48,
                  color: AppColors.instance.error600,
                ),
                SizedBox(height: isCompact ? 8 : 16),
                Text(
                  firstMessae,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: isCompact ? 14 : 16,
                    color: AppColors.instance.black600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (!isCompact) ...[
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
                ],
                SizedBox(height: isCompact ? 12 : 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.instance.grey200,
                    padding: EdgeInsets.symmetric(
                      horizontal: isCompact ? 24 : 32,
                      vertical: isCompact ? 8 : 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: onTap,
                  child: Text(
                    "Try Again",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black600,
                      fontWeight: FontWeight.bold,
                      fontSize: isCompact ? 12 : 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
