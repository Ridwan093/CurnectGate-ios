import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/features/%20operations/property_agreement/management_popup_screen.dart';
import 'package:curnectgate/features/%20operations/property_agreement/provider/complince_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgreementPopupData extends ConsumerWidget {
  final Widget child;
  const AgreementPopupData({super.key, required this.child});
  bool _isUserAccepted(dynamic agreement) {
    final property = agreement?.data?.agreementStatus?.propertyAgreement;

    if (property == null) return true;

    final accepted = property.accepted;
    final version = property.version;
    final acceptedAt = property.acceptedAt;
    final signature = property.signature;

    debugPrint("ACCEPTED RAW: $accepted");
    debugPrint("VERSION: $version");

    // 🚨 Detect placeholder object (your exact case)
    final isPlaceholder =
        accepted == false &&
        (version == null || version == 0) &&
        (acceptedAt == null || acceptedAt.isEmpty) &&
        (signature == null || signature.isEmpty);

    if (isPlaceholder) {
      // Treat as UNKNOWN, not unsigned
      return true;
    }

    // ✅ Only block when explicitly false with real data
    if (accepted == false) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agreementAsync = ref.watch(complianceprovider);
    return agreementAsync.when(
      data: (agreement) {
        final isAccepted = _isUserAccepted(agreement);
        return AgreementCheck(isSigned: isAccepted, child: child);
      },

      loading: () {
        final cached = ref.read(complianceprovider).value;
        final isAccepted = _isUserAccepted(cached);

        return AgreementCheck(isSigned: isAccepted, child: child);
      },

      error: (error, stack) {
        try {
          // Handle session expiration
          if (error.toString().contains("Unauthorized")) {
            return Expiresessionbody();
          }

          // Try to show cached data
          final cached = ref.read(complianceprovider).value;
          final isAccepted = _isUserAccepted(cached);
          if (cached?.data != null) {
            return AgreementCheck(isSigned: isAccepted, child: child);
          }

          // No cached data available
          return Builderroul(
            error: error.toString(),
            onTap:
                () => ref
                    .read(complianceprovider.notifier)
                    .refreshCompliance(context, ref),
            firstMessae: "Faile to load data",
          );
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(complianceprovider.notifier)
                    .refreshCompliance(context, ref),
            firstMessae: "Faile to load data",
          );
        }
        // Session expiration still handled
      },
    );
  }
}
