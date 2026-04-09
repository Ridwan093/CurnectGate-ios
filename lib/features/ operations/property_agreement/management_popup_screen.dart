import 'package:curnectgate/features/%20operations/property_agreement/widget/agreement_required.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:curnectgate/core/local_store/User_localdata_provider.dart';
class AgreementCheck extends ConsumerWidget {
  final Widget child;
  final bool mustSign;

  const AgreementCheck({
    required this.child,
    required this.mustSign,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
      final authState = ref.watch(authProvider);

    final user = authState.user;
    final userRole = user?["role"] ?? "";
    if (!mustSign && userRole.contains("landlord")||userRole.contains("tenant")) {
      return const AgreementRequiredScreen();
    }

    return child;
  }
}
