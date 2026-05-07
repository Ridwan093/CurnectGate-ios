import 'dart:developer';

import 'package:curnectgate/core/local_store/User_localdata_provider.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/services/paystack_service.dart';
import 'package:curnectgate/features/payment/state_model/fund_model.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/payment_method/payment_method_item.dart';
import 'package:curnectgate/features/payment/state_model/state.dart';
import 'package:curnectgate/features/payment/widget/buttom_sheet_widget/amout_fommat.dart';
import 'package:curnectgate/features/payment/widget/funding_row.dart';
import 'package:curnectgate/features/payment/widget/procced_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

ChargeResult calcCharge(PaymentMethodItem method, double enteredAmount) {
  final flatVal = double.tryParse(method.chargeFlat ?? '0') ?? 0.0;
  final pctVal = double.tryParse(method.chargePercentage ?? '0') ?? 0.0;

  if (flatVal != 0) {
    return ChargeResult(
      fee: flatVal,
      label: '₦${_fmt(flatVal)} flat fee',
      isPercentage: false,
      percentage: 0,
    );
  }
  if (pctVal != 0) {
    final fee = enteredAmount * (pctVal / 100);
    return ChargeResult(
      fee: fee,
      label: '${pctVal.toStringAsFixed(1)}% of amount',
      isPercentage: true,
      percentage: pctVal,
    );
  }
  return ChargeResult(
    fee: 0,
    label: 'No charge',
    isPercentage: false,
    percentage: 0,
  );
}

String _fmt(double v) => NumberFormat('#,##0.##').format(v);

// ─── Quick-amount presets ───────────────────────────────────────────────────
const _quickAmounts = [1000, 2000, 5000, 10000, 20000, 50000];

// ─────────────────────────────────────────────────────────────────────────────

class FundWalletPage extends ConsumerStatefulWidget {
  final PaymentMethodItem method;

  const FundWalletPage({super.key, required this.method});

  @override
  ConsumerState<FundWalletPage> createState() => _FundWalletPageState();
}

class _FundWalletPageState extends ConsumerState<FundWalletPage>
    with TickerProviderStateMixin {
  late final TextEditingController _ctrl;
  late final AnimationController _fadeCtrl;
  late final AnimationController _chipCtrl;
  late final AnimationController _breakdownCtrl;
  late final Animation<double> _fadeAnim;
  late final Animation<double> _chipAnim;
  late final Animation<double> _breakdownAnim;

  double _enteredAmount = 0;

  // ── lifecycle ──
  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController();

    _fadeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _chipCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _breakdownCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _fadeAnim = CurvedAnimation(parent: _fadeCtrl, curve: Curves.easeOut);
    _chipAnim = CurvedAnimation(parent: _chipCtrl, curve: Curves.easeOutBack);
    _breakdownAnim = CurvedAnimation(
      parent: _breakdownCtrl,
      curve: Curves.easeOut,
    );

    _fadeCtrl.forward();
    Future.delayed(
      const Duration(milliseconds: 200),
      () => _chipCtrl.forward(),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    _fadeCtrl.dispose();
    _chipCtrl.dispose();
    _breakdownCtrl.dispose();
    super.dispose();
  }

  // ── helpers ──
  void _setAmount(int preset) {
    final formatted = NumberFormat('#,##0').format(preset);
    _ctrl.text = formatted;
    final cleaned = formatted.replaceAll(',', '');
    ref.read(amountTextProvider.notifier).state = cleaned;
    setState(() => _enteredAmount = preset.toDouble());
    _breakdownCtrl.forward(from: 0);
  }

  void _onChanged(String value) {
    final cleaned = value.replaceAll(',', '');
    ref.read(amountTextProvider.notifier).state = cleaned;
    final parsed = double.tryParse(cleaned) ?? 0.0;
    setState(() => _enteredAmount = parsed);
    if (parsed >= 1000) {
      _breakdownCtrl.forward(from: 0);
    } else {
      _breakdownCtrl.reverse();
    }
  }

  String _generateRef(String estateName) {
    final short =
        estateName
            .replaceAll(RegExp(r'[^A-Za-z0-9]'), '')
            .substring(0, estateName.length > 3 ? 3 : estateName.length)
            .toUpperCase();
    final now = DateTime.now();
    final ts =
        '${now.year}'
        '${now.month.toString().padLeft(2, '0')}'
        '${now.day.toString().padLeft(2, '0')}'
        '${now.hour.toString().padLeft(2, '0')}'
        '${now.minute.toString().padLeft(2, '0')}'
        '${now.second.toString().padLeft(2, '0')}'
        '${now.millisecond.toString().padLeft(3, '0')}';
    return '$short-PAY-$ts';
  }

  Future<void> _proceed() async {
    final cleaned = _ctrl.text.replaceAll(',', '');
    final enteredAmount = double.parse(cleaned);

    // Calculate the fee and total
    final charge = calcCharge(widget.method, enteredAmount);
    final totalAmount = enteredAmount + charge.fee;

    final authState = ref.read(authProvider);
    final estateName = authState.user?['estate_name'] ?? '';
    final refs = _generateRef(estateName);

    log(
      '💳 Fund wallet: Subtotal: ₦$enteredAmount, Fee: ₦${charge.fee}, Total: ₦$totalAmount  ref: $refs',
    );

    await PaystackService().checkout(
      ref: ref,
      method: 'card',
      privateKey: widget.method.secretKey ?? '',
      publiceKey: widget.method.publicKey ?? '',
      context: context,
      email: authState.user?['email'] ?? '',
      amount: totalAmount, // Pass the true total (amount + fees)
      reference: refs,
    );
  }

  // ── build ──
  @override
  Widget build(BuildContext context) {
    // ── use local state for immediate button re-enable (no provider rebuild lag) ──
    final bool isValid = _enteredAmount >= 1000;
    final colors = AppColors.instance;
    final charge = calcCharge(widget.method, _enteredAmount);
    final total = _enteredAmount + charge.fee;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: colors.black600,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Fund Wallet',
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 18,
            color: colors.black600,
          ),
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: FadeTransition(
        opacity: _fadeAnim,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── method badge ──
              _MethodBadge(method: widget.method),
              const SizedBox(height: 24),

              // ── label ──
              Text(
                'Enter Amount',
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 15,
                  color: colors.black600,
                ),
              ),
              const SizedBox(height: 10),

              // ── amount input ──
              _AmountField(ctrl: _ctrl, onChanged: _onChanged),
              const SizedBox(height: 16),

              // ── quick-amount chips ──
              ScaleTransition(
                scale: _chipAnim,
                child: _QuickAmountRow(onTap: _setAmount),
              ),
              const SizedBox(height: 20),

              // ── charge breakdown ──
              SizeTransition(
                sizeFactor: _breakdownAnim,
                child: FadeTransition(
                  opacity: _breakdownAnim,
                  child: _BreakdownCard(
                    enteredAmount: _enteredAmount,
                    charge: charge,
                    total: total,
                    currency: widget.method.currency ?? 'NGN',
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // ── minimum hint ──
              if (_enteredAmount > 0 && _enteredAmount < 1000)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        size: 14,
                        color: colors.error600,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Minimum amount is ₦1,000',
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontSize: 12,
                          color: colors.error600,
                        ),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 16),

              // ── proceed button ──
              ProceedButton(isValid: isValid, onTap: _proceed),
              const SizedBox(height: 20),

              // ── security note ──
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock_outline_rounded,
                      size: 13,
                      color: colors.black300,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Secured by Paystack · 256-bit SSL',
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 12,
                        color: colors.black300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Sub-widgets ─────────────────────────────────────────────────────────────

class _MethodBadge extends StatelessWidget {
  final PaymentMethodItem method;
  const _MethodBadge({required this.method});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.instance;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: colors.yellow100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.yellow400),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colors.yellow500,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.account_balance_wallet_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  method.name ?? 'Payment Gateway',
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontFamilies.bold,
                    fontSize: 13,
                    color: colors.black600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  method.description ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 11,
                    color: colors.black400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: colors.teal100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              method.environment?.toUpperCase() ?? 'LIVE',
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                fontSize: 10,
                color: colors.teal500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AmountField extends StatelessWidget {
  final TextEditingController ctrl;
  final ValueChanged<String> onChanged;
  const _AmountField({required this.ctrl, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.instance;
    return TextField(
      controller: ctrl,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CurrencyInputFormatter(),
      ],
      style: TextStyle(
        fontFamily: FontFamilies.interDisplay,
        fontSize: 24,
        fontWeight: FontFamilies.bold,
        color: colors.black600,
        letterSpacing: 0.5,
      ),
      decoration: InputDecoration(
        prefixText: ctrl.text.isNotEmpty ? '₦ ' : null,
        prefixStyle: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          fontSize: 24,
          fontWeight: FontFamilies.bold,
          color: colors.black600,
        ),
        hintText: '₦ 0',
        hintStyle: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          fontSize: 24,
          fontWeight: FontFamilies.bold,
          color: colors.black200,
        ),
        helperText: 'Minimum ₦1,000',
        helperStyle: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          fontSize: 12,
          color: colors.black300,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colors.yellow500, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colors.grey400),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colors.error600),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colors.error600, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
      ),
      onChanged: onChanged,
    );
  }
}

class _QuickAmountRow extends StatelessWidget {
  final ValueChanged<int> onTap;
  const _QuickAmountRow({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children:
          _quickAmounts.map((amt) {
            return _QuickChip(
              label: '₦${NumberFormat('#,##0').format(amt)}',
              onTap: () => onTap(amt),
            );
          }).toList(),
    );
  }
}

class _QuickChip extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _QuickChip({required this.label, required this.onTap});

  @override
  State<_QuickChip> createState() => _QuickChipState();
}

class _QuickChipState extends State<_QuickChip>
    with SingleTickerProviderStateMixin {
  late final AnimationController _press;

  @override
  void initState() {
    super.initState();
    _press = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0,
      upperBound: 0.03,
    );
  }

  @override
  void dispose() {
    _press.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.instance;
    return GestureDetector(
      onTapDown: (_) => _press.forward(),
      onTapUp: (_) {
        _press.reverse();
        widget.onTap();
      },
      onTapCancel: () => _press.reverse(),
      child: AnimatedBuilder(
        animation: _press,
        builder:
            (context, child) =>
                Transform.scale(scale: 1 - _press.value, child: child),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: colors.yellow100,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: colors.yellow400),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.medium,
              fontSize: 13,
              color: colors.yellow600,
            ),
          ),
        ),
      ),
    );
  }
}

class _BreakdownCard extends StatelessWidget {
  final double enteredAmount;
  final ChargeResult charge;
  final double total;
  final String currency;

  const _BreakdownCard({
    required this.enteredAmount,
    required this.charge,
    required this.total,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.instance;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.grey200,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colors.grey400),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Summary',
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              fontSize: 13,
              color: colors.black600,
            ),
          ),
          const SizedBox(height: 12),
          Rows(label: 'You enter', value: '₦${_fmt(enteredAmount)}'),
          const SizedBox(height: 8),
          Rows(
            label: 'Estate fee (${charge.label})',
            value: charge.fee > 0 ? '+ ₦${_fmt(charge.fee)}' : 'Free',
            valueColor: charge.fee > 0 ? colors.error700 : colors.teal500,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Divider(color: colors.grey400, thickness: 1),
          ),
          Rows(
            label: 'Total charged',
            value: '₦${_fmt(total)}',
            bold: true,
            valueColor: colors.black600,
          ),
        ],
      ),
    );
  }
}
