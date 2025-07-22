import 'dart:developer';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/violation/report_provider/report_provider.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ReportFileUplode extends ConsumerWidget {
  final String title;
  final String subtitle;

  const ReportFileUplode({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        key: const ValueKey('userDetails'),
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header section
          Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 20,
                  color: AppColors.instance.black600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 12,
                  color: AppColors.instance.black300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          _buildthirdaryOptionTile(
            context: context,
            onTap: () async {
              final index = ref.read(currentEditingIndexProvider);
              if (index != null) {
                final image = await ImagePicker().pickImage(
                  source: ImageSource.camera,
                );
      
                if (image != null) {
                  ref.read(reportProvider.notifier).addImage(image.path, index);
                  ref.read(bottomSheetStateProvider.notifier).state =
                      BottomSheetView.userDetails;
                }
              }
            },
            title: "Take Photo",
            leadingicon: AssetPaths.takephoto,
          ),
          // Primary option tile
          const SizedBox(height: 5),
          _buildthirdaryOptionTile(
            context: context,
            onTap: () async {
              final index = ref.read(currentEditingIndexProvider);
              log(index.toString());
              if (index != null) {
                final image = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );
                if (image != null) {
                  log(image.path.toString());
                  ref.read(reportProvider.notifier).addImage(image.path, index);
                  ref.read(bottomSheetStateProvider.notifier).state =
                      BottomSheetView.userDetails;
                }
              }
            },
            title: "Choose from Gallery",
            leadingicon: AssetPaths.choosfromgallery,
          ),
          // Secondary option tile
          const SizedBox(height: 5),
          _buildthirdaryOptionTile(
            context: context,
            onTap: () async {
              final index = ref.read(currentEditingIndexProvider);
              if (index != null) {
                await ref.read(reportProvider.notifier).addFile(index);
                ref.read(bottomSheetStateProvider.notifier).state =
                    BottomSheetView.userDetails;
              }
            },
            title: "Choose file",
            leadingicon: AssetPaths.chooseFile,
          ),
        ],
      ),
    );
  }

  Widget _buildthirdaryOptionTile({
    required BuildContext context,
    required VoidCallback onTap,
    required String title,
    required String leadingicon,
  }) {
    return Container(
      height: 100,
      color: AppColors.instance.grey300,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        onTap: onTap,
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.instance.grey400,
          ),
          child: Center(child: Image.asset(leadingicon, width: 25, height: 25)),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
