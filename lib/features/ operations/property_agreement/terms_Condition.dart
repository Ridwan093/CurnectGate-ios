import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/property_agreement/widget/termsAndCondition.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/%20operations/property_agreement/provider/agreement_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:signature/signature.dart';

class TermsAndConditionScreen extends ConsumerStatefulWidget {
  const TermsAndConditionScreen({super.key});

  @override
  ConsumerState<TermsAndConditionScreen> createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState
    extends ConsumerState<TermsAndConditionScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 6,
    penColor: Colors.black,
    strokeCap: StrokeCap.square,
    strokeJoin: StrokeJoin.bevel,
    exportBackgroundColor: Colors.transparent,
  );

  int selectedTab = 0; // 0 = Type Name, 1 = Draw Signature

  @override
  void dispose() {
    _nameController.dispose();
    _signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        ref.watch(formProvider).termsAndCondintionLoading ?? false;
    return Scaffold(
      backgroundColor: AppColors.instance.grey200,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                
                    const SizedBox(height: 20),

                
     
                    const SizedBox(height: 30),

              
                    Text(
                      "Terms and conditions",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontFamilies.bold,
                        fontSize: 18,
                        color: AppColors.instance.black600,
                      ),
                    ),
                    const SizedBox(height: 16),

                
                    TermsAndConditionData(),
                    const SizedBox(height: 30),

                    
                    const SizedBox(height: 20),

                  
                    Consumer(
                      builder: (context, ref, child) {
                        final agreementAsync = ref.watch(agreementProvider);
                        final isAccepted = agreementAsync.valueOrNull?.data?.agreements?.termsAndConditions?.accepted == true;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: isAccepted ? null : () {
                                    ref
                                        .read(formProvider.notifier)
                                        .termsAndConditon(
                                          context: context,
                                          ref: ref,
                                        );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.instance.black600,
                                    foregroundColor: AppColors.instance.grey200,
                                    disabledBackgroundColor: AppColors.instance.grey400,
                                    disabledForegroundColor: AppColors.instance.grey300,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    isAccepted ? "Accepted" : "Accept",
                                    style: TextStyle(
                                      fontFamily: FontFamilies.interDisplay,
                                      fontWeight: FontFamilies.medium,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: isAccepted ? null : () {
                                    showUserBottomSheet(
                                      context: context,
                                      headertitle: "",
                                      headersubtitle: "",
                                      ref: ref,
                                      bottom: BottomSheetView.termsAndCondition,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.instance.grey200,
                                    foregroundColor: AppColors.instance.black600,
                                    disabledBackgroundColor: AppColors.instance.grey200,
                                    disabledForegroundColor: AppColors.instance.grey400,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    "Decline",
                                    style: TextStyle(
                                      fontFamily: FontFamilies.interDisplay,
                                      fontWeight: FontFamilies.medium,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (isLoading) Positioned.fill(child: _loadingBody()),
        ],
      ),
    );
  }

  Widget _loadingBody() {
    return Container(
      color: AppColors.instance.grey300.withOpacity(.8),
      child: Loadingstates(),
    );
  }
}
