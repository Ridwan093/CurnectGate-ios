import 'dart:developer';

import 'package:curnectgate/features/estate_management/submit_works_order/model/workOrder_categor/work_order_category.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/workOrder_categor/work_order_category_data.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_provider/workformprovider.dart';
import 'package:curnectgate/features/operations/violation/widget/category_dropdwon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropDownWorkOoder extends ConsumerWidget {
  final String? currentValue;
  final WorkOrderCategoryData data;

  const DropDownWorkOoder({
    super.key,
    required this.currentValue,
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Filter out null categories and IDs
    // ignore: unnecessary_null_comparison
    final property = data.categories?.where((c) => c.id != null).toList();

    // Find the selected category (using our extension method)

    return CustomDropdown<WorkOrderCategory>(
      items: property ?? [],
      value: currentValue ?? "",
      itemText: (propertys) => propertys.name ?? "",
      onChanged: (property) {
        if (property != null) {
          log(property.name.toString());
          ref
              .read(workOrderFormProvider.notifier)
              .updateWorkType(property.name.toString(), property.id ?? 0);
        }
      },
      hint: 'Select Work type',
      label: 'Work Type',
    );
  }
}
