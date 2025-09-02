import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/ResidentDirectory/provider/provider.dart';
import 'package:curnectgate/features/ResidentDirectory/widget/resident_card.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/vendor_fileter.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Residentss extends ConsumerWidget {
  Residentss({super.key});

  final List<String> _statusOptions = [
    'All',
    'Pending',
    'Active',
    'In Progress',
    'Completed',
    'Cancelled',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(residentSearchProvider);
    final searchNotifier = ref.read(residentSearchProvider.notifier);

    return searchState.residentData.when(
      data:
          (residentData) => SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    CustomStatusDropdown(
                      statusOptions: _statusOptions,
                      initialStatus: 'All',
                      onStatusChanged: (newStatus) {
                        searchNotifier.filterByStatus(newStatus, ref);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildSearchEngine(searchNotifier, ref),
                if (searchState.errorMessage != null) ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      searchState.errorMessage!,
                      style: TextStyle(
                        color: AppColors.instance.black500,
                        fontSize: 12,
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontFamilies.bold,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                if (searchState.filteredResidents.isEmpty &&
                    searchState.errorMessage == null)
                  const Center(child: Text('No residents available.')),
                ...searchState.filteredResidents.map(
                  (resident) => ResidentCard(
                    userName: resident.fullName,
                    block: resident.memberCode,
                    adrress: resident.address,
                    onChangePressed: () {},
                  ),
                ),
              ],
            ),
          ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error:
          (error, _) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Error: $error',
                  style: TextStyle(
                    color: AppColors.instance.error500,
                    fontFamily: FontFamilies.interDisplay,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => searchNotifier.refresh(context, ref),
                  child: const Text('Retry'),
                ),
              ],
            ),
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

  PreferredSizeWidget _buildAppBar(WidgetRef ref, BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.instance.black600,
          size: 14,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: InkWell(
            onTap:
                () => showUserBottomSheet(
                  context: context,
                  headertitle: '',
                  headersubtitle: '',
                  ref: ref,
                  bottom: BottomSheetView.residentEmgencyContacts,
                ),
            child: Icon(
              Icons.add_ic_call_outlined,
              weight: 0.8,
              color: AppColors.instance.error600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
            onPressed:
                () => ref
                    .read(residentSearchProvider.notifier)
                    .refresh(context, ref),
            icon: Icon(Icons.refresh, color: AppColors.instance.black600),
          ),
        ),
      ],
    );
  }
}
