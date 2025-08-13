import 'package:curnectgate/core/style/colors.dart';
import 'package:flutter/material.dart';

class OldSchoolSwitch extends StatelessWidget {
  final bool value;
  final bool isLoading;
  final ValueChanged<bool> onChanged;

  const OldSchoolSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoading, // Prevent interaction while loading
      child: GestureDetector(
        onTap: () => onChanged(!value), // Send new value to parent
        child: SizedBox(
          width: 53,
          height: 48,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Thin Track
              Positioned.fill(
                top: 14,
                bottom: 14,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: value ? Colors.black : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              // Thumb
              AnimatedAlign(
                duration: Duration(milliseconds: 200),
                alignment: value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child:
                      isLoading
                          ? Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation(
                                AppColors.instance.yellow500,
                              ),
                            ),
                          )
                          : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
