import 'dart:convert';
import 'dart:developer';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/security/provider/scanProvider.dart';
import 'package:curnectgate/features/security/widget/Scan_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanWidget extends ConsumerStatefulWidget {
  const ScanWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScanWidgetState();
}

class _ScanWidgetState extends ConsumerState<ScanWidget> {
  late final MobileScannerController mobileScannerController;

  @override
  void initState() {
    super.initState();
    mobileScannerController = MobileScannerController(
      torchEnabled: ref.read(torchStateProvider),
      detectionSpeed: DetectionSpeed.normal,
      facing: CameraFacing.back,
    );
  }

  @override
  void dispose() {
    mobileScannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scanAreaSize = MediaQuery.of(context).size.width * 0.7;
    final torchEnabled = ref.watch(torchStateProvider);

    // final mobileScannerController = MobileScannerController(
    //   torchEnabled: torchEnabled,
    //   detectionSpeed: DetectionSpeed.normal,
    //   facing: CameraFacing.back,
    // );
    // Scanner Overlay Widget

    return Stack(
      children: [
        // Dark Background
        Positioned.fill(child: Container(color: Colors.black.withOpacity(0.7))),

        // Title Text
        Positioned(
          top: MediaQuery.of(context).padding.top + 20,
          left: 0,
          right: 0,
          child: Text(
            "Scan QR Code",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.instance.grey200,
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
            ),
          ),
        ),

        // Scanner Container
        Positioned(
          top: MediaQuery.of(context).size.height * 0.3,
          left: (MediaQuery.of(context).size.width - scanAreaSize) / 2,
          child: SizedBox(
            width: scanAreaSize,
            height: scanAreaSize,
            child: Stack(
              children: [
                // Camera Preview
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: MobileScanner(
                    controller: mobileScannerController,
                    onDetect: (capture) {
                      final barcode = capture.barcodes.firstOrNull;
                      if (barcode?.rawValue != null) {
                        // ref.read(qrScanProvider.notifier).state = false;
                        // _showScanResult(context, barcode!.rawValue!);
                        ///hey is the place to get the scan inf
                        ///'ormation and send it to view
                        log(barcode?.rawValue ?? "");
                        showUserBottomSheet(
                          context: context,
                          headertitle: barcode?.rawValue ?? "",
                          headersubtitle: barcode?.type.name ?? "",
                          ref: ref,
                          bottom: BottomSheetView.confirmEntry,
                        );
                        try {
                          // 1. Log raw QR data
                          debugPrint('🎯 RAW QR DATA: ${barcode!.rawValue!}');

                          // 2. Decode and log base64
                          final decodedString = utf8.decode(
                            base64.decode(barcode.rawValue!),
                          );
                          debugPrint('🔓 DECODED STRING: $decodedString');

                          // 3. Parse and log JSON
                          final jsonData = json.decode(decodedString);
                          debugPrint(
                            '📦 JSON STRUCTURE: ${jsonData.toString()}',
                          );
                          debugPrint(
                            '🆔 Digital ID: ${jsonData['digital_id_code']}',
                          );
                          debugPrint('🏠 Estate ID: ${jsonData['estate_id']}');
                          debugPrint('👤 User ID: ${jsonData['user_id']}');
                          debugPrint(
                            '⏰ Generated At: ${jsonData['generated_at']}',
                          );

                          // 4. Convert timestamp to readable date
                          final date = DateTime.fromMillisecondsSinceEpoch(
                            jsonData['generated_at'] * 1000,
                          );
                          debugPrint(
                            '📅 Generated Date: ${date.toIso8601String()}',
                          );

                          // 5. Verify data completeness
                          if (jsonData['type'] == null) {
                            debugPrint('⚠️ Missing type field in QR data');
                          }

                          // 6. Pretty-print the full structure
                          final prettyString = JsonEncoder.withIndent(
                            '  ',
                          ).convert(jsonData);
                          debugPrint(
                            '🌈 FULL QR DATA STRUCTURE:\n$prettyString',
                          );

                          // Continue with your API call...
                        } catch (e) {
                          debugPrint('❌ DECODING ERROR: ${e.toString()}');
                         
                        }
                      }
                    },
                  ),
                ),

                // Scanner Overlay with Animated Line
                ScannerOverlay(scanAreaSize: scanAreaSize),
              ],
            ),
          ),
        ),

        // Bottom Controls
        Positioned(
          bottom: .10,
          left: 0,
          right: 0,
          child: Column(
            children: [
              // Torch Button
              IconButton(
                icon: Icon(
                  torchEnabled ? Icons.flash_on : Icons.flash_off,
                  size: 32,
                  color: Colors.white,
                ),
                onPressed: () {
                  ref.read(torchStateProvider.notifier).state = !torchEnabled;
                  mobileScannerController.toggleTorch();
                },
              ),
              const SizedBox(height: 10),

              // Enter ID Button
              InkWell(
                onTap: () {
                  mobileScannerController.dispose();
                  ref.read(qrScanProvider.notifier).state = false;
                  _showManualIDEntry(context);
                },
                child: Text(
                  "Enter ID Instead",
                  style: TextStyle(
                    color: AppColors.instance.grey200,
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontFamilies.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),

        // Close Button
        Positioned(
          top: MediaQuery.of(context).padding.top + 16,
          right: 16,
          child: IconButton(
            icon: const Icon(Icons.close, size: 32, color: Colors.white),
            onPressed: () {
              mobileScannerController.dispose();
              ref.read(qrScanProvider.notifier).state = false;
            },
          ),
        ),
      ],
    );
  }

  void _showManualIDEntry(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Enter ID Manually"),
            content: TextField(
              decoration: const InputDecoration(
                hintText: "Enter the ID number",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("ID submitted successfully")),
                  );
                },
                child: const Text("Submit"),
              ),
            ],
          ),
    );
  }
}
