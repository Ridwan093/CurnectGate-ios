import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/emmergencyBody.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:curnectgate/features/userProfile/Prefrence_setting/model/option.dart';
import 'package:curnectgate/features/userProfile/Prefrence_setting/provider/prefrence_provider.dart';
import 'package:curnectgate/features/userProfile/Prefrence_setting/widget/Setting_widget.dart';
import 'package:curnectgate/features/userProfile/Prefrence_setting/widget/prferenc_bottom.dart';
import 'package:curnectgate/features/userProfile/Prefrence_setting/widget/time_zone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PreferencesScreen extends ConsumerWidget {
  const PreferencesScreen({super.key});

  void showOptionsSheet(
    String dec,
    String title,
    List<Option> options,
    Function(Option) onSelected,
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return PrferencBottom(title, options, onSelected, dec);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(ref, context),
      body: _buildBody(ref, context),
    );
  }

  Widget _buildBody(WidgetRef ref, BuildContext context) {
    final prefrencyAsync = ref.watch(userPrefrenceprovider);
    // final isError = ref.watch(formProvider).prvencyettingerror;

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () => ref
              .read(userPrefrenceprovider.notifier)
              .refreshSettings(context, ref),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                _buildAppbarBottom(ref),
                SizedBox(height: 10),
                prefrencyAsync.when(
                  data: (preference) {
                    try {
                      final user = preference?.data;
                      final prefs = user?.preferences;
                      // ignore: unnecessary_null_comparison
                      return user != null
                          ? Column(
                            children: [
                              SettingWidget(
                                title: prefs?.currency?.name ?? "",
                                description: prefs?.currency?.description ?? "",
                                currentValue: prefs?.currency?.value ?? "",
                                onTap:
                                    () => showOptionsSheet(
                                      prefs?.currency?.description ?? "",
                                      prefs?.currency?.name ?? "",
                                      prefs?.currency?.options ?? [],
                                      (selected) {},
                                      context,
                                    ),
                              ),
                              SettingWidget(
                                title: prefs?.language?.name ?? "",
                                description: prefs?.language?.description ?? "",
                                currentValue: prefs?.language?.value ?? "",
                                onTap:
                                    () => showOptionsSheet(
                                      prefs?.language?.description ?? "",
                                      prefs?.language?.name ?? "",

                                      prefs?.language?.options ?? [],
                                      (selected) {},
                                      context,
                                    ),
                              ),
                              SettingWidget(
                                title: prefs?.dateFormat?.name ?? "",
                                description:
                                    prefs?.dateFormat?.description ?? "",
                                currentValue: prefs?.dateFormat?.value ?? "",

                                onTap:
                                    () => showOptionsSheet(
                                      prefs?.dateFormat?.description ?? "",
                                      prefs?.dateFormat?.name ?? "",

                                      prefs?.dateFormat?.options ?? [],
                                      (selected) {},
                                      context,
                                    ),
                              ),
                              SettingWidget(
                                title: prefs?.timezone?.name ?? "",
                                description: prefs?.timezone?.description ?? "",
                                currentValue: prefs?.timezone?.value ?? "",

                                onTap:
                                    () => showTimezoneDialog(
                                      context,
                                      ref,
                                      prefs?.timezone?.value ?? "",
                                    ),
                              ),
                            ],
                          )
                          : EmptyBodys(message: "No Preference Settings?");
                    } catch (e) {
                      return Builderroul(
                        error: e.toString(),
                        onTap:
                            () => ref
                                .read(userPrefrenceprovider.notifier)
                                .refreshSettings(context, ref),
                        firstMessae: "Faile to load Preference Settings?",
                      );
                    }
                  },
                  loading: () {
                    try {
                      final prefrency = ref.read(userPrefrenceprovider).value;
                      final user = prefrency?.data;
                      final prefs = user?.preferences;

                      return prefrency != null && user != null
                          ? Column(
                            children: [
                              SettingWidget(
                                title: prefs?.currency?.name ?? "",
                                description: prefs?.currency?.description ?? "",
                                currentValue: prefs?.currency?.value ?? "",
                                onTap:
                                    () => showOptionsSheet(
                                      prefs?.currency?.description ?? "",
                                      prefs?.currency?.name ?? "",
                                      prefs?.currency?.options ?? [],
                                      (selected) {},
                                      context,
                                    ),
                              ),
                              SettingWidget(
                                title: prefs?.language?.name ?? "",
                                description: prefs?.language?.description ?? "",
                                currentValue: prefs?.language?.value ?? "",
                                onTap:
                                    () => showOptionsSheet(
                                      prefs?.language?.description ?? "",
                                      prefs?.language?.name ?? "",

                                      prefs?.language?.options ?? [],
                                      (selected) {},
                                      context,
                                    ),
                              ),
                              SettingWidget(
                                title: prefs?.dateFormat?.name ?? "",
                                description:
                                    prefs?.dateFormat?.description ?? "",
                                currentValue: prefs?.dateFormat?.value ?? "",

                                onTap:
                                    () => showOptionsSheet(
                                      prefs?.dateFormat?.description ?? "",
                                      prefs?.dateFormat?.name ?? "",

                                      prefs?.dateFormat?.options ?? [],
                                      (selected) {},
                                      context,
                                    ),
                              ),
                              SettingWidget(
                                title: prefs?.timezone?.name ?? "",
                                description: prefs?.timezone?.description ?? "",
                                currentValue: prefs?.timezone?.value ?? "",

                                onTap:
                                    () => showTimezoneDialog(
                                      context,
                                      ref,
                                      prefs?.timezone?.value ?? "",
                                    ),
                              ),
                            ],
                          )
                          : Loadingstates();
                    } catch (e) {
                      return Builderroul(
                        error: e.toString(),
                        onTap:
                            () => ref
                                .read(userPrefrenceprovider.notifier)
                                .refreshSettings(context, ref),
                        firstMessae: "Faile to load Preference Settings?",
                      );
                    }
                  },
                  error: (error, stack) {
                    try {
                      // Handle session expiration
                      if (error.toString().contains("Unauthenticated")) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ref
                              .read(authProvider.notifier)
                              .seassionExpire(context, ref);
                        });
                        return Expiresessionbody();
                      }

                      // Try to show cached data
                      // Show cached data while loading if available
                      final prefrency = ref.read(userPrefrenceprovider).value;
                      final user = prefrency?.data;
                      final prefs = user?.preferences;
                      if (prefrency != null && user != null) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              SettingWidget(
                                title: prefs?.currency?.name ?? "",
                                description: prefs?.currency?.description ?? "",
                                currentValue: prefs?.currency?.value ?? "",
                                onTap:
                                    () => showOptionsSheet(
                                      prefs?.currency?.description ?? "",
                                      prefs?.currency?.name ?? "",
                                      prefs?.currency?.options ?? [],
                                      (selected) {},
                                      context,
                                    ),
                              ),
                              SettingWidget(
                                title: prefs?.language?.name ?? "",
                                description: prefs?.language?.description ?? "",
                                currentValue: prefs?.language?.value ?? "",
                                onTap:
                                    () => showOptionsSheet(
                                      prefs?.language?.description ?? "",
                                      prefs?.language?.name ?? "",
                                      prefs?.language?.options ?? [],
                                      (selected) {},
                                      context,
                                    ),
                              ),
                              SettingWidget(
                                title: prefs?.dateFormat?.name ?? "",
                                description:
                                    prefs?.dateFormat?.description ?? "",
                                currentValue: prefs?.dateFormat?.value ?? "",
                                onTap:
                                    () => showOptionsSheet(
                                      prefs?.dateFormat?.description ?? "",
                                      prefs?.dateFormat?.name ?? "",
                                      prefs?.dateFormat?.options ?? [],
                                      (selected) {},
                                      context,
                                    ),
                              ),
                              SettingWidget(
                                title: prefs?.timezone?.name ?? "",
                                description: prefs?.timezone?.description ?? "",
                                currentValue: prefs?.timezone?.value ?? "",

                                onTap:
                                    () => showTimezoneDialog(
                                      context,
                                      ref,
                                      prefs?.timezone?.value ?? "",
                                    ),
                              ),
                              Emmergencybody(error: error.toString()),
                            ],
                          ),
                        );
                      }

                      // No cached data available
                      return Builderroul(
                        error: error.toString(),
                        onTap:
                            () => ref
                                .read(userPrefrenceprovider.notifier)
                                .refreshSettings(context, ref),
                        firstMessae: "Faile to load Preference Settings?",
                      );
                    } catch (e) {
                      return Builderroul(
                        error: e.toString(),
                        onTap:
                            () => ref
                                .read(userPrefrenceprovider.notifier)
                                .refreshSettings(context, ref),
                        firstMessae: "Faile to load Preference Settings?",
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(WidgetRef ref, BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10), // Adjust height as needed
        child: Divider(
          color: AppColors.instance.grey400,
        ), // This can be a Container, Row, etc.
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.instance.black600,
          size: 14,
        ),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetPaths.dashboardNotification, width: 30),
        ),
      ],
    );
  }

  Widget _buildAppbarBottom(WidgetRef ref) {
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Set Preferences",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 20,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
