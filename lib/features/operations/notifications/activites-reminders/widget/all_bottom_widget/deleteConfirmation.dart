import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Deleteconfirmation extends ConsumerWidget {
  final String title;
  final int id;
  const Deleteconfirmation({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isLoading = ref.watch(reminderProvider).isLoading;
    final form = ref.read(formProvider.notifier);
    return Column(
      key: const ValueKey('deleteVendorConfirmation'),
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Icons.close, color: AppColors.instance.black600),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Cancel $title?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black600,
          ),
        ),
        Text(
          'Are you sure you want to cancel $title?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.medium,
            color: AppColors.instance.black300,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 70),
        _button(
          isLoading: _isLoading,
          onPressed: () {
            // Add your delete logic here
            form.updateReminderTocomplet(
              context: context,
              type: "cancel",
              id: id.toString(),
              ref: ref,
            );
          },
          buttiontitle: "Yes, cancel",
        ),
      ],
    );
  }

  Widget _button({
    required VoidCallback onPressed,
    required String buttiontitle,
    required bool isLoading,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.instance.black600,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child:
              isLoading
                  ? Loadingstates()
                  : Text(
                    buttiontitle,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 15,
                      fontWeight: FontFamilies.medium,
                      color: AppColors.instance.grey200,
                    ),
                  ),
        ),
      ),
    );
  }
}
