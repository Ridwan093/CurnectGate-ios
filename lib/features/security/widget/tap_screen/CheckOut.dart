import 'package:curnectgate/features/security/widget/checkIn_checkOut/widget/checkOutData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Checkouts extends ConsumerWidget {
  const Checkouts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CheckOutData();
  }
}
