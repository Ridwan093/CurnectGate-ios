import 'dart:developer';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/getProperty_provider.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/property_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PropertyWidget extends ConsumerWidget {
  final String currentValue;
  const PropertyWidget({super.key, required this.currentValue});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertyAsync = ref.watch(propertyIdProvider);
    log(currentValue);

    return propertyAsync.when(
      data: (property) {
        try {
          final user = property?.data;
          if (user != null && user.properties.isNotEmpty) {
            return PropertyDropdown(currentValue: currentValue, data: user);
          } else {
            return _buildEmptyState(
              () => ref
                  .read(propertyIdProvider.notifier)
                  .refreshProperty(context, ref),
            );
          }
        } catch (e) {
          return _buildErrorUI(
            e.toString(),
            ref,
            context,
            () => ref
                .read(propertyIdProvider.notifier)
                .refreshProperty(context, ref),
          );
        }
      },
      loading: () {
        try {
          final cachedproperty = ref.read(propertyIdProvider).value;
          return cachedproperty?.data != null && (cachedproperty?.data?.properties?? []).isNotEmpty
              ? PropertyDropdown(
                currentValue: currentValue,
                data: cachedproperty!.data!,
              )
              : _buildLoadingState();
        } catch (e) {
          return _buildErrorUI(
            e.toString(),
            ref,
            context,
            () => ref
                .read(propertyIdProvider.notifier)
                .refreshProperty(context, ref),
          );
        }
      },
      error: (error, stack) {
        try {
          // Handle session expiration
          if (error.toString().contains("Unauthorized")) {
            return _buildSessionExpiredUI(
              () => ref
                  .read(propertyIdProvider.notifier)
                  .refreshProperty(context, ref),
            );
          }

          // Try to show cached data
          final cachedproperty = ref.read(propertyIdProvider).value;
          if (cachedproperty?.data != null && (cachedproperty?.data?.properties?? []).isNotEmpty) {
            return Column(
              children: [
                PropertyDropdown(
                  currentValue: currentValue,
                  data: cachedproperty!.data!,
                ),
                _buildNetworkWarningBanner(
                  error.toString(),
                  () => ref
                      .read(propertyIdProvider.notifier)
                      .refreshProperty(context, ref),
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
                .read(propertyIdProvider.notifier)
                .refreshProperty(context, ref),
          );
        } catch (e) {
          return _buildErrorUI(
            e.toString(),
            ref,
            context,
            () => ref
                .read(propertyIdProvider.notifier)
                .refreshProperty(context, ref),
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
            const TextSpan(text: "No property data available. "),
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
