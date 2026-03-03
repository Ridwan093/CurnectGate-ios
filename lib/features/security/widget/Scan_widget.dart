// import 'dart:convert';
// import 'dart:developer';

// import 'package:curnectgate/core/style/colors.dart';
// import 'package:curnectgate/core/style/fontStyle.dart';
// import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
// import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
// import 'package:curnectgate/features/security/provider/scanProvider.dart';
// import 'package:curnectgate/features/security/widget/Scan_code.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// class ScanWidget extends ConsumerStatefulWidget {
//   const ScanWidget({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _ScanWidgetState();
// }

// class _ScanWidgetState extends ConsumerState<ScanWidget> {
//   late final MobileScannerController mobileScannerController;

//   @override
//   void initState() {
//     super.initState();
//     mobileScannerController = MobileScannerController(
//       torchEnabled: ref.read(torchStateProvider),
//       detectionSpeed: DetectionSpeed.normal,
//       facing: CameraFacing.back,
//     );
//   }

//   @override
//   void dispose() {
//     mobileScannerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final scanAreaSize = MediaQuery.of(context).size.width * 0.7;
//     final torchEnabled = ref.watch(torchStateProvider);

//     return Stack(
//       children: [
//         // Dark Background
//         Positioned.fill(child: Container(color: Colors.black.withOpacity(0.7))),

//         // Title Text
//         Positioned(
//           top: MediaQuery.of(context).padding.top + 20,
//           left: 0,
//           right: 0,
//           child: Text(
//             "Scan QR Code",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 16,
//               color: AppColors.instance.grey200,
//               fontFamily: FontFamilies.interDisplay,
//               fontWeight: FontFamilies.bold,
//             ),
//           ),
//         ),

//         // Scanner Container
//         Positioned(
//           top: MediaQuery.of(context).size.height * 0.3,
//           left: (MediaQuery.of(context).size.width - scanAreaSize) / 2,
//           child: SizedBox(
//             width: scanAreaSize,
//             height: scanAreaSize,
//             child: Stack(
//               children: [
//                 // Camera Preview
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: MobileScanner(
//                     controller: mobileScannerController,
//                     onDetect: (capture) {
//                       final barcode = capture.barcodes.firstOrNull;
//                       if (barcode?.rawValue != null) {
//                         final decodedString = utf8.decode(
//                           base64.decode(barcode?.rawValue ?? ""),
//                         );
//                         log('🔓 DECODED STRING: $decodedString');

//                         // 3. Parse and log JSON
//                         final jsonData = json.decode(decodedString);
//                         log('📦 JSON STRUCTURE: ${jsonData.toString()}');
//                         log('🆔 Digital ID: ${jsonData['digital_id_code']}');
//                         log('🏠 Estate ID: ${jsonData['estate_id']}');
//                         log('👤 User ID: ${jsonData['user_id']}');
//                         log('⏰ Generated At: ${jsonData['generated_at']}');
//                         ref.read(qrScanProvider.notifier).state = false;
//                         // _showScanResult(context, barcode!.rawValue!);
//                         ///hey is the place to get the scan inf
//                         ///'ormation and send it to view
//                         log(barcode?.rawValue ?? "");
//                         showUserBottomSheet(
//                           context: context,
//                           headertitle: barcode?.rawValue ?? "",
//                           headersubtitle: jsonData['type'],
//                           ref: ref,
//                           bottom: BottomSheetView.additionForScan,
//                         );
//                         // providers.scanQRCode(
//                         //   context: context,
//                         //   qrCodeData: barcode?.rawValue ?? "",
//                         //   accessType: jsonData['type'],
//                         //   location: "location",
//                         //   ref: ref,
//                         // );
//                       }
//                     },
//                   ),
//                 ),

//                 // Scanner Overlay with Animated Line
//                 ScannerOverlay(scanAreaSize: scanAreaSize),
//               ],
//             ),
//           ),
//         ),

//         // Bottom Controls
//         Positioned(
//           bottom: .10,
//           left: 0,
//           right: 0,
//           child: Column(
//             children: [
//               // Torch Button
//               IconButton(
//                 icon: Icon(
//                   torchEnabled ? Icons.flash_on : Icons.flash_off,
//                   size: 32,
//                   color: Colors.white,
//                 ),
//                 onPressed: () {
//                   ref.read(torchStateProvider.notifier).state = !torchEnabled;
//                   mobileScannerController.toggleTorch();
//                 },
//               ),
//               const SizedBox(height: 10),

//               // Enter ID Button
//               InkWell(
//                 onTap: () {
//                   mobileScannerController.dispose();
//                   ref.read(qrScanProvider.notifier).state = false;
//                   _showManualIDEntry(context);
//                 },
//                 child: Text(
//                   "Enter ID Instead",
//                   style: TextStyle(
//                     color: AppColors.instance.grey200,
//                     fontFamily: FontFamilies.interDisplay,
//                     fontWeight: FontFamilies.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//             ],
//           ),
//         ),

//         // Close Button
//         Positioned(
//           top: MediaQuery.of(context).padding.top + 16,
//           right: 16,
//           child: IconButton(
//             icon: const Icon(Icons.close, size: 32, color: Colors.white),
//             onPressed: () {
//               mobileScannerController.dispose();
//               ref.read(qrScanProvider.notifier).state = false;
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   void _showManualIDEntry(BuildContext context) {
//     showDialog(
//       context: context,
//       builder:
//           (context) => AlertDialog(
//             title: const Text("Enter ID Manually"),
//             content: TextField(
//               decoration: const InputDecoration(
//                 hintText: "Enter the ID number",
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text("Cancel"),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text("ID submitted successfully")),
//                   );
//                 },
//                 child: const Text("Submit"),
//               ),
//             ],
//           ),
//     );
//   }
// }

import 'dart:convert';
import 'dart:io';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/security/provider/formState.dart';
import 'package:curnectgate/features/security/provider/scanProvider.dart';
import 'package:curnectgate/features/security/widget/Scan_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class ScanWidget extends ConsumerStatefulWidget {
  const ScanWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScanWidgetState();
}

class _ScanWidgetState extends ConsumerState<ScanWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;

  bool _hasScanned = false;
  @override
  void initState() {
    super.initState();
    // _isFlashOn = ref.read(torchStateProvider);
  }
@override
void reassemble() {
  super.reassemble();
  if (Platform.isAndroid) {
    qrController?.pauseCamera();
  }
  qrController?.resumeCamera();
}

  @override
  void dispose() {
    // qrController?.dispose();
    super.dispose();
  }

  // void _onQRViewCreated(QRViewController controller) {
  //   setState(() {
  //     qrController = controller;
  //   });

  //   controller.scannedDataStream.listen((scanData) {
  //     final barcode = scanData.code;
  //     if (_hasScanned) return;
  //     _hasScanned = true;

  //     if (barcode == null || barcode.isEmpty) {
  //       _hasScanned = false;
  //       return;
  //     }

  //     controller.pauseCamera();
  //     try {
  //       final decodedString = utf8.decode(base64.decode(barcode));
  //       log('🔓 DECODED STRING: $decodedString');

  //       // Parse and log JSON
  //       final jsonData = json.decode(decodedString);
  //       log('📦 JSON STRUCTURE: ${jsonData.toString()}');
  //       log('🆔 Digital ID: ${jsonData['digital_id_code']}');
  //       log('🏠 Estate ID: ${jsonData['estate_id']}');
  //       log('👤 User ID: ${jsonData['user_id']}');
  //       log('⏰ Generated At: ${jsonData['generated_at']}');

  //       ref.read(qrScanProvider.notifier).state = false;

  //       log(barcode);
  //       showUserBottomSheet(
  //         context: context,
  //         headertitle: barcode,
  //         headersubtitle: jsonData['type'],
  //         ref: ref,
  //         bottom: BottomSheetView.additionForScan,
  //       );

  //       // Pause camera after successful scan to prevent multiple scans
  //       controller.pauseCamera();
  //     } catch (e) {
  //       log('Error processing QR code: $e');
  //       // Handle non-base64 QR codes or other formats
  //       ref.read(qrScanProvider.notifier).state = false;
  //       showUserBottomSheet(
  //         context: context,
  //         headertitle: barcode,
  //         headersubtitle: "Direct QR Code",
  //         ref: ref,
  //         bottom: BottomSheetView.additionForScan,
  //       );
  //       controller.pauseCamera();
  //     }
  //   });
  // }
void _onQRViewCreated(QRViewController controller) {
  if (!mounted) {
    controller.dispose();
    return;
  }

  qrController?.dispose();
  qrController = controller;

  controller.scannedDataStream.listen((scanData) {
    if (_hasScanned) return;

    final barcode = scanData.code;
    if (barcode == null || barcode.isEmpty) return;

    _hasScanned = true;
    controller.pauseCamera();

    try {
      final decodedString = utf8.decode(base64.decode(barcode));
      final jsonData = json.decode(decodedString);

      showUserBottomSheet(
        context: context,
        headertitle: barcode,
        headersubtitle: jsonData['type'],
        ref: ref,
        bottom: BottomSheetView.additionForScan,
      );
    } catch (_) {
      showUserBottomSheet(
        context: context,
        headertitle: barcode,
        headersubtitle: "Direct QR Code",
        ref: ref,
        bottom: BottomSheetView.additionForScan,
      );
    }
  });
}

  @override
  Widget build(BuildContext context) {
    final scanAreaSize = MediaQuery.of(context).size.width * 0.7;
    final torchEnabled = ref.watch(torchStateProvider);
    final notifier = ref.read(oTpformProvider.notifier);

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
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                      borderColor: Colors.white,
                      borderRadius: 12,
                      borderLength: 30,
                      borderWidth: 4,
                      cutOutSize: scanAreaSize,
                      cutOutBottomOffset: 0,
                    ),
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
                  final newState = !torchEnabled;
                  ref.read(torchStateProvider.notifier).state = newState;
                  qrController?.toggleFlash();
                },
              ),
              const SizedBox(height: 10),

              // Enter ID Button
              InkWell(
                onTap: () {
                  qrController?.pauseCamera();
                  ref.read(qrScanProvider.notifier).state = false;
                  notifier.updateValidationType("");

                  showUserBottomSheet(
                    context: context,
                    headertitle: "",
                    headersubtitle: "",
                    ref: ref,
                    bottom: BottomSheetView.validatedOTP,
                  );
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
              qrController?.pauseCamera();
              ref.read(qrScanProvider.notifier).state = false;
            },
          ),
        ),
      ],
    );
  }

}
