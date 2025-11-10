import 'dart:developer';
import 'dart:io';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/violation/model/report_model.dart';
import 'package:curnectgate/features/operations/violation/report_provider/getCategory_provider.dart';
import 'package:curnectgate/features/operations/violation/report_provider/report_provider.dart';
import 'package:curnectgate/features/operations/violation/widget/category_dropdwon.dart';
import 'package:curnectgate/features/operations/violation/widget/estate_dropdwon_Address.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportForm extends ConsumerStatefulWidget {
  const ReportForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReportFormState();
}

class _ReportFormState extends ConsumerState<ReportForm> {
  late TextEditingController decController;

  @override
  void initState() {
    super.initState();

    decController = TextEditingController(
      text: ref.read(reportProvider).report.description,
    );
  }

  @override
  Widget build(BuildContext context) {
    final reportState = ref.watch(reportProvider);
    final report = reportState.report;
    final isLoading = ref.watch(formProvider).reportLoading;
    // final isLoading = reportState.isLoading;

    final size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              // bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 0,
              right: 0,
              top: 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),

                // 1. Category dropdown (no Expanded!)
                _buildCategoryDropdown(ref, report.category ?? "", context),
                const SizedBox(height: 20),

                // 2. Description field (no Expanded!)
                TextFormField(
                  controller: decController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.instance.black500,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.instance.black500,
                      ),
                    ),
                    labelStyle: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black500,
                    ),
                  ),
                  maxLines: 3,
                  onChanged:
                      (value) => ref
                          .read(reportProvider.notifier)
                          .setDescription(value),
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
                // Replace your existing dropdown with:
                const CustomSearchDropdown(),
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
                _buildSubmitButton(size: size, ref: ref, context: context),
              ],
            ),
          ),
          if (isLoading)
            Positioned.fill(
              child: Container(
                color: AppColors.instance.black100.withOpacity(.4),
                height: MediaQuery.sizeOf(context).height,
                child: SizedBox(
                  height: 30,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.instance.yellow500,
                    ),
                  ),
                ),
              ),
            ),
        ],
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

  required WidgetRef ref,
  required BuildContext context,
}) {
  final valid = ref.watch(reportProvider);
  final report = valid.report;
  return InkWell(
    onTap: () {
      if (report.category!.isEmpty) {
        showCustomSuccessToast(
          context: context,
          message: "Please selecte category!",
          color: AppColors.instance.grey200,
          icon: Icons.error,
          iconColors: AppColors.instance.black600,
          positionNumber: 70,
        );
      } else if (report.description.isEmpty) {
        showCustomSuccessToast(
          context: context,
          message: "Please add description!",
          color: AppColors.instance.grey200,
          icon: Icons.error,
          iconColors: AppColors.instance.black600,
          positionNumber: 70,
        );
      } else if (report.addressId!.isEmpty) {
        showCustomSuccessToast(
          context: context,
          message: "please selected Addrees you wish to report!",
          color: AppColors.instance.grey200,
          icon: Icons.error,
          iconColors: AppColors.instance.black600,
          positionNumber: 70,
        );
      } else if (report.categoryID!.isEmpty) {
        showCustomSuccessToast(
          context: context,
          message: "Please selecte category!",
          color: AppColors.instance.grey200,
          icon: Icons.error,
          iconColors: AppColors.instance.black600,
          positionNumber: 70,
        );
      }
      if (report.imagePaths.isEmpty) {
        log("File: ${report.imagePaths[1] ?? ""}");
        log(report.imagePaths[0] ?? "");

        showCustomSuccessToast(
          context: context,
          message: "at least one proof required!",
          color: AppColors.instance.grey200,
          icon: Icons.error,
          iconColors: AppColors.instance.black600,
          positionNumber: 70,
        );
      } else {
        ref
            .read(formProvider.notifier)
            .createReport(context: context, ref: ref);
      }
    },
    child: Container(
      height: 50,
      width: size.width,
      decoration: BoxDecoration(
        color: AppColors.instance.black600,

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

Widget _buildCategoryDropdown(
  WidgetRef ref,
  String currentValue,
  BuildContext context,
) {
  final categoryAsync = ref.watch(estatCategoryProvider);
  log(currentValue);

  return categoryAsync.when(
    data: (profile) {
      try {
        final user = profile?.data;
        return user != null
            ? CategoryDropdown(currentValue: currentValue, data: user)
            : _buildEmptyState(
              () => ref
                  .read(estatCategoryProvider.notifier)
                  .refreshCategory(context, ref),
            );
      } catch (e) {
        return _buildErrorUI(
          e.toString(),
          ref,
          context,
          () => ref
              .read(estatCategoryProvider.notifier)
              .refreshCategory(context, ref),
        );
      }
    },
    loading: () {
      try {
        final cachedCategory = ref.read(estatCategoryProvider).value;
        return cachedCategory != null
            ? CategoryDropdown(
              currentValue: currentValue,
              data: cachedCategory.data,
            )
            : _buildLoadingState();
      } catch (e) {
        return _buildErrorUI(
          e.toString(),
          ref,
          context,
          () => ref
              .read(estatCategoryProvider.notifier)
              .refreshCategory(context, ref),
        );
      }
    },
    error: (error, stack) {
      try {
        // Handle session expiration
        if (error.toString().contains("Unauthenticated")) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.read(authProvider.notifier).seassionExpire(context, ref);
          });
          return _buildSessionExpiredUI(
            () => ref
                .read(estatCategoryProvider.notifier)
                .refreshCategory(context, ref),
          );
        }

        // Try to show cached data
        final cachedCategory = ref.read(estatCategoryProvider).value;
        if (cachedCategory != null) {
          return Column(
            children: [
              CategoryDropdown(
                currentValue: currentValue,
                data: cachedCategory.data,
              ),
              _buildNetworkWarningBanner(
                error.toString(),
                () => ref
                    .read(estatCategoryProvider.notifier)
                    .refreshCategory(context, ref),
              ),
            ],
          );
        }

        // No cached data available
        return _buildErrorUI(
          error.toString(),
          ref,
          context,
          () => ref
              .read(estatCategoryProvider.notifier)
              .refreshCategory(context, ref),
        );
      } catch (e) {
        return _buildErrorUI(
          e.toString(),
          ref,
          context,
          () => ref
              .read(estatCategoryProvider.notifier)
              .refreshCategory(context, ref),
        );
      }
    },
  );
}

Widget _buildLoadingState() {
  return Center(
    child: CircularProgressIndicator(color: AppColors.instance.yellow500),
  );
}

Widget _buildEmptyState(VoidCallback onRetry) {
  return Center(
    child: RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black87),
        children: [
          const TextSpan(text: "No catetgory data available. "),
          WidgetSpan(
            child: TextButton(
              onPressed: onRetry,
              child: Text(
                "Retry",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildSessionExpiredUI(VoidCallback onLogin) {
  return Center(
    child: RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black87),
        children: [
          const TextSpan(text: "Your session has expired. "),
          WidgetSpan(
            child: TextButton(
              onPressed: onLogin,
              child: Text(
                "Login again",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildNetworkWarningBanner(String error, VoidCallback onRetry) {
  return Container(
    padding: const EdgeInsets.all(12),
    color: Colors.orange[100],
    child: RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 14, color: Colors.black87),
        children: [
          TextSpan(text: "Connection issue: ${error.split(':').first}. "),
          WidgetSpan(
            child: TextButton(
              onPressed: onRetry,
              child: Text(
                "Retry",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildErrorUI(
  String error,
  WidgetRef ref,
  BuildContext context,
  VoidCallback onRetry,
) {
  return Center(
    child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          fontSize: 16,
          color: AppColors.instance.error600,
        ),
        children: [
          const TextSpan(text: "Failed to load data. "),
          WidgetSpan(
            child: TextButton(
              onPressed: onRetry,
              child: Text(
                "Try Again",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildImagePicker(
  WidgetRef ref, {
  required int index,
  required Map<int, String> imagePaths,
  required Map<int, String> files,
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
                  image: FileImage(File(imagePaths[index] ?? '')),
                  fit: BoxFit.cover,
                )
                : DecorationImage(
                  image: FileImage(File(files[index] ?? '')),
                  fit: BoxFit.cover,
                ),
      ),
      child:
          hasImage
              ? null
              : hasFile
              ? null
              : Icon(
                Icons.add_circle,
                size: 30,
                color: AppColors.instance.black200,
              ),
    ),
  );
}
