import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/OTP_Activation/screen/add_permmit.dart';
import 'package:curnectgate/features/operations/OTP_Activation/widget/workPermit/permit_history.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OtpTabsPage extends StatefulWidget {
  const OtpTabsPage({super.key});

  @override
  State<OtpTabsPage> createState() => _OtpTabsPageState();
}

class _OtpTabsPageState extends State<OtpTabsPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = ["My Permits", "Permit History"];

    return Column(
      children: [
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {
              context.pop();
            },
            child: Text(
              "Close",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 14,
                color: AppColors.instance.teal400,
              ),
            ),
          ),
        ),
        SizedBox(height: 40),

        /// 🔹 Custom Tab Switcher
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: List.generate(tabs.length, (index) {
              final isSelected = _selectedIndex == index;
              return Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedIndex = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.only(left: 5, right: 5),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color:
                          isSelected
                              ? AppColors.instance.teal400
                              : Colors.transparent,
                      borderRadius:
                          index == 1
                              ? BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              )
                              : BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                    ),
                    alignment: Alignment.center,
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 250),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey.shade800,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.w500,
                        fontSize: 12.5,
                      ),
                      child: Text(tabs[index]),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),

        const SizedBox(height: 16),

        /// 🔹 Animated Content
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            transitionBuilder: (child, animation) {
              final offsetAnimation = Tween<Offset>(
                begin: const Offset(0.08, 0), // subtle slide
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOut),
              );

              return FadeTransition(
                opacity: animation,
                child: SlideTransition(position: offsetAnimation, child: child),
              );
            },
            child: _view(_selectedIndex),
          ),
        ),
      ],
    );
  }

  Widget _view(int index) {
    switch (index) {
      // case 0:
      //   return ActiveHistory(key: ValueKey('otpHistory'));
      case 0:
        return const ClearancePermitAdd(key: ValueKey('addPermit'));
      case 1:
        return const CheckInOtpTab(key: ValueKey('checkInOtp'));
      default:
        return SizedBox();
    }
  }
}

/// ✅ OTP History Tab
