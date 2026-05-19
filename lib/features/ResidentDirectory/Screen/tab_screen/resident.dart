import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/ResidentDirectory/provider/getResidentProvider.dart';
import 'package:curnectgate/features/ResidentDirectory/provider/resident_provider_filter.dart';
import 'package:curnectgate/features/ResidentDirectory/widget/resident_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class Residentss extends ConsumerWidget {
  const Residentss({super.key});
  Future<void> _launchDialer(String phoneNumber) async {
    // Validate the phone number (optional: remove non-digits)
    String formattedNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
    if (formattedNumber.isEmpty) {
      // Handle empty number (e.g., show a snackbar)
      return;
    }

    final Uri url = Uri(scheme: 'tel', path: formattedNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // Handle launch failure (e.g., show error message)
      throw 'Could not launch dialer for $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(residentSearchProvider);
    final searchNotifier = ref.read(residentSearchProvider.notifier);

    return AnimatedPadding(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        right: 10,
        left: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resident Directory',
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 23,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
            ),
          ),
          const SizedBox(height: 20),
          _buildSearchEngine(searchNotifier, ref),
          if (searchState.errorMessage != null &&
              searchState.errorType == 'no_results') ...[
            const SizedBox(height: 5),
            Text(
              searchState.errorMessage ?? "",
              style: TextStyle(
                color: AppColors.instance.black500,
                fontSize: 12,
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
              ),
            ),
          ],
          const SizedBox(height: 20),
          searchState.residentData.when(
            data:
                (residentData) => Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => searchNotifier.refresh(context, ref),
                    color: AppColors.instance.yellow500,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          ...searchState.filteredResidents.map(
                            (resident) => ResidentCard(
                              email: resident.email ?? "",
                              userName: resident.fullName,
                              block: resident.memberCode,
                              adrress: resident.address,
                              onChangePressed:
                                  resident.phone == null
                                      ? null
                                      : () {
                                        _launchDialer(resident.phone ?? "");
                                      },
                            ),
                          ),
                        ],
                      ),
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
                final resident = ref.read(getResidentProvider).value;
                final res = resident?.data;
                if (res != null &&
                    res.residents!.data.isNotEmpty &&
                    searchState.errorMessage == null) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...searchState.filteredResidents.map(
                            (resident) => ResidentCard(
                              email: resident.email ?? "",
                              userName: resident.fullName,
                              block: resident.memberCode,
                              adrress: resident.address,
                              onChangePressed:
                                  resident.phone == null
                                      ? null
                                      : () {
                                        _launchDialer(resident.phone ?? "");
                                      },
                            ),
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
                      : "Failed to load resident directory",
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

  Widget _buildSearchEngine(ResidentSearchNotifier notifier, WidgetRef ref) {
    return SizedBox(
      height: 50,
      child: TextField(
        onChanged: (query) => notifier.searchResidents(query, ref),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.instance.grey300,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.instance.grey300,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          filled: true,
          fillColor: AppColors.instance.grey300,
          hintText: '(e.g., Rita)',
          labelText: 'Search name',
          hintStyle: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 12,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black300,
          ),
          labelStyle: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 12,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black300,
          ),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildErrorUI(
    String error,
    WidgetRef ref,
    BuildContext context,
    ResidentSearchNotifier notifier,
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
