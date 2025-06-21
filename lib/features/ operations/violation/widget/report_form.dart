import 'dart:io';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/violation/model/report_model.dart';
import 'package:curnectgate/features/%20operations/violation/report_provider/report_provider.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportForm extends ConsumerWidget {
  const ReportForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportState = ref.watch(reportProvider);
    final report = reportState.report;
    final isLoading = reportState.isLoading;
    final size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          left: 0,
          right: 0,
          top: 0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // 1. Category dropdown (no Expanded!)
              _buildCategoryDropdown(ref, report.category),
              const SizedBox(height: 20),

              // 2. Description field (no Expanded!)
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.instance.black500),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.instance.black500),
                  ),
                  labelStyle: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black500,
                  ),
                ),
                maxLines: 3,
                onChanged:
                    (value) =>
                        ref.read(reportProvider.notifier).setDescription(value),
              ),

              const SizedBox(height: 8.0),
              Text(
                "Maximum 100 characters",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 20),
              const SizedBox(height: 25),
              Text(
                "Uploade image Proof",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black500,
                  fontWeight: FontFamilies.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _buildImagePicker(
                    ref,
                    index: 0,
                    imagePaths: report.imagePaths,
                    files: report.files,
                  ),
                  const SizedBox(width: 20),
                  _buildImagePicker(
                    ref,
                    index: 1,
                    imagePaths: report.imagePaths,
                    files: report.files,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // 3. Optional anonymous toggle
              _buildanonymousHide(report, ref),

              const SizedBox(height: 20),

              // 4. Submit button
              _buildSubmitButton(
                size: size,
                isLoading: isLoading,
                ref: ref,
                context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // [Keep all your helper methods unchanged]
  // _buildanonymousHide, _buildSubmitButton, etc.
}

Widget _buildanonymousHide(Report report, WidgetRef ref) {
  return Container(
    height: 50,
    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    color: AppColors.instance.grey300,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Submit anonymously',
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 14,
            color: AppColors.instance.black600,
            fontWeight: FontFamilies.bold,
          ),
        ),
        Switch(
          activeColor: AppColors.instance.grey200,
          activeTrackColor: AppColors.instance.teal200,
          inactiveTrackColor: AppColors.instance.grey200,
          inactiveThumbColor: AppColors.instance.black300,

          // trackColor: WidgetStatePropertyAll(AppColors.instance.teal200),
          // hoverColor: AppColors.instance.teal200,
          // overlayColor: WidgetStatePropertyAll(AppColors.instance.black500),
          value: report.isAnonymous,
          onChanged: (_) => ref.read(reportProvider.notifier).toggleAnonymous(),
        ),
      ],
    ),
  );
}

double bottomPadding(BuildContext ctx) {
  var result = MediaQuery.of(ctx).viewInsets.bottom;
  if (result == 0) result = 10;
  return result;
}

Widget _buildSubmitButton({
  required Size size,
  required bool isLoading,
  required WidgetRef ref,
  required BuildContext context,
}) {
  return InkWell(
    onTap: isLoading ? null : () => _submitReport(ref, context),
    child: Container(
      height: 50,
      width: size.width,
      decoration: BoxDecoration(
        color:
            isLoading
                ? AppColors.instance.grey400
                : AppColors.instance.black600,

        borderRadius: BorderRadius.circular(10),
      ),

      child: Center(
        child: Text(
          "Submit",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 15,
            fontWeight: FontFamilies.medium,
            color: AppColors.instance.grey200,
          ),
        ),
      ),
    ),
  );
}

Widget _buildCategoryDropdown(WidgetRef ref, String currentValue) {
  final categories = {
    'Improper Parking': 'Vehicle parked in no-parking zone',
    'Wrong Way Driving': 'Vehicle moving against traffic',
    'Speeding': 'Vehicle exceeding speed limit',
    'Other': 'Other traffic violation',
  };

  return SizedBox(
    child: DropdownButtonFormField<String>(
      value: currentValue.isEmpty ? null : currentValue,
      decoration: InputDecoration(
        labelText: 'Category',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.instance.black500),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.instance.black500),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.instance.black500),
        ),
        labelStyle: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: AppColors.instance.black500,
        ),
      ),
      items:
          categories.entries.map((entry) {
            return DropdownMenuItem(
              value: entry.key,
              child: Text(
                entry.key,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                ),
              ),
            );
          }).toList(),
      onChanged:
          (value) => ref.read(reportProvider.notifier).setCategory(value!),
    ),
  );
}

Widget _buildImagePicker(
  WidgetRef ref, {
  required int index,
  required Map<int, String> imagePaths,
  required Map<int, ReportFile> files,
}) {
  final hasImage = imagePaths.containsKey(index);
  final hasFile = files.containsKey(index);

  return GestureDetector(
    onTap: () {
      ref.read(currentEditingIndexProvider.notifier).state = index;
      ref.read(bottomSheetStateProvider.notifier).state =
          BottomSheetView.reportfileuplode;
    },
    child: Container(
      width: 100,
      height: 120,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.instance.grey300),
        borderRadius: BorderRadius.circular(8),
        image:
            hasImage
                ? DecorationImage(
                  image: FileImage(File(imagePaths[index]!)),
                  fit: BoxFit.cover,
                )
                : null,
      ),
      child:
          hasImage
              ? null
              : hasFile
              ? _buildFilePreview(files[index]!)
              : Icon(
                Icons.add_circle,
                size: 30,
                color: AppColors.instance.black200,
              ),
    ),
  );
}

Widget _buildFilePreview(ReportFile file) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          _getFileIcon(file.type),
          size: 40,
          color: AppColors.instance.black500,
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            file.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
            ),
          ),
        ),
      ],
    ),
  );
}

IconData _getFileIcon(String type) {
  switch (type) {
    case 'pdf':
      return Icons.picture_as_pdf;
    case 'doc':
    case 'docx':
      return Icons.description;
    case 'txt':
      return Icons.text_snippet;
    default:
      return Icons.insert_drive_file;
  }
}

Future<void> _submitReport(WidgetRef ref, BuildContext context) async {
  final report = ref.read(reportProvider).report;

  if (report.category.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please select a report category')),
    );
    return;
  }

  if (report.description.isEmpty) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Please enter a description')));
    return;
  }

  try {
    await ref.read(reportProvider.notifier).submitReport();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Report submitted successfully!')),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to submit report: ${e.toString()}')),
    );
  }
}
