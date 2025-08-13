import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/OTP_Activation/provider/active_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for managing the additional info state

class VisitorInfoSection extends ConsumerStatefulWidget {
  final Function(String)? onChanged1;
  final Function(String)? onChanged2;

  const VisitorInfoSection({super.key, this.onChanged1, this.onChanged2});

  @override
  ConsumerState<VisitorInfoSection> createState() => _VisitorInfoSectionState();
}

class _VisitorInfoSectionState extends ConsumerState<VisitorInfoSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showAdditionalFields = ref.watch(additionalInfoProvider);

    // Sync animation with provider state
    if (showAdditionalFields) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    return Column(
      children: [
        InkWell(
          onTap: () => ref.read(additionalInfoProvider.notifier).toggle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Additional  Info',

                style: TextStyle(
                  fontWeight: FontFamilies.medium,
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black400,

                  fontSize: 14,
                ),
              ),
              IconButton(
                onPressed:
                    () => ref.read(additionalInfoProvider.notifier).toggle(),
                icon:
                    !showAdditionalFields
                        ? Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.instance.black600,
                        )
                        : Icon(Icons.close, color: AppColors.instance.black600),
              ),
            ],
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child:
              showAdditionalFields
                  ? Column(
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    fontFamily: FontFamilies.interDisplay,
                                    color: AppColors.instance.black600,
                                  ),
                                  labelText: 'Vehicle number',

                                  hintText: "ABC-1234",
                                  hintStyle: TextStyle(
                                    fontFamily: FontFamilies.interDisplay,
                                    color: AppColors.instance.black300,
                                    fontSize: 13,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.instance.black300,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.instance.black300,
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  widget.onChanged1!(value);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.numberWithOptions(),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.instance.black300,
                                  ),
                                ),
                                hintText: "+234-8984738",
                                hintStyle: TextStyle(
                                  fontFamily: FontFamilies.interDisplay,
                                  color: AppColors.instance.black300,
                                  fontSize: 13,
                                ),
                                labelText: 'Phone number',
                                counterText: '',
                                labelStyle: TextStyle(
                                  fontFamily: FontFamilies.interDisplay,
                                  color: AppColors.instance.black600,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.instance.black300,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                widget.onChanged2!(value);
                              },
                              maxLength: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                  : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
