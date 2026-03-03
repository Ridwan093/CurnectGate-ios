import 'package:confetti/confetti.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/services/recipt_service.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/history_model/transaction_item.dart';
import 'package:curnectgate/features/payment/widget/recipt/recip_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:screenshot/screenshot.dart';

class PaymentReceiptSheet extends StatefulWidget {
  final TransactionItem tx;

  const PaymentReceiptSheet({super.key, required this.tx});

  @override
  State<PaymentReceiptSheet> createState() => _PaymentReceiptSheetState();
}

class _PaymentReceiptSheetState extends State<PaymentReceiptSheet> {
  final ConfettiController _confetti = ConfettiController(
    duration: const Duration(seconds: 2),
  );

  bool loading = false;

  @override
  void initState() {
    super.initState();
    _confetti.play();
  }

  @override
  void dispose() {
    _confetti.dispose();
    super.dispose();
  }

  Future<void> _preview() async {
    setState(() => loading = true);

    try {
      final img = await PaymentReceiptService.capture();
      if (img == null) return;

      final pdf = await PaymentReceiptService.generatePdf(img);

      if (mounted) {
        context.pushNamed(AppRoutes.recipPreview, extra: {"file": pdf.path});
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (_) => PdfPreviewScreen(file: pdf)),
        // );
      }
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  Future<void> _share() async {
    setState(() => loading = true);

    try {
      final img = await PaymentReceiptService.capture();
      if (img == null) return;

      final pdf = await PaymentReceiptService.generatePdf(img);
      await PaymentReceiptService.share(pdf);
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Screenshot(
                    controller: PaymentReceiptService.controller,
                    child: PaymentReceiptCard(tx: widget.tx),
                  ),

                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: loading ? null : _preview,
                          child: Text(
                            "Preview PDF",
                            style: TextStyle(
                              fontFamily: FontFamilies.interDisplay,
                              // fontWeight: FontFamilies.bold,
                              color: AppColors.instance.black600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: loading ? null : _share,
                          child:
                              loading
                                  ? SizedBox(
                                    height: 18,
                                    width: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: AppColors.instance.yellow500,
                                    ),
                                  )
                                  : Text(
                                    "Share",
                                    style: TextStyle(
                                      fontFamily: FontFamilies.interDisplay,
                                      // fontWeight: FontFamilies.bold,
                                      color: AppColors.instance.teal300,
                                    ),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          ConfettiWidget(
            confettiController: _confetti,
            blastDirectionality: BlastDirectionality.explosive,
          ),
        ],
      ),
    );
  }
}
