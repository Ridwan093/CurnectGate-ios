import 'dart:developer';
import 'dart:io';

import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/config/biometric_faceID/Helper/device_info_helper.dart';
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/navigation/back_manageent/back_widget/back_navigator.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/screen_managment.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/screen/loading_screen/loading_page.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/screen/onboard_code.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:curnectgate/features/userProfile/Login_setting/state/biometric_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

///flutter_screenutil: ^5.9.0
class SignIn extends BaseVerificationScreen {
  const SignIn({super.key})
    : super(
        currentStep: 4,
        totalSteps: 5,
        title: "Hi",
        description: 'Sign in to continue',
      );

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String name = "";

  void _submitForm() {
    final email = _emailController.text;
    final pass = _passwordController.text;

    log('Email: $email');
    log('Phone: $pass');

    ref
        .read(formProvider.notifier)
        .logIn(context: context, email: email, password: pass, ref: ref);

    _emailController.clear();
    _passwordController.clear();
  }

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  void getUserName() async {
    final userName = await SharedPrefsService().getUserName();
    if (userName != null) {
      setState(() {
        name = userName;
      });

      log(userName);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final state = ref.watch(formProvider);

    return BackButtonHandler(
      child: Scaffold(
        appBar: state.loginLodaing ? null : _buildAppBar(),
        bottomNavigationBar:
            state.loginLodaing
                ? null
                : SafeArea(
                  top: false,
                  child: _buildBottomAction(
                    _emailController.text,
                    _passwordController.text,
                  ),
                ),
        body:
            state.loginLodaing
                ? AppLoader(size: LoaderSize.large, type: LoaderType.circular)
                : _biuldbody(size),
      ),
    );
  }

  Widget _biuldbody(Size size) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: _buildContent(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    // final backPressNotifier = ref.read(backPressProvider.notifier);
    // final router = GoRouter.of(context);
    return AppBar(
      // leading: InkWell(
      //   onTap: () {
      //     backPressNotifier.reset();
      //     router.pop();
      //   },
      //   child: const Icon(Icons.arrow_back_ios_new),
      // ),
      actions: [_buildTextButton()],
    );
  }

  Widget _buildTextButton() {
    return InkWell(
      onTap: () {
        // domin rought change later
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EstateCodeVerificationScreen(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Text(
          "Create an account",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 12,
            color: AppColors.instance.black500,
            fontWeight: FontFamilies.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return FutureBuilder<bool>(
      future: DeviceInfoHelper.isBiometricAvailable(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Loadingstates();
        }

        final canUseBiometric = snapshot.data ?? false;
        final isBiometricEnabled = ref.read(biometricPrefProvider);

        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              Text(
                "${widget.title} $name.👋🏻",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.description,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                ),
              ),

              const SizedBox(height: 30),
              ReusabelProfileForm(
                controller: _emailController,
                fieldKey: 'email',
                fieldType: FieldType.email,
                hintText: 'Enter email address',
                label: 'Email',
                onChanged: (value) {},
                onValidationChanged: (validation) {
                  ref
                      .read(formProvider.notifier)
                      .updateField(
                        field: 'email',
                        isValid: validation.isValid,
                        errorMessage: validation.error,
                      );
                },
              ),
              const SizedBox(height: 20),
              ReusabelProfileForm(
                controller: _passwordController,
                hintText: 'Enter password',
                label: 'Password',
                fieldKey: 'password',
                fieldType: FieldType.password,
                onChanged: (value) {},
                onValidationChanged: (validation) {
                  ref
                      .read(formProvider.notifier)
                      .updateField(
                        field: 'password',
                        isValid: validation.isValid,
                        errorMessage: validation.error,
                      );
                },
              ),

              _buildForgotButton(),
              if (isBiometricEnabled && canUseBiometric)
                _buildBiometricWidget(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildForgotButton() {
    return InkWell(
      onTap: () {
        //domin rougte chang later PasswordReset
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => PasswordReset()),
        // );
        context.pushNamed(AppRoutes.passForgot);
      },
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Center(
          child: Text(
            "Forgot password?",
            strutStyle: StrutStyle.fromTextStyle(
              TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 13,
                color: AppColors.instance.black500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBiometricWidget() {
    final bool isIOS = Platform.isIOS;

    return Column(
      children: [
        const SizedBox(height: 40),
        Row(
          children: [
            Expanded(child: Divider(color: AppColors.instance.grey200)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Fast login with",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 12,
                  color: AppColors.instance.black300,
                ),
              ),
            ),
            Expanded(child: Divider(color: AppColors.instance.grey200)),
          ],
        ),
        const SizedBox(height: 30),
        Center(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  ref
                      .read(formProvider.notifier)
                      .signInwithFaceID(context: context, ref: ref, slug: "");
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.instance.grey200.withOpacity(0.5),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    isIOS ? CupertinoIcons.viewfinder : Icons.fingerprint,
                    size: 42,
                    color: AppColors.instance.teal300,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                isIOS ? "Face ID" : "Fingerprint",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black400,
                  fontSize: 13,
                  fontWeight: FontFamilies.medium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomAction(String email, String pass) {
    return ActionButton(
      label: 'Sign in',
      onPressed: email.isNotEmpty && pass.isNotEmpty ? _submitForm : null,
    );
  }
}
