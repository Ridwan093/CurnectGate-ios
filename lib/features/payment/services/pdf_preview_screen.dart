import 'dart:io';

import 'package:curnectgate/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfPreviewScreen extends StatefulWidget {
  final File file;

  const PdfPreviewScreen({super.key, required this.file});

  @override
  State<PdfPreviewScreen> createState() => _PdfPreviewScreenState();
}

class _PdfPreviewScreenState extends State<PdfPreviewScreen> {
  late final PdfController _pdfController;

  @override
  void initState() {
    super.initState();

    // ✅ create ONCE — not in build
    _pdfController = PdfController(
      document: PdfDocument.openFile(widget.file.path),
    );
  }

  @override
  void dispose() {
    // ✅ VERY IMPORTANT
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.grey200,
      appBar: AppBar(
        backgroundColor: AppColors.instance.grey200,
        title: const Text('Receipt Preview'),
      ),
      body: PdfView(controller: _pdfController),
    );
  }
}
