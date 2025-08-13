import 'dart:developer';

import 'package:curnectgate/features/member_management/Onboard_Houselod/model/property_model/property.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/property_model/property_data.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/operations/violation/widget/category_dropdwon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PropertyDropdown extends ConsumerWidget {
  final String? currentValue;
  final PropertyData data;

  const PropertyDropdown({
    super.key,
    required this.currentValue,
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Filter out null categories and IDs
    // ignore: unnecessary_null_comparison
    final property = data.properties.where((c) => c.id != null).toList();

    // Find the selected category (using our extension method)

    return CustomDropdown<Property>(
      items: property,
      value: currentValue ?? "",
      itemText: (propertys) => propertys.propertyName,
      onChanged: (property) {
        if (property != null) {
          log(property.propertyName);
          ref
              .read(formProvider.notifier)
              .setProperty(
                property.propertyName.toString(),
                property.id.toString(),
              );
        }
      },
      hint: 'Select property',
      label: 'Property',
    );
  }
}
