import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomValidity extends ConsumerWidget {
  final Function(String) onChanged;
  CustomValidity({super.key, required this.onChanged});
  final allHours = List.generate(24, (i) => '${i + 1} hrs');
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FractionallySizedBox(
      heightFactor: 0.6,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Select Validity Period',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const Divider(height: 0),
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: allHours.length,
              separatorBuilder: (_, __) => const Divider(height: 0),
              itemBuilder: (_, index) {
                final hour = allHours[index];
                return ListTile(
                  title: Text(hour),
                  onTap: () {
                    // ref.read(bottomSheetStateProvider.notifier).state =
                    //     BottomSheetView.generateOtpwithperiod;

                    onChanged(hour);
                    context.pop();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
