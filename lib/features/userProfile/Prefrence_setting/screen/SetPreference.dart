import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/general_notification_count_widget.dart';
import 'package:curnectgate/features/userProfile/Prefrence_setting/model/option.dart';
import 'package:curnectgate/features/userProfile/Prefrence_setting/model/preference.dart';
import 'package:curnectgate/features/userProfile/Prefrence_setting/model/preferences.dart';
import 'package:curnectgate/features/userProfile/Prefrence_setting/provider/prefrence_provider.dart';
import 'package:curnectgate/features/userProfile/Prefrence_setting/widget/Setting_widget.dart';
import 'package:curnectgate/features/userProfile/Prefrence_setting/widget/prferenc_bottom.dart';
import 'package:curnectgate/features/userProfile/Prefrence_setting/widget/time_zone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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

  /// Builds preference widgets only for fields the backend actually returned (non-null).
  /// Timezone is rendered with a dialog; all others use the options bottom sheet.
  Widget _buildTiles(
    Preferences prefs,
    BuildContext context,
    WidgetRef ref,
  ) {
    final tiles = <Widget>[];

    void addIfPresent(Preference? field, String fallbackKey) {
      if (field == null) return;

      final isTimezone = (field.key ?? fallbackKey) == 'timezone';

      tiles.add(
        SettingWidget(
          title: field.name ?? fallbackKey,
          description: field.description ?? '',
          currentValue: field.value ?? '',
          onTap:
              isTimezone
                  ? () => showTimezoneDialog(context, ref, field.value ?? '')
                  : () => showOptionsSheet(
                    field.description ?? '',
                    field.name ?? fallbackKey,
                    field.options ?? [],
                    (selected) {},
                    context,
                  ),
        ),
      );
    }

    addIfPresent(prefs.currency, 'currency');
    addIfPresent(prefs.language, 'language');
    addIfPresent(prefs.dateFormat, 'date_format');
    addIfPresent(prefs.timezone, 'timezone');

    if (tiles.isEmpty) {
      return EmptyBodys(message: "No Preference Settings available.");
    }

    return Column(children: tiles);
  }

  Widget _buildBody(WidgetRef ref, BuildContext context) {
    final prefrencyAsync = ref.watch(userPrefrenceprovider);

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () =>
              ref
                  .read(userPrefrenceprovider.notifier)
                  .refreshSettings(context, ref),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              _buildAppbarBottom(ref),
              SizedBox(height: 10),

              ///-------------- DYNAMIC: Only renders what backend returns ------------->
              prefrencyAsync.when(
                data: (preference) {
                  final prefs = preference?.data.preferences;

                  if (prefs == null) {
                    return EmptyBodys(message: "No Preference Settings.");
                  }

                  return _buildTiles(prefs, context, ref);
                },
                loading: () {
                  // Show cached data during loading if available, else spinner
                  final cached = ref.read(userPrefrenceprovider).value;
                  final prefs = cached?.data.preferences;

                  if (prefs != null) {
                    return _buildTiles(prefs, context, ref);
                  }
                  return Loadingstates();
                },
                error: (error, stack) {
                  if (error.toString().contains("Unauthorized")) {
                    return Expiresessionbody();
                  }

                  // Try to show cached data on error
                  final cached = ref.read(userPrefrenceprovider).value;
                  final prefs = cached?.data.preferences;

                  if (prefs != null) {
                    return _buildTiles(prefs, context, ref);
                  }

                  return Builderroul(
                    error: error.toString(),
                    onTap:
                        () =>
                            ref
                                .read(userPrefrenceprovider.notifier)
                                .refreshSettings(context, ref),
                    firstMessage: "Failed to load Preference Settings.",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(WidgetRef ref, BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10),
        child: Divider(
          color: AppColors.instance.grey400,
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.instance.black600,
          size: 14,
        ),
      ),

      actions: [
        NotificationCount(
          onTap: () {
            context.pushNamed(AppRoutes.notification);
          },
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
