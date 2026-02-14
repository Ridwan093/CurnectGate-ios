import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/security/provider/formState.dart';
import 'package:curnectgate/features/security/widget/security_buttom_sheet/securitybutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpecifyumberOfGuest extends ConsumerStatefulWidget {
  final String extractData;
  final String id;
  SpecifyumberOfGuest({super.key, required this.extractData, required this.id});

  @override
  ConsumerState<SpecifyumberOfGuest> createState() =>
      _SpecifyumberOfGuestState();
}

class _SpecifyumberOfGuestState extends ConsumerState<SpecifyumberOfGuest> {
  final _gusetNumberController = TextEditingController();
  @override
  void dispose() {
    _gusetNumberController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(oTpformProvider);
    final isLoading = ref.watch(oTpformProvider).isLoading;
    final size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        SingleChildScrollView(
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
                      child: Icon(
                        Icons.close,
                        color: AppColors.instance.black600,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "Specify number of guest ${widget.id}",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 18,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Manually add the number of allowes guest",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 13,
                      color: AppColors.instance.black300,
                    ),
                  ),
                ],
              ),
              _buildContainer(size: size, userName: widget.extractData),
              SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: _gusetNumberController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.instance.black400,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.instance.black400,
                      ),
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
                  onChanged: (value) {
                    ref
                        .read(oTpformProvider.notifier)
                        .updateNumberOfGust(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: _buildRequiredExcort(ref),
              ),
              SizedBox(height: 25),
              _buildBottomAction(
                ref,
                context,
                _gusetNumberController,
                formState.requiredEscort,
                widget.id,
              ),
            ],
          ),
        ),
        if (isLoading) Positioned.fill(child: _buildOverlayLoading()),
      ],
    );
  }

  Widget _buildRequiredExcort(WidgetRef ref) {
    final formState = ref.watch(oTpformProvider);
    final provider = ref.watch(oTpformProvider.notifier);
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.instance.grey300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Required Escort",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                    fontSize: 14,
                    fontWeight: FontFamilies.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Chose whether this visitor required excort",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black300,
                    fontSize: 10,
                    fontWeight: FontFamilies.bold,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 0,
            child: Switch(
              focusColor: AppColors.instance.teal300,
              thumbColor: WidgetStatePropertyAll(Colors.white),
              inactiveThumbColor: AppColors.instance.grey500,
              activeColor: AppColors.instance.teal300,
              value: formState.requiredEscort,
              onChanged: (value) {
                provider.updateRequiredEscort(value);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverlayLoading() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Center(child: Loadingstates()),
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

      child: SingleChildScrollView(
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
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,

                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomAction(
    WidgetRef ref,
    BuildContext context,
    TextEditingController controller,
    bool requiredEscort,
    String id,
  ) {
    final formState = ref.watch(oTpformProvider);
    final formprovider = ref.read(formProvider.notifier);
    // final isLoading = ref.watch(estateCodeSubmissionProvider).isLoading;
    String numberOfGust = controller.text;
    return ActionSecurityButton(
      isLoading: formState.isLoading,
      label: 'Next',
      onPressed:
          formState.numberOfVisitorValid
              ? () {
                formprovider.grantAccess(
                  context: context,
                  numberofguest: numberOfGust,
                  requiredEscort: requiredEscort,
                  id: id,
                  ref: ref,
                );
                controller.clear();
              }
              : null,
    );
  }
}
