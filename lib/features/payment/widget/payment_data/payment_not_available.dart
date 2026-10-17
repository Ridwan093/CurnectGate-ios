import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

// ─── Existing dialog (kept as-is) ────────────────────────────────────────────
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
    _scaleAnim =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _iconFloat = Tween<double>(begin: -6, end: 6).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: width > 500 ? 420 : width * 0.9),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedBuilder(
                      animation: _iconFloat,
                      builder: (context, child) => Transform.translate(
                        offset: Offset(0, _iconFloat.value),
                        child: child,
                      ),
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

// ─── NEW: Payment Misconfigured Dialog ───────────────────────────────────────
/// Shown when key(s) exist but are incomplete/broken (e.g. secretKey missing).
/// Tells the user to contact their estate admin to reconfigure payment.
class PaymentMisconfiguredDialog extends StatefulWidget {
  const PaymentMisconfiguredDialog({super.key});

  @override
  State<PaymentMisconfiguredDialog> createState() =>
      _PaymentMisconfiguredDialogState();
}

class _PaymentMisconfiguredDialogState
    extends State<PaymentMisconfiguredDialog>
    with TickerProviderStateMixin {
  late final AnimationController _entryCtrl;
  late final AnimationController _pulseCtrl;
  late final Animation<double> _scaleAnim;
  late final Animation<double> _fadeAnim;
  late final Animation<double> _pulseAnim;

  @override
  void initState() {
    super.initState();

    _entryCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550),
    );
    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _scaleAnim =
        CurvedAnimation(parent: _entryCtrl, curve: Curves.easeOutBack);
    _fadeAnim = CurvedAnimation(parent: _entryCtrl, curve: Curves.easeOut);
    _pulseAnim = Tween<double>(begin: 0.92, end: 1.0).animate(
      CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut),
    );

    _entryCtrl.forward();
  }

  @override
  void dispose() {
    _entryCtrl.dispose();
    _pulseCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.instance;
    final width = MediaQuery.of(context).size.width;

    return FadeTransition(
      opacity: _fadeAnim,
      child: ScaleTransition(
        scale: _scaleAnim,
        child: Dialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: width > 500 ? 420 : width * 0.9),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ── Pulsing warning icon ──
                  ScaleTransition(
                    scale: _pulseAnim,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            colors.error200,
                            colors.error100,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: colors.error400.withOpacity(0.35),
                            blurRadius: 20,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.settings_outlined,
                        size: 38,
                        color: colors.error600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),

                  // ── Badge ──
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: colors.error100,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: colors.error300),
                    ),
                    child: Text(
                      'CONFIGURATION ISSUE',
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                        color: colors.error600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ── Title ──
                  Text(
                    'Payment Not Configured',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: colors.black600,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // ── Subtitle ──
                  Text(
                    'Your estate\'s payment gateway is incomplete. '
                    'Please reach out to your estate administrator to '
                    'complete the payment configuration.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 13,
                      height: 1.6,
                      color: colors.black400,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // ── Info tile ──
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: colors.grey200,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: colors.grey400),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          size: 16,
                          color: colors.black400,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Ask your estate admin to complete the payment setup in the admin settings.',
                            style: TextStyle(
                              fontFamily: FontFamilies.interDisplay,
                              fontSize: 12,
                              height: 1.5,
                              color: colors.black400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 26),

                  // ── Button ──
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors.black600,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Understood',
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.white,
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
    );
  }
}

// ─── NEW: Payment Not Available Dialog ───────────────────────────────────────
/// Shown when BOTH publicKey and secretKey are empty.
/// Means this user/estate has no payment setup at all — no wallet access.
class PaymentNotAvailableDialog extends StatefulWidget {
  const PaymentNotAvailableDialog({super.key});

  @override
  State<PaymentNotAvailableDialog> createState() =>
      _PaymentNotAvailableDialogState();
}

class _PaymentNotAvailableDialogState extends State<PaymentNotAvailableDialog>
    with TickerProviderStateMixin {
  late final AnimationController _entryCtrl;
  late final AnimationController _floatCtrl;
  late final Animation<double> _scaleAnim;
  late final Animation<double> _fadeAnim;
  late final Animation<double> _floatAnim;

  @override
  void initState() {
    super.initState();

    _entryCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _floatCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _scaleAnim =
        CurvedAnimation(parent: _entryCtrl, curve: Curves.easeOutBack);
    _fadeAnim = CurvedAnimation(parent: _entryCtrl, curve: Curves.easeOut);
    _floatAnim = Tween<double>(begin: -7, end: 7).animate(
      CurvedAnimation(parent: _floatCtrl, curve: Curves.easeInOut),
    );

    _entryCtrl.forward();
  }

  @override
  void dispose() {
    _entryCtrl.dispose();
    _floatCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.instance;
    final width = MediaQuery.of(context).size.width;

    return FadeTransition(
      opacity: _fadeAnim,
      child: ScaleTransition(
        scale: _scaleAnim,
        child: Dialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: width > 500 ? 420 : width * 0.9),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ── Floating lock icon with gradient bg ──
                  AnimatedBuilder(
                    animation: _floatAnim,
                    builder: (_, child) => Transform.translate(
                      offset: Offset(0, _floatAnim.value),
                      child: child,
                    ),
                    child: Container(
                      width: 82,
                      height: 82,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            colors.black500,
                            colors.black600,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: colors.black600.withOpacity(0.25),
                            blurRadius: 24,
                            spreadRadius: 2,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.lock_outline_rounded,
                        size: 38,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ── Badge ──
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: colors.yellow300,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: colors.yellow400),
                    ),
                    child: Text(
                      'ACCESS RESTRICTED',
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                        color: colors.yellow600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ── Title ──
                  Text(
                    'Wallet Funding Unavailable',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: colors.black600,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // ── Subtitle ──
                  Text(
                    'Your landlord has not enabled wallet funding. '
                    'Contact your landlord to get '
                    'payment access activated for your account.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 13,
                      height: 1.6,
                      color: colors.black400,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ── Steps hint ──
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: colors.yellow100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: colors.yellow400),
                    ),
                    child: Column(
                      children: [
                        _HintRow(
                          icon: Icons.email_outlined,
                          text: 'Contact your estate admin',
                          colors: colors,
                        ),
                        const SizedBox(height: 8),
                        _HintRow(
                          icon: Icons.tune_rounded,
                          text: 'Request payment setup activation',
                          colors: colors,
                        ),
                        const SizedBox(height: 8),
                        _HintRow(
                          icon: Icons.check_circle_outline_rounded,
                          text: 'Try again once enabled',
                          colors: colors,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 26),

                  // ── Button ──
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors.yellow500,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Got it',
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: colors.black600,
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
    );
  }
}

class _HintRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final AppColors colors;
  const _HintRow({
    required this.icon,
    required this.text,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 15, color: colors.yellow600),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              height: 1.4,
              color: colors.black500,
            ),
          ),
        ),
      ],
    );
  }
}
