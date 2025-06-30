import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/member_management/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/security/provider/formState.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/securitybutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpecifyumberOfGuest extends ConsumerWidget {
  const SpecifyumberOfGuest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.close, color: AppColors.instance.black600),
                ),
              ),
              SizedBox(height: 40),
              Text(
                "Specify number of guest",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 18,
                  color: AppColors.instance.black600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Manually add the member of allowes guest",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 13,
                  color: AppColors.instance.black300,
                ),
              ),
            ],
          ),
          _buildContainer(size: size, userName: "Tomiwa Bayero"),
          SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.instance.black400),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.instance.black400),
                ),

                labelStyle: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                  fontSize: 13,
                ),
                hintStyle: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                  fontSize: 13,
                ),
                hintText: "(eg. 10,1,2,3,4)",
                labelText: "Number of Allowed Guest",
              ),
            ),
          ),
          SizedBox(height: 25),
          _buildBottomAction(ref, context),
        ],
      ),
    );
  }

  Widget _buildContainer({required Size size, required String userName}) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      height: 60,
      width: size.width,
      decoration: BoxDecoration(
        color: AppColors.instance.teal100,

        borderRadius: BorderRadius.circular(10),
      ),

      child: Column(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Name",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.teal400,
            ),
          ),

          Text(
            userName,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,

              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomAction(WidgetRef ref, BuildContext context) {
    final formState = ref.watch(oTpformProvider);
    // final isLoading = ref.watch(estateCodeSubmissionProvider).isLoading;

    return ActionSecurityButton(
      label: 'Next',
      onPressed:
          formState.allValid
              ? () {
                Navigator.pop(context);
                showUserBottomSheet(
                  context: context,
                  headertitle: "",
                  headersubtitle: "",
                  ref: ref,
                  bottom: BottomSheetView.valdationConfrm,
                );
              }
              : null,
    );
  }
}
