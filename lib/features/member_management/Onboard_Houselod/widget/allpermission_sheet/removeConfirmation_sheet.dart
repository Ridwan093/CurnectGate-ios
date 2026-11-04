import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/allpermission_sheet/button.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RemoveconfirmationSheet extends ConsumerWidget {
  final int? id;
  final String userName;
  const RemoveconfirmationSheet({
    super.key,
    required this.id,
    required this.userName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.read(formProvider.notifier);
    final isLoading = ref.watch(formProvider).removedHouseHoldLoading ?? false;
    return Column(
      key: const ValueKey('deleteConfirmation'),
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed:
                () =>
                    ref.read(bottomSheetStateProvider.notifier).state =
                        BottomSheetView.userDetails,
            icon: Icon(Icons.close, color: AppColors.instance.black600),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Are you sure you want to remove\n $userName?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black600,
          ),
        ),
        const SizedBox(height: 70),
        Buttonss(
          onPressed: () {
            form.removedHouseHoold(context: context, id: id ?? 0, ref: ref);
          },
          child:
              isLoading
                  ? Loadingstates()
                  : Text(
                    "Yes, Continue",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 15,
                      fontWeight: FontFamilies.medium,
                      color: AppColors.instance.grey200,
                    ),
                  ),
        ),
      ],
    );
  }
}
