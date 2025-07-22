import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> showTimezoneDialog(
  BuildContext context,
  WidgetRef ref,
  String initialValue,
) async {
  final TextEditingController controller = TextEditingController(
    text: initialValue,
  );
  final formProviders = ref.read(formProvider.notifier);

  await showDialog<String>(
    context: context,
    builder: (ctx) {
      return Consumer(
        builder: (context, ref, _) {
          final state = ref.watch(formProvider);

          return AlertDialog(
            title: Text(
              'Enter Timezone',
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
              ),
            ),
            content: TextField(
              controller: controller,
              cursorColor: AppColors.instance.grey400,
              decoration: InputDecoration(
                hintText: 'e.g., Africa/Lagos',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.instance.black300),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.instance.black300,
                    width: 1.5,
                  ),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final input = controller.text.trim();

                  if (input.isEmpty) {
                    showCustomSuccessToast(
                      context: context,
                      message: "Timezone required",
                      color: AppColors.instance.grey200,
                      icon: Icons.check_circle,
                      iconColors: AppColors.instance.grey200,
                      positionNumber: 70,
                    );
                    return;
                  }

                  formProviders.updateAppPrefernce(
                    context: context,
                    key: "timezone",
                    value: input,
                    ref: ref,
                  );
                },
                child:
                    state.prevencyLoading
                        ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: AppColors.instance.yellow500,
                            strokeWidth: 2,
                          ),
                        )
                        : Text(
                          'Submit',
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            color: AppColors.instance.black600,
                          ),
                        ),
              ),
            ],
          );
        },
      );
    },
  );
}
