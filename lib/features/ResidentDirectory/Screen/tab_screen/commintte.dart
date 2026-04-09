import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/ResidentDirectory/provider/committe_provider_filter.dart';
import 'package:curnectgate/features/ResidentDirectory/provider/getCommitte_provider.dart';
import 'package:curnectgate/features/ResidentDirectory/widget/committe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Committee extends ConsumerWidget {
  const Committee({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(committeeSearchProvider);
    final searchNotifier = ref.read(committeeSearchProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Committee',
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 23,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
            ),
          ),
          const SizedBox(height: 20),
          // _buildSearchEngine(searchNotifier, ref),
          // if (searchState.commmitteeErrorMessage != null &&
          //     searchState.commmitteeErrorType == 'no_results') ...[
          //   Padding(
          //     padding: const EdgeInsets.only(top: 8.0),
          //     child: Text(
          //       searchState.commmitteeErrorMessage ?? "",
          //       style: TextStyle(
          //         color: AppColors.instance.black500,
          //         fontSize: 12,
          //         fontFamily: FontFamilies.interDisplay,
          //         fontWeight: FontFamilies.bold,
          //       ),
          //     ),
          //   ),
          // ],
          const SizedBox(height: 20),
          searchState.committeeData.when(
            data:
                (residentData) => Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...searchState.committeeFilteredResidents.map(
                          (committee) => CommitteeCard(committee: committee),
                        ),
                      ],
                    ),
                  ),
                ),
            loading: () => const Loadingstates(),
            error: (error, stack) {
              try {
                // Handle session expiration
                if (error.toString().contains("Unauthorized")) {
                  return Expiresessionbody();
                }
                // Try to show cached data
                final resident = ref.read(getCommitteeProvider).value;
                final res = resident?.data;
                if (res != null &&
                    res.committees!.data!.isNotEmpty &&
                    searchState.commmitteeErrorMessage == null) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...searchState.committeeFilteredResidents.map(
                            (committee) => CommitteeCard(committee: committee),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                // No cached data available
                return _buildErrorUI(
                  error.toString().toLowerCase().contains("connection")
                      ? "Connection failed. Please check your network"
                      : "Failed to load committee",
                  ref,
                  context,
                  searchNotifier,
                );
              } catch (e) {
                return _buildErrorUI(
                  e.toString(),
                  ref,
                  context,
                  searchNotifier,
                );
              }
            },
          ),
        ],
      ),
    );
  }



  Widget _buildErrorUI(
    String error,
    WidgetRef ref,
    BuildContext context,
    CommitteeSearchNotifier notifier,
  ) {
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
            "Failed to load  committee",
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
            onPressed: () => notifier.refresh(context, ref),
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
}
