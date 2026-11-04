import 'package:curnectgate/core/local_store/User_localdata_provider.dart';
import 'package:curnectgate/features/%20operations/property_agreement/widget/agreement_required.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgreementCheck extends ConsumerWidget {
  final Widget child;
  final bool isSigned;

  const AgreementCheck({
    required this.child,
    required this.isSigned,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    final user = authState.user;
    final userRole = (user?["role"] ?? "").toString().toLowerCase();

    if (!isSigned &&
        (userRole.contains("landlord") || userRole.contains("tenant"))) {
      return const AgreementRequiredScreen();
    }

    return child;
  }
}
