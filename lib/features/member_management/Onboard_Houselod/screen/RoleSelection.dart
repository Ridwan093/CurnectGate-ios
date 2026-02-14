import 'dart:developer';

import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/screen_managment.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/screen/add_Coowner_Property_management.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/button/estate_button.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/progresscontainer.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/radios_widget/customradioTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MemberSelection extends BaseVerificationScreen {
  const MemberSelection({super.key})
    : super(
        currentStep: 2,
        totalSteps: 5,
        title: "Add a new member",
        description: "",
      );

  @override
  ConsumerState<MemberSelection> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends ConsumerState<MemberSelection> {
  String? selectedRole;
  final Map<String, String> roleDescriptions = {
    'Co-owner':
        'Shares legal ownership of the property with full ownership access',
    'Property manager':
        'Oversees  property operations, maintenance, and resident communications.',
    'Family member':
        'Some related by blood, marriage, and adoptionwith limited app access.',
    'Staff':
        'An authorized household employee (e.g., cleaner, driver) with controlled access. ',
    'Tenant':
        'An individual who rents and lives in the property as their main residence, with full access to all areas. ',
  };
  void _submitForm() {
    if (selectedRole == null) {
      log("please selecte role?");
    } else if (selectedRole != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddCOowner(selectedRole: selectedRole!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _biuldbody(size),
    );
  }

  Widget _biuldbody(Size size) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(children: [_buildContent(), _buildBottomAction()]),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: InkWell(
        onTap: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new),
      ),
      actions: [],
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          const ProgressIndicators(
            currentStep: 4,
            totalSteps: 5,
            height: 2.0,
            borderRadius: 4.0,
          ),
          const SizedBox(height: 55),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.description,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
            ),
          ),
          const SizedBox(height: 14),
          _buildroleSelectedwidget(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildroleSelectedwidget() {
    return Column(
      children:
          roleDescriptions.entries.map((entry) {
            final role = entry.key;
            final description = entry.value;

            return CustomRadioTile(
              role: role,
              description: description,
              selectedRole: selectedRole,
              onChanged: (value) {
                setState(() {
                  selectedRole = value;
                });
              },
            );
          }).toList(),
    );
  }

  Widget _buildBottomAction() {
    // final isLoading = ref.watch(estateCodeSubmissionProvider).isLoading;

    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Consumer(
        builder: (context, ref, _) {
          return ActionButton(
            label: 'Continue',
            onPressed: selectedRole != null ? _submitForm : null,
          );
        },
      ),
    );
  }
}
