import 'package:curnectgate/features/operations/OTP_Activation/provider/permitSearch_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PermitSearchField extends ConsumerWidget {
  PermitSearchField({super.key});

  final _contrroler = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(permitSearchProvider.notifier);
    final query = ref.watch(permitSearchProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, size: 20),

          const SizedBox(width: 8),

          Expanded(
            child: TextField(
              controller: _contrroler,
              onChanged: notifier.updateQuery,
              decoration: const InputDecoration(
                hintText: 'Search permits...',
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),

          if (query.isNotEmpty)
            GestureDetector(
              onTap: () {
                notifier.clear();
                _contrroler.clear();
              },
              child: const Icon(Icons.close, size: 18),
            ),
        ],
      ),
    );
  }
}
