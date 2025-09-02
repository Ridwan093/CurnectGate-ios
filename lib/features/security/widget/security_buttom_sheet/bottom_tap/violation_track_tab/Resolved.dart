import 'package:curnectgate/features/security/widget/security_buttom_sheet/bottom_tap/violation_track_tab/widget/resolvedData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Resolved extends ConsumerStatefulWidget {
  const Resolved({super.key});

  @override
  ConsumerState<Resolved> createState() => _InvestigationState();
}

class _InvestigationState extends ConsumerState<Resolved> {
  @override
  Widget build(BuildContext context) {
    return ResolvedData();
  }
}
