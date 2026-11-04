import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_provider/workformprovider.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Revokeworkoder extends ConsumerWidget {
  final int id;
  const Revokeworkoder({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(workOrderFormProvider.notifier);
    return Column(
      key: const ValueKey('deleteVendorConfirmation'),
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              state.setLoading(false);
              context.pop();
            },
            icon: Icon(Icons.close, color: AppColors.instance.black600),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Revoke vendor Log?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black600,
          ),
        ),
        Text(
          'Are you sure you want to revoke vendor Log?',
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
          onPressed: () {
            ref
                .read(formProvider.notifier)
                .revorkWorkOder(context: context, id: id, ref: ref);
          },
          buttiontitle: "Yes, Revoke",
          ref: ref,
        ),
      ],
    );
  }

  Widget _button({
    required VoidCallback onPressed,
    required String buttiontitle,
    required WidgetRef ref,
  }) {
    final state = ref.watch(workOrderFormProvider);
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
              state.isLoading
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
