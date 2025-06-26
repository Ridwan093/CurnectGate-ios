// custom_tab_view.dart
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/payment/state_model/state.dart';
import 'package:curnectgate/features/payment/widget/tab_button.dart';
import 'package:curnectgate/features/payment/widget/tab_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTabView extends ConsumerWidget {
  const CustomTabView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(tabProvider);
    final pageController = PageController(
      initialPage: WalletTab.values.indexOf(currentTab),
    );

    return Column(
      children: [
        // Custom Tab Bar
        Container(
          margin: EdgeInsets.all(12),
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
                      onTap: () {
                        ref.read(tabProvider.notifier).state = tab;
                        pageController.animateToPage(
                          WalletTab.values.indexOf(tab),
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    );
                  }).toList(),
            ),
          ),
        ),
        // Tab Content (PageView)
        Expanded(
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              ref.read(tabProvider.notifier).state = WalletTab.values[index];
            },
            children: [AllTabContent(), DueTabContent(), DepositTabContent()],
          ),
        ),
      ],
    );
  }
}
