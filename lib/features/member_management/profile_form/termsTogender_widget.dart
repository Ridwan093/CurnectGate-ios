import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GenderAndTermsWidget extends ConsumerStatefulWidget {
  const GenderAndTermsWidget({super.key});

  @override
  ConsumerState<GenderAndTermsWidget> createState() =>
      _GenderAndTermsWidgetState();
}

class _GenderAndTermsWidgetState extends ConsumerState<GenderAndTermsWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _termsAnimController;
  late Animation<double> _scaleAnim;
  bool _isTermsPressed = false;
  bool _isLaunching = false;

  @override
  void initState() {
    super.initState();
    _termsAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 0.93).animate(
      CurvedAnimation(parent: _termsAnimController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _termsAnimController.dispose();
    super.dispose();
  }

  Future<void> _handleTermsTap() async {
    if (_isLaunching) return;

    setState(() {
      _isLaunching = true;
      _isTermsPressed = true;
    });

    // Press-down animation
    if (!mounted) return;
    await _termsAnimController.forward();
    if (!mounted) return;

    // Show a polished snackbar with loading indicator
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Opening Terms & Conditions…',
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 13,
                fontWeight: FontFamilies.medium,
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.instance.teal300,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        duration: const Duration(seconds: 2),
      ),
    );

    // Small delay so user sees the feedback
    await Future.delayed(const Duration(milliseconds: 300));
    if (!mounted) return;

    // Release animation
    await _termsAnimController.reverse();
    if (!mounted) return;

    // Launch URL
    try {
      await launchUrlString(
        'https://curnectgate.com/privacy',
        mode: LaunchMode.externalApplication,
      );
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Could not open Terms & Conditions',
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 13,
              ),
            ),
            backgroundColor: AppColors.instance.error600,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
        );
      }
    }

    if (mounted) {
      setState(() {
        _isTermsPressed = false;
        _isLaunching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  value: 'male',
                  child: Text(
                    'Male',
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black600,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'female',
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
            // Animated Checkbox
            SizedBox(
              width: 24,
              height: 24,
              child: Theme(
                data: Theme.of(
                  context,
                ).copyWith(unselectedWidgetColor: Colors.grey[400]),
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

            // Rich Text with animated clickable Terms link
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
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: ScaleTransition(
                          scale: _scaleAnim,
                          child: GestureDetector(
                            onTap: _handleTermsTap,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 2,
                                vertical: 1,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    _isTermsPressed
                                        ? AppColors.instance.teal300
                                            .withOpacity(0.1)
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'terms and conditions',
                                    style: TextStyle(
                                      fontFamily: FontFamilies.interDisplay,
                                      color: AppColors.instance.teal300,
                                      fontWeight: FontFamilies.bold,
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors
                                          .instance
                                          .teal300
                                          .withOpacity(0.4),
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(
                                    Icons.open_in_new_rounded,
                                    size: 13,
                                    color: AppColors.instance.teal300,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
