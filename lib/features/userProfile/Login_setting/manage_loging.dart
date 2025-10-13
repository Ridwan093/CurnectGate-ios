import 'dart:io';

import 'package:curnectgate/core/config/biometric_faceID/Helper/device_info_helper.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/permission_loading_provider.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/userProfile/Login_setting/state/biometric_provider.dart';
import 'package:curnectgate/features/userProfile/notification_setting/widget/oldSchoolSwcth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ManageLoging extends ConsumerStatefulWidget {
  ManageLoging({super.key});

  @override
  ConsumerState<ManageLoging> createState() => _ManageLogingState();
}

class _ManageLogingState extends ConsumerState<ManageLoging> {
  bool _isAvilable = false;
  String _biometricType = "none";

  @override
  void initState() {
    super.initState();
    _loadSetting();
  }

  Future<void> _loadSetting() async {
    bool isavailables = await isAvailable();
    String isType = await getBiometricType();
    setState(() {
      _biometricType = isType;
      _isAvilable = isavailables;
    });
  }

  Future<String> getBiometricType() async {
    return await DeviceInfoHelper.getBiometricType();
  }

  Future<bool> isAvailable() async {
    return await DeviceInfoHelper.isBiometricAvailable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(context), body: _buildBody(context, ref));
  }

  String isFinger() {
    if (Platform.isAndroid) {
      return "Biometrics";
    } else if (Platform.isIOS) {
      return "Face ID";
    } else {
      return "Biometrics";
    }
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,

      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.instance.black600,
          size: 18,
        ),
      ),
      leadingWidth: 25,
      title: Text(
        "Account settings",
        style: TextStyle(
          color: AppColors.instance.black600,
          fontFamily: FontFamilies.interDisplay,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Password",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontWeight: FontFamilies.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          _buildpassBody(
            children: [
              _buildReusableTiles(
                title: "Change Password",
                onTap: () {
                  showUserBottomSheet(
                    context: context,
                    headertitle: "",
                    headersubtitle: "",
                    ref: ref,
                    bottom: BottomSheetView.changePassword,
                  );
                },
              ),
              // _buildReusableTiles(
              //   title: "Forgort Password",
              //   onTap: () {
              //     context.pushNamed(AppRoutes.passForgot);
              //   },
              // ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Biometrics",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontWeight: FontFamilies.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          _buildpassBody(children: [_buildfingerPrint(ref)]),
          SizedBox(height: 10),
          Text(
            "Profile Setting",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontWeight: FontFamilies.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          _buildpassBody(
            children: [
              _buildReusableTiles(
                title: "Change Profile Picture",
                onTap: () {
                  showUserBottomSheet(
                    context: context,
                    headertitle: "",
                    headersubtitle: "",
                    ref: ref,
                    bottom: BottomSheetView.profilePiceUpdate,
                  );
                },
              ),
              _buildReusableTiles(
                title: "Change Profile Name",
                onTap: () {
                  showUserBottomSheet(
                    context: context,
                    headertitle: "",
                    headersubtitle: "",
                    ref: ref,
                    bottom: BottomSheetView.profileUpdat,
                  );
                },
              ),
              _buildReusableTiles(
                title: "Deactive Account",
                onTap: () {
                  showUserBottomSheet(
                    context: context,
                    headertitle: "",
                    headersubtitle: "",
                    ref: ref,
                    bottom: BottomSheetView.deactivateAccount,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildpassBody({required List<Widget> children}) {
    return Material(
      elevation: .4,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: children),
      ),
    );
  }

  Widget _buildReusableTiles({
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: AppColors.instance.black500,
          fontSize: 15,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: AppColors.instance.black400,
        size: 16,
      ),
    );
  }

  Widget _buildfingerPrint(WidgetRef ref) {
    final isLoading = ref.watch(permissionLoadingProvider("print"));
    final form = ref.read(formProvider.notifier);
    final isBiometricEnabled = ref.watch(biometricPrefProvider);
    return ListTile(
      title: Text(
        "Log in with ${isFinger()}",
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: AppColors.instance.black500,
          fontSize: 15,
        ),
      ),
      trailing: OldSchoolSwitch(
        isLoading: isLoading,
        value: isBiometricEnabled,
        onChanged: (value) async {
          if (_isAvilable) {
            form.enableFingerPrint(
              context: context,
              value: value,
              ref: ref,
              slug: "print",
            );
          } else {
            showCustomSuccessToast(
              context: context,
              message: "Device dose not support ${isFinger()}",
              color: AppColors.instance.grey200,
              icon: Icons.error,
              iconColors: AppColors.instance.black600,
              positionNumber: 50,
            );
          }
        },
      ),
    );
  }
}
