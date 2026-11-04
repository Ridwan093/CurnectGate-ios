import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/general_notification_count_widget.dart';
import 'package:curnectgate/features/userProfile/Privacy_setting/model/privacy.dart';
import 'package:curnectgate/features/userProfile/Privacy_setting/model/profile_visibility.dart';
import 'package:curnectgate/features/userProfile/Privacy_setting/provider/privacy_provider.dart';
import 'package:curnectgate/features/userProfile/notification_setting/widget/reusabTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserPrivacySettings extends ConsumerWidget {
  const UserPrivacySettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(ref, context),
      body: _buildBody(ref, context),
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
              "Set Privacy",
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

  PreferredSizeWidget _buildAppBar(WidgetRef ref, BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10),
        child: Divider(
          color: AppColors.instance.black100,
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

  /// Builds privacy tiles only for fields the backend actually returned (non-null).
  Widget _buildTiles(
    Privacy privacy,
    FormNotifier formProviders,
    BuildContext context,
    WidgetRef ref,
  ) {
    final tiles = <Widget>[];

    void addIfPresent(ProfileVisibility? field, String fallbackKey) {
      if (field == null) return;
      tiles.add(
        BuildListTile(
          ref: ref,
          context: context,
          dec: field.description ?? '',
          title: field.name ?? fallbackKey,
          isEnabled: field.value ?? false,
          onChanged: (value) async {
            formProviders.updateAppPrivacy(
              slug: field.name ?? fallbackKey,
              context: context,
              key: field.key ?? fallbackKey,
              value: value,
              ref: ref,
            );
          },
        ),
      );
    }

    addIfPresent(privacy.profileVisibility, 'profile_visibility');
    addIfPresent(privacy.showEmail, 'show_email');
    addIfPresent(privacy.showPhone, 'show_phone');

    if (tiles.isEmpty) {
      return EmptyBodys(message: "No Privacy Settings available.");
    }

    return Column(children: tiles);
  }

  Widget _buildBody(WidgetRef ref, BuildContext context) {
    final privacyAsync = ref.watch(userPrivacyprovider);
    final formProviders = ref.read(formProvider.notifier);

    return RefreshIndicator(
      color: AppColors.instance.yellow500,
      onRefresh:
          () =>
              ref
                  .read(userPrivacyprovider.notifier)
                  .refreshSettings(context, ref),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildAppbarBottom(ref),
            SizedBox(height: 10),

            ///-------------- DYNAMIC: Only renders what backend returns ------------->
            privacyAsync.when(
              data: (privacyData) {
                final privacys = privacyData?.data?.privacy;

                if (privacys == null) {
                  return EmptyBodys(message: "No Privacy Settings.");
                }

                return _buildTiles(privacys, formProviders, context, ref);
              },
              loading: () {
                // Show cached data during loading if available, else spinner
                final cached = ref.read(userPrivacyprovider).value;
                final privacys = cached?.data?.privacy;

                if (privacys != null) {
                  return _buildTiles(privacys, formProviders, context, ref);
                }
                return Loadingstates();
              },
              error: (error, stack) {
                if (error.toString().contains("Unauthorized")) {
                  return Expiresessionbody();
                }

                // Try to show cached data on error
                final cached = ref.read(userPrivacyprovider).value;
                final privacys = cached?.data?.privacy;

                if (privacys != null) {
                  return _buildTiles(privacys, formProviders, context, ref);
                }

                return Builderroul(
                  error: error.toString(),
                  onTap:
                      () =>
                          ref
                              .read(userPrivacyprovider.notifier)
                              .refreshSettings(context, ref),
                  firstMessage: "Failed to load Privacy Settings.",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
