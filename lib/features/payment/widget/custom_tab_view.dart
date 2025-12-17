import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/payment/state_model/state.dart';
import 'package:curnectgate/features/payment/widget/payment_data/payment_history_data.dart';
import 'package:curnectgate/features/payment/widget/tab_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTabView extends ConsumerStatefulWidget {
  const CustomTabView({super.key});

  @override
  ConsumerState<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends ConsumerState<CustomTabView> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    final initialTab = ref.read(tabProvider);
    _pageController = PageController(
      initialPage: WalletTab.values.indexOf(initialTab),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentTab = ref.watch(tabProvider);

    return Column(
      children: [
        // Custom Tab Bar
        Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.instance.grey300,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
                  WalletTab.values.map((tab) {
                    return TabButton(
                      label: tab.name,
                      isSelected: currentTab == tab,
                      onTap: () async {
                        final targetPage = WalletTab.values.indexOf(tab);
                        // Animate first
                        await _pageController.animateToPage(
                          targetPage,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                        // Then update provider
                        ref.read(tabProvider.notifier).state = tab;
                      },
                    );
                  }).toList(),
            ),
          ),
        ),

        // Tab Content
        Expanded(
          child:PaymentHistory(
            controller: _pageController,
          )
        ),
      ],
    );
  }
}
