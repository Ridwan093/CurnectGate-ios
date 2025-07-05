import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenderAndTermsWidget extends ConsumerWidget {
  const GenderAndTermsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(formProvider);
    final formNotifier = ref.read(formProvider.notifier);

    return Column(
      children: [
        // Gender Dropdown
        InputDecorator(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.instance.black400),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.instance.black400),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.instance.error600),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.instance.error600),
            ),
            labelText: 'Gender',
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 5,
            ),
            labelStyle: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black300,
              fontSize: 13,
            ),
            errorStyle: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.error600,
              fontSize: 12,
            ),
            hintStyle: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black300,
              fontSize: 13,
            ),
            errorText:
                formState.gender == null ? 'Please select a gender' : null,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String?>(
              icon: Icon(Icons.keyboard_arrow_down),
              value: formState.gender,
              isExpanded: true,
              items: [
                DropdownMenuItem(
                  value: null,
                  child: Text(
                    'Select Gender',
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.teal400,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'Male',
                  child: Text(
                    'Male',
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black600,
                    ),
                  ),
                ),

                DropdownMenuItem(
                  value: 'Female',
                  child: Text(
                    'Female',
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black600,
                    ),
                  ),
                ),
              ],
              onChanged: (value) => formNotifier.updateGender(value!),
            ),
          ),
        ),

        const SizedBox(height: 20),

        // Terms Checkbox
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Professional Checkbox with Animation
            SizedBox(
              width: 24,
              height: 24,
              child: Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor:
                      Colors.grey[400], // Unchecked border color
                ),
                child: Checkbox(
                  value: formState.agreedToTerms,
                  onChanged:
                      (value) => formNotifier.updateAgreement(value ?? false),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: BorderSide(
                    width: 1.5,
                    color:
                        formState.agreedToTerms
                            ? AppColors.instance.teal300
                            : Colors.grey[400]!,
                  ),
                  fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                    if (states.contains(WidgetState.selected)) {
                      return AppColors.instance.teal300;
                    }
                    return Colors.transparent;
                  }),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Rich Text with Clickable Terms
            Expanded(
              child: GestureDetector(
                onTap:
                    () =>
                        formNotifier.updateAgreement(!formState.agreedToTerms),
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 14, height: 1.4),
                    children: [
                      TextSpan(
                        text: 'I agree to the ',
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          color: AppColors.instance.black600,
                        ),
                      ),
                      TextSpan(
                        text: 'terms and conditions',
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          color: AppColors.instance.teal300,
                          fontWeight: FontFamilies.bold,
                          // decoration: TextDecoration.lineThrough,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                // Open terms dialog
                              },
                      ),
                      TextSpan(
                        text: ' *',
                        style: TextStyle(
                          color: AppColors.instance.error600,
                          fontFamily: FontFamilies.interDisplay,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
