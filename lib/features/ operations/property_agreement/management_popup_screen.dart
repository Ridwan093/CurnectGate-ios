import 'package:curnectgate/features/%20operations/property_agreement/widget/agreement_required.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    if (!mustSign) {
      return const AgreementRequiredScreen();
    }

    return child;
  }
}
