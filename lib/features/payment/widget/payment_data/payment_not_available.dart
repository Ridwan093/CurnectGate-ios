import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class PaymentNotConfiguredDialog extends StatefulWidget {
  const PaymentNotConfiguredDialog({super.key});

  @override
  State<PaymentNotConfiguredDialog> createState() =>
      _PaymentNotConfiguredDialogState();
}

class _PaymentNotConfiguredDialogState extends State<PaymentNotConfiguredDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;
  late Animation<double> _fadeAnim;
  late Animation<double> _iconFloat;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _iconFloat = Tween<double>(
      begin: -6,
      end: 6,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
    // _controller.repeat(reverse: true); // subtle floating effect
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return FadeTransition(
      opacity: _fadeAnim,
      child: ScaleTransition(
        scale: _scaleAnim,
        child: Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: width > 500 ? 420 : width * 0.9,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Animated Icon
                    AnimatedBuilder(
                      animation: _iconFloat,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, _iconFloat.value),
                          child: child,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.account_balance_wallet_outlined,
                          size: 40,
                          color: Colors.orange,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// Title
                    Text(
                      "Payment Unavailable",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.instance.black600,
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// Message
                    Text(
                      "Your estate administrator has not yet configured a payment method. "
                      "Payments will be available once setup is completed.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 14,
                        height: 1.5,
                        color: AppColors.instance.black400,
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// Action Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.instance.yellow500,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Got it",
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
