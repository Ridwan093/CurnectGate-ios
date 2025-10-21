import 'dart:developer';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/workOrder_categor/work_order_category_data.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_provider/getCategory_provider.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/workOder_online_dropdown.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryData extends ConsumerWidget {
  final String currentValue;
  const CategoryData({super.key, required this.currentValue});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workOrderCategoriesyAsync = ref.watch(workOrderCategoriesProvider);
    log(currentValue);

    return workOrderCategoriesyAsync.when(
      data: (cat) {
        try {
          final user = cat?.data;
          if (user != null ) {
            return DropDownWorkOoder(currentValue: currentValue, data: user);
          } else {
            return _buildEmptyState(
              () => ref
                  .read(workOrderCategoriesProvider.notifier)
                  .refreshCategories(context, ref),
            );
          }
        } catch (e) {
          return _buildErrorUI(
            e.toString(),
            ref,
            context,
            () => ref
                .read(workOrderCategoriesProvider.notifier)
                .refreshCategories(context, ref),
          );
        }
      },
      loading: () {
        try {
          final cachedCat = ref.read(workOrderCategoriesProvider).value;
          return cachedCat != null
              ? DropDownWorkOoder(
                currentValue: currentValue,
                data: cachedCat.data ?? WorkOrderCategoryData.empty(),
              )
              : _buildLoadingState();
        } catch (e) {
          return _buildErrorUI(
            e.toString(),
            ref,
            context,
            () => ref
                .read(workOrderCategoriesProvider.notifier)
                .refreshCategories(context, ref),
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
                  .read(workOrderCategoriesProvider.notifier)
                  .refreshCategories(context, ref),
            );
          }

          // Try to show cached data
          final cachedproperty = ref.read(workOrderCategoriesProvider).value;
          if (cachedproperty != null) {
            return Column(
              children: [
                DropDownWorkOoder(
                  currentValue: currentValue,
                  data: cachedproperty.data ?? WorkOrderCategoryData.empty(),
                ),
                _buildNetworkWarningBanner(
                  error.toString(),
                  () => ref
                      .read(workOrderCategoriesProvider.notifier)
                      .refreshCategories(context, ref),
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
                .read(workOrderCategoriesProvider.notifier)
                .refreshCategories(context, ref),
          );
        } catch (e) {
          return _buildErrorUI(
            e.toString(),
            ref,
            context,
            () => ref
                .read(workOrderCategoriesProvider.notifier)
                .refreshCategories(context, ref),
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
            const TextSpan(text: "No categories data available. "),
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
}
