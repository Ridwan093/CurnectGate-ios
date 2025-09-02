import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/ResidentDirectory/provider/getResidentProvider.dart';
import 'package:curnectgate/features/ResidentDirectory/provider/provider.dart';
import 'package:curnectgate/features/ResidentDirectory/widget/resident_list.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResidentData extends ConsumerWidget {
  const ResidentData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final residentAsync = ref.watch(getResidentProvider);
    final searchState = ref.watch(residentSearchProvider);
    // Replace with your actual comments data
    return RefreshIndicator(
      onRefresh: () async {
        ref.read(getResidentProvider.notifier).refreshResident(context, ref);
      },
      child: residentAsync.when(
        data: (resident) {
          try {
            final res = resident?.data;
            if (res != null &&
                res.residents!.data.isNotEmpty &&
                searchState.errorMessage == null) {
              return ResidentLists(data: res.residents?.data ?? []);
            } else {
              return _buildEmtyBody();
            }
          } catch (e) {
            return _buildErrorUI(e.toString(), ref, context);
          }
        },
        loading: () {
          try {
            final resident = ref.read(getResidentProvider).value;
            final res = resident?.data;
            if (res != null &&
                res.residents!.data.isNotEmpty &&
                searchState.errorMessage == null) {
              return ResidentLists(data: res.residents?.data ?? []);
            } else {
              return _buildLoadingState();
            }
          } catch (e) {
            return _buildErrorUI(e.toString(), ref, context);
          }
        },
        error: (error, stack) {
          try {
            // Handle session expiration
            if (error.toString().contains("Unauthenticated")) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ref.read(authProvider.notifier).seassionExpire(context, ref);
              });
              return _buildSessionExpiredUI();
            }

            // Try to show cached data

            final resident = ref.read(getResidentProvider).value;
            final res = resident?.data;
            if (res != null &&
                res.residents!.data.isNotEmpty &&
                searchState.errorMessage == null) {
              return ResidentLists(data: res.residents?.data ?? []);
            }

            // No cached data available
            return _buildErrorUI(
              error.toString().toLowerCase().contains("connection")
                  ? "Connection failed. Please check your network"
                  : "Failed to load resident directory",
              ref,
              context,
            );
          } catch (e) {
            // final comment = ref.read(commentProvider).value;
            // if (comment != null) {
            //   return CommentBody(comment.data);
            // }

            return _buildErrorUI(e.toString(), ref, context);
          }
        },
      ),
    );
  }

  // Helper Widgets
  Widget _buildLoadingState() {
    return Center(
      child: CircularProgressIndicator(color: AppColors.instance.yellow500),
    );
  }

  Widget _buildSessionExpiredUI() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Your session has expired"),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            /* your login logic */
            child: Text(
              "Login Again",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorUI(String error, WidgetRef ref, BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline,
            size: 48,
            color: AppColors.instance.error600,
          ),
          const SizedBox(height: 16),
          Text(
            "Failed to load resident directory",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 16,
              color: AppColors.instance.black600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            error.split(':').first,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black400,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.instance.grey200,
            ),
            onPressed:
                () => ref
                    .read(getResidentProvider.notifier)
                    .refreshResident(context, ref),
            child: Text(
              "Try Again",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
                fontWeight: FontFamilies.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmtyBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetPaths.navMessages, height: 100, width: 100),
          SizedBox(height: 10),
          Text(
            "No resident directory Yet!",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black300,
              fontSize: 12,
              fontWeight: FontFamilies.medium,
            ),
          ),
        ],
      ),
    );
  }
}
