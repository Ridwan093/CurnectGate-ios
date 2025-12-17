// tab_contents.dart
import 'dart:developer';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/history_model/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AllTabContent extends StatelessWidget {
  final List<TransactionItem>? data;
  AllTabContent({super.key, required this.data}); // Your list here
  final List<Map<String, dynamic>> activities = [
    {
      "icon": AssetPaths.addMember,
      "title": "Added to wallet",
      "date": "May 2 2024",
      "amount": "+₦24.000",
      "isPositive": true,
    },
    {
      "icon": AssetPaths.maintenance,
      "title": "Maintenance",
      "date": "May 1 2024",
      "amount": "-₦15.000",
      "isPositive": false,
    },
    {
      "icon": AssetPaths.maintenance,
      "title": "Maintenace",
      "date": "April 30 2024",
      "amount": "-₦17.000",
      "isPositive": false,
    },

    // Add more as needed
  ];

  String formatPrice(String price) {
    final number = double.tryParse(price) ?? 0.0;
    final formatter = NumberFormat('#,##0.00');
    return formatter.format(number);
  }

  String formatDueDate(String isoDate) {
    DateTime date = DateTime.parse(isoDate);
    return DateFormat('dd MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: data?.length,
      itemBuilder: (context, index) {
        final activity = data?[index];
        return ListTile(
          onTap: () {
            log(activity!.receipt.toString());
          },
          leading: CircleAvatar(
            backgroundColor: AppColors.instance.teal100,

            child: _getpriceIcons(activity?.transactionType ?? ""),
          ),
          title: Text(
            _getTitle(activity?.transactionType ?? ""),
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontSize: 13,
              fontWeight: FontFamilies.bold,
            ),
          ),
          subtitle: Text(
            formatDueDate(
              _getDate(
                activity?.transactionType ?? "",
                activity?.paidAt ?? "",
                activity?.createdAt ?? "",
              ),
            ),
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 10,
              color: AppColors.instance.black300,
              fontWeight: FontFamilies.medium,
            ),
          ),
          trailing: Text(
            _getpriceSign(
              activity?.transactionType ?? "",
              "₦${formatPrice(activity?.amount ?? "")}",
            ),
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: _getpriceColor(activity?.transactionType ?? ""),
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }

  String _getTitle(String value) {
    switch (value.toLowerCase()) {
      case "wallet_funding":
        return "Wallet funding";
      case "due_payment":
        return "Due Payment";

      default:
        return "General Payment";
    }
  }

  String _getDate(String value, String dueDate, String walletDate) {
    switch (value.toLowerCase()) {
      case "wallet_funding":
        return walletDate;
      case "due_payment":
        return dueDate;

      default:
        return walletDate;
    }
  }

  String _getpriceSign(String value, String price) {
    switch (value.toLowerCase()) {
      case "wallet_funding":
        return "+${price}";
      case "due_payment":
        return "-${price}";

      default:
        return price;
    }
  }

  Color _getpriceColor(String value) {
    switch (value.toLowerCase()) {
      case "wallet_funding":
        return AppColors.instance.teal500;
      case "due_payment":
        return AppColors.instance.black300;

      default:
        return AppColors.instance.black300;
    }
  }

  Widget _getpriceIcons(String value) {
    switch (value.toLowerCase()) {
      case "wallet_funding":
        return Icon(Icons.add, color: AppColors.instance.black600);
      case "due_payment":
        return Image.asset(AssetPaths.maintenance, width: 20);

      default:
        return Image.asset(AssetPaths.maintenance, width: 20);
    }
  }
}
class DueTabContent extends StatelessWidget {
  final List<TransactionItem>? data;
  const DueTabContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // Filter only due payments
    final dueList = data?.where((item) => item.transactionType?.toLowerCase() == "due_payment").toList() ?? [];

    return AllTabContent(data: dueList);
  }
}

class DepositTabContent extends StatelessWidget {
  final List<TransactionItem>? data;
  const DepositTabContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // Filter only wallet funding
    final depositList = data?.where((item) => item.transactionType?.toLowerCase() == "wallet_funding").toList() ?? [];

    return AllTabContent(data: depositList);
  }
}
