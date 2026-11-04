import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FacilitySelector extends ConsumerWidget {
  final bool? isEnable;
  const FacilitySelector(this.isEnable, {super.key});

  final List<String> allFacilities = const [
    "gym",
    "swimming_pool",
    "wifi",
    "laundry",
    "parking",
    "Main House",
  ];

  String _formatName(String input) {
    return input
        .replaceAll("_", " ")
        .split(" ")
        .map((e) => e[0].toUpperCase() + e.substring(1))
        .join(" ");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationProviders);

    final selected = state.facilityConditions?.facilities ?? [];

    return InkWell(
      onTap:
          isEnable! ? () => _openFacilityDialog(context, ref, selected) : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Facilities",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    state.facilityConditions?.facilities == null
                        ? "None selected"
                        : state.facilityConditions!.facilities!
                            .map(_formatName)
                            .join(", "),
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 14),
          ],
        ),
      ),
    );
  }

  void _openFacilityDialog(
    BuildContext context,
    WidgetRef ref,
    List<String> currentSelection,
  ) {
    final notifier = ref.read(notificationProviders.notifier);
    final selectedFacilities = [...currentSelection];

    showDialog(
      context: context,
      builder:
          (context) => StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: const Text("Select Facilities"),
                content: SingleChildScrollView(
                  child: Column(
                    children:
                        allFacilities.map((facility) {
                          final isSelected = selectedFacilities.contains(
                            facility,
                          );
                          return CheckboxListTile(
                            checkColor: AppColors.instance.teal300,
                            fillColor: WidgetStatePropertyAll(
                              AppColors.instance.teal300,
                            ),
                            title: Text(_formatName(facility)),
                            value: isSelected,
                            onChanged: (_) {
                              setState(() {
                                if (isSelected) {
                                  selectedFacilities.remove(facility);
                                } else {
                                  selectedFacilities.add(facility);
                                }
                              });
                            },
                          );
                        }).toList(),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => context.pop(),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.black300,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      notifier.updateFacilityConditions(
                        facilities: selectedFacilities,
                        timeRestrictions:
                            ref
                                .read(notificationProviders)
                                .facilityConditions
                                ?.timeRestrictions,
                      );
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.teal300,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
    );
  }
}
