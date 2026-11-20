import 'package:curnectgate/core/appErrorBody/restricted_access.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:curnectgate/features/payment/state_model/payment_model/history_model/transaction_item.dart';
import 'package:curnectgate/features/payment/widget/recipt/bottom_recipt.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class PaymentReceiptService {
  static final ScreenshotController controller = ScreenshotController();

  static Future<Uint8List?> capture() async {
    return controller.capture(delay: const Duration(milliseconds: 200));
  }

  static Future<File> generatePdf(Uint8List image) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(build: (_) => pw.Center(child: pw.Image(pw.MemoryImage(image)))),
    );

    final dir = await getTemporaryDirectory();
    final file = File(
      "${dir.path}/payment_receipt_${DateTime.now().millisecondsSinceEpoch}.pdf",
    );

    await file.writeAsBytes(await pdf.save());
    return file;
  }

  static Future<void> share(File file) async {
    await Share.shareXFiles([XFile(file.path)]);
  }
}

Future<void> showPaymentReceipt(BuildContext context, TransactionItem tx) {
  // Receipts switched off for this member by their landlord or the estate
  final restriction = RestrictedFeatures.message('view_receipts');
  if (restriction != null) {
    return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder:
          (_) => Padding(
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 36),
            child: RestrictedAccessView(message: restriction),
          ),
    );
  }

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (_) => PaymentReceiptSheet(tx: tx),
  );
}
