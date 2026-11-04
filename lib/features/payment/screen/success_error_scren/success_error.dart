import 'package:confetti/confetti.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/button/estate_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentSuccessScreen extends StatefulWidget {
  final bool isFaile;
  final String error;
  const PaymentSuccessScreen({
    super.key,
    required this.isFaile,
    required this.error,
  });

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen>
    with SingleTickerProviderStateMixin {
  late ConfettiController _confettiController;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _animationController.forward();
    if (!widget.isFaile) {
      _confettiController.play();
    }
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 60),
                          ScaleTransition(
                            scale: _scaleAnimation,
                            child: FadeTransition(
                              opacity: _opacityAnimation,
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color:
                                      widget.isFaile
                                          ? AppColors.instance.error100
                                          : AppColors.instance.teal100,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  widget.isFaile
                                      ? Icons.close_rounded
                                      : Icons.check_rounded,
                                  size: 50,
                                  color:
                                      widget.isFaile
                                          ? AppColors.instance.error600
                                          : AppColors.instance.teal500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          FadeTransition(
                            opacity: _opacityAnimation,
                            child: Column(
                              children: [
                                Text(
                                  widget.isFaile
                                      ? "Payment Failed"
                                      : "Payment Successful!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: FontFamilies.interDisplay,
                                    color: AppColors.instance.black600,
                                    fontWeight: FontFamilies.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Text(
                                    widget.isFaile
                                        ? widget.error
                                        : "Your transaction has been processed successfully. A receipt has been sent to your email.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: FontFamilies.interDisplay,
                                      color: AppColors.instance.black300,
                                      fontWeight: FontFamilies.medium,
                                      fontSize: 14,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          if (!widget.isFaile)
                            FadeTransition(
                              opacity: _opacityAnimation,
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: AppColors.instance.grey200,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: AppColors.instance.grey300,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    _buildInfoRow(
                                      "Transaction ID",
                                      "#TRANS-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}",
                                    ),
                                    const Divider(height: 24),
                                    _buildInfoRow(
                                      "Status",
                                      "Completed",
                                      isStatus: true,
                                    ),
                                    const Divider(height: 24),
                                    _buildInfoRow(
                                      "Date",
                                      DateTime.now().toString().split(' ')[0],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (widget.isFaile)
                            FadeTransition(
                              opacity: _opacityAnimation,
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: AppColors.instance.error100,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: AppColors.instance.error200,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.info_outline,
                                      color: AppColors.instance.error600,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        "Please verify your connection or payment details and try again.",
                                        style: TextStyle(
                                          fontFamily: FontFamilies.interDisplay,
                                          fontSize: 12,
                                          color: AppColors.instance.error700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ActionButton(
                    label: widget.isFaile ? "Try Again" : "Back to Home",
                    onPressed: () {
                      if (widget.isFaile) {
                        context.pop();
                      } else {
                        context.goNamed(AppRoutes.dashbord);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          if (!widget.isFaile)
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: false,
                colors: [
                  AppColors.instance.teal500,
                  AppColors.instance.blue500,
                  AppColors.instance.yellow600,
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isStatus = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black400,
            fontSize: 14,
          ),
        ),
        if (isStatus)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.instance.teal100,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              value,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.teal500,
                fontWeight: FontFamilies.bold,
                fontSize: 12,
              ),
            ),
          )
        else
          Text(
            value,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontWeight: FontFamilies.bold,
              fontSize: 14,
            ),
          ),
      ],
    );
  }
}
