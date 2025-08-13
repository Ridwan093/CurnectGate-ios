import 'dart:developer';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/violation/model/estate_address_model.dart';
import 'package:curnectgate/features/operations/violation/report_provider/getEstate_provider.dart';
import 'package:curnectgate/features/operations/violation/report_provider/report_provider.dart';
import 'package:curnectgate/features/operations/violation/widget/seachHighlith_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Selected address state provider
final selectedAddressProvider = StateProvider<EstateAddress?>((ref) => null);

class CustomSearchDropdown extends ConsumerStatefulWidget {
  const CustomSearchDropdown({super.key});

  @override
  ConsumerState<CustomSearchDropdown> createState() =>
      _CustomSearchDropdownState();
}

class _CustomSearchDropdownState extends ConsumerState<CustomSearchDropdown>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final TextEditingController _searchController = TextEditingController();
  bool _isDropdownOpen = false;
  List<EstateAddress> _filteredAddresses = [];
  EstateAddress? _selectedAddress;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _toggleDropdown() {
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
      if (_isDropdownOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
        _searchController.clear();
        _isSearching = false;
        // Reset filtered addresses when closing
        final addressList = ref.read(estatePrividers);
        if (addressList.value != null) {
          _filteredAddresses = addressList.value!.data.addresses;
        }
      }
    });
  }

  void _filterAddresses(String query, List<EstateAddress> addresses) {
    setState(() {
      _isSearching = query.isNotEmpty;

      if (query.isEmpty) {
        _filteredAddresses = addresses;

        return;
      }

      _filteredAddresses =
          addresses.where((address) {
            log(address.buildingName.toString());
            final searchTerms = [
              address.label.toLowerCase(),
              address.blockNumber.toLowerCase(),
              address.streetNumber.toLowerCase(),
              address.streetName.toLowerCase(),
              address.buildingName.toLowerCase(),
            ];

            return searchTerms.any(
              (term) => term.contains(query.toLowerCase()),
            );
          }).toList();
    });
  }

  Widget _buildAddressList() {
    if (_isSearching && _filteredAddresses.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'No addresses found matching your search',
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 14,
              color: AppColors.instance.black600,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 200,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: _filteredAddresses.length,
        itemBuilder: (context, index) {
          final address = _filteredAddresses[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.instance.teal300,
              radius: 20,
              child: Center(
                child: Icon(Icons.house, color: AppColors.instance.black600),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HighlightedText(
                  text: address.label,
                  query: _searchController.text,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 12,
                    color: AppColors.instance.black600,
                  ),
                  highlightColor: AppColors.instance.teal100,
                ),
                if (address.streetName.isNotEmpty ||
                    address.streetNumber.isNotEmpty)
                  HighlightedText(
                    text: '${address.streetName} ${address.streetNumber}',
                    query: _searchController.text,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 10,
                      color: AppColors.instance.black400,
                    ),
                    highlightColor: AppColors.instance.teal100,
                  ),
              ],
            ),
            onTap: () {
              if (_selectedAddress?.id != null) {
                ref
                    .read(reportProvider.notifier)
                    .setEstateAddressID(
                      _selectedAddress!.id.toString(),
                      address.label,
                    );
              }

              // log(_selectedAddress!.id.toString());
              ref.read(selectedAddressProvider.notifier).state = address;
              setState(() {
                _selectedAddress = address;
              });
              _toggleDropdown();
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final addressList = ref.watch(estatePrividers);
    final selectAdrees = ref.watch(reportProvider);
    log(selectAdrees.report.addressId!);

    return addressList.when(
      data: (data) {
        final addresses = data?.data.addresses ?? [];
        if (_filteredAddresses.isEmpty && addresses.isNotEmpty) {
          _filteredAddresses = addresses;
        }

        return Column(
          children: [
            // Input field with dropdown toggle
            GestureDetector(
              onTap: _toggleDropdown,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        selectAdrees.report.addressId!.isNotEmpty
                            ? selectAdrees.report.address!
                            : 'Select Address',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: FontFamilies.interDisplay,
                          color: AppColors.instance.black600,
                        ),
                      ),
                    ),
                    RotationTransition(
                      turns: _animation,
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.instance.black600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Animated dropdown content
            SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: _animation,
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Search field
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search addresses...',
                          prefixIcon: const Icon(Icons.search),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.instance.black300,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.instance.black300,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onChanged:
                            (query) => _filterAddresses(query, addresses),
                      ),
                    ),

                    // Address list or empty state
                    _buildAddressList(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      loading:
          () => Center(
            child: CircularProgressIndicator(
              color: AppColors.instance.yellow500,
            ),
          ),
      error:
          (e, _) => Text(
            'Error loading addresses',
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.error500,
            ),
          ),
    );
  }
}
