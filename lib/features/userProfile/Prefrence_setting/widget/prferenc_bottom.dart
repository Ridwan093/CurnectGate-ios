import 'dart:developer';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/userProfile/Prefrence_setting/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrferencBottom extends ConsumerWidget {
  final String title;
  final String dec;
  final List<Option> options;
  final Function(Option) onSelected;
  const PrferencBottom(
    this.title,
    this.options,
    this.onSelected,
    this.dec, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formProviders = ref.read(formProvider.notifier);
    final state = ref.watch(formProvider);
    return SingleChildScrollView(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: Align(
              alignment: Alignment.topRight,
              child:
                  state.prevencyLoading
                      ? CircularProgressIndicator(
                        color: AppColors.instance.yellow500,
                      )
                      : Icon(Icons.close, color: AppColors.instance.black600),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Select $title,",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              fontSize: 20,
              color: AppColors.instance.black600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            dec,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              color: AppColors.instance.black300,
            ),
          ),
          SizedBox(height: 20),
          Column(
            children:
                options.map((option) {
                  return ListTile(
                    title: Text(option.name!),

                    onTap: () {
                      log(title);
                      formProviders.updateAppPrefernce(
                        context: context,
                        key:
                            title == "Date Format"
                                ? "date_format"
                                : title.toLowerCase(),
                        value: option.key ?? "",
                        ref: ref,
                      );
                    },
                  );
                }).toList(),
          ),
          Divider(),
        ],
      ),
    );
  }
}
