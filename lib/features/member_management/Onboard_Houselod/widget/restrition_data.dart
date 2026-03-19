import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/restrict_provider.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/restriction_content.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestrictIonStatus extends ConsumerWidget {
  final int id;

  const RestrictIonStatus({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(formProvider.notifier);
    final permissionAsync = ref.watch(getRestrictionStatus);

    return permissionAsync.when(
      data: (res) {
        try {
          final ress = res?.data;
          if (ress != null) {
            return RestrictionContent(
              isLoading: false,
              data: ress,
              title:
                  (ress.isRestricted ?? false)
                      ? "Disable Restrictions"
                      : "Enable Restrictions",
              value: ress.isRestricted ?? false,
              onChanged: notifier.updateRestrictionValue,
            );
          } else {
            return RestrictionContent(
              isLoading: false,
              title: "Enable Restrictions",
              value: false,
              onChanged: notifier.updateRestrictionValue,
            );
          }
        } catch (e) {
          return RestrictionContent(
            isLoading: false,
            title: "Enable Restrictions",
            value: false,
            onChanged: notifier.updateRestrictionValue,
          );
        }
      },
      loading: () {
        return RestrictionContent(
          isLoading: true,
          title: "Enable Restrictions",
          value: false,
          onChanged: notifier.updateRestrictionValue,
        );
      },
      error: (error, stack) {
        try {
          // Handle session expiration
          if (error.toString().contains("Unauthorized")) {
            return RestrictionContent(
              isLoading: false,
              title: "Enable Restrictions",
              value: false,
              onChanged: notifier.updateRestrictionValue,
            );
          }
          // Try to show cached data
          final cachedetting = ref.read(getRestrictionStatus).value;
          if (cachedetting?.data != null) {
            final data = cachedetting?.data;
            return RestrictionContent(
              data: data,
              isLoading: false,
              title: "Enable Restrictions",
              value: data?.isRestricted ?? false,
              onChanged: notifier.updateRestrictionValue,
            );
          }

          // No cached data available
          return RestrictionContent(
            isLoading: false,
            title: "Enable Restrictions",
            value: false,
            onChanged: notifier.updateRestrictionValue,
          );
        } catch (e) {
          return RestrictionContent(
            isLoading: false,
            title: "Enable Restrictions",
            value: false,
            onChanged: notifier.updateRestrictionValue,
          );
        }
      },
    );
  }
}
