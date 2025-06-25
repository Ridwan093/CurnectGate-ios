import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/core/widgets/GetYourCode.dart';
import 'package:curnectgate/features/%20operations/OTP_Activation/provider/active_provider.dart';
import 'package:curnectgate/features/%20operations/OTP_Activation/widget/validity_period_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenerateOTPWithValidity extends ConsumerWidget {
  const GenerateOTPWithValidity({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activation = ref.watch(generateNotifierProvider);

    final isLoading = activation.isLoading;
    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 0,
        right: 0,
        top: 0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 20),

          // 2. Description field (no Expanded!)
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Visitor Name',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.instance.black500),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.instance.black500),
              ),
              labelStyle: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black500,
              ),
            ),

            onChanged:
                (value) => ref
                    .read(generateNotifierProvider.notifier)
                    .setVisitorName(value),
          ),
          const SizedBox(height: 20),
          // 1. Category dropdown (no Expanded!)
          _buildCategoryDropdown(ref, activation.purposeofVisit),
          const SizedBox(height: 25),
          ValidityPickerTile(
            selectedValue: activation.visitperiod,

            onChanged:
                (value) => ref
                    .read(generateNotifierProvider.notifier)
                    .setPeriod(value),
          ),
          const SizedBox(height: 25),

          // 4. Submit button
          _buildSubmitButton(
            size: size,
            isLoading: isLoading,
            ref: ref,
            context: context,
          ),
        ],
      ),
    );
  }

  // [Keep all your helper methods unchanged]
  // _buildanonymousHide, _buildSubmitButton, etc.
}

Widget _buildSubmitButton({
  required Size size,
  required bool isLoading,
  required WidgetRef ref,
  required BuildContext context,
}) {
  return InkWell(
    onTap: isLoading ? null : () => _submit(ref, context),
    child: Container(
      height: 50,
      width: size.width,
      decoration: BoxDecoration(
        color: AppColors.instance.black600,

        borderRadius: BorderRadius.circular(10),
      ),

      child: Center(
        child:
            !isLoading
                ? Text(
                  "Generate OTP",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 15,
                    fontWeight: FontFamilies.medium,
                    color: AppColors.instance.grey200,
                  ),
                )
                : CircularProgressIndicator(),
      ),
    ),
  );
}

Widget _buildCategoryDropdown(WidgetRef ref, String currentValue) {
  final purpose = {
    'Gust Visit': 'Vehicle parked in no-parking zone',
    'work order': 'Vehicle moving against traffic',
    'Delivery': 'Vehicle exceeding speed limit',
    'Other': 'Other traffic violation',
  };

  return SizedBox(
    child: DropdownButtonFormField<String>(
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: AppColors.instance.black600,
      ),
      value: currentValue.isEmpty ? null : currentValue,
      decoration: InputDecoration(
        labelText: 'Purpose of Visit',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.instance.black500),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.instance.black500),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.instance.black500),
        ),
        labelStyle: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: AppColors.instance.black500,
        ),
      ),
      items:
          purpose.entries.map((entry) {
            return DropdownMenuItem(
              value: entry.key,
              child: Text(
                entry.key,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                ),
              ),
            );
          }).toList(),
      onChanged:
          (value) =>
              ref.read(generateNotifierProvider.notifier).setPurpose(value!),
    ),
  );
}

Future<void> _submit(WidgetRef ref, BuildContext context) async {
  final visitor = ref.read(generateNotifierProvider);
  final visitors = ref.read(generateNotifierProvider.notifier);

  if (visitor.purposeofVisit.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please select a report category')),
    );

    return;
  }

  if (visitor.vistorName.isEmpty) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Please enter a description')));
    return;
  }

  try {
    visitors.submit();
    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => GetYourCodeScreen(
              title: "Your visitor access code: ",
              accessCode: "3456GAT",
              share: "Here's my vistor access code:",
            ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Report submitted successfully!')),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to submit report: ${e.toString()}')),
    );
  }
}
