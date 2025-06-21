import 'dart:developer';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/violation/widget/violation_form_bottom_sheet.dart';
import 'package:curnectgate/features/chat/data/provider/chat_provier.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/chat_setting_widget.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/emergency_widget.dart';
import 'package:curnectgate/features/chat/presentation/screens/messagbody.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/model/venodrLod_model.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_screen/work_requst_screen.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomsheetDetails extends ConsumerWidget {
  final String headertitle;
  final String headersubtitle;
  final BottomSheetView bottom;
  VendorLogModel? vendor;

  BottomsheetDetails({
    super.key,
    required this.headertitle,
    required this.headersubtitle,
    required this.bottom,
    this.vendor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (bottom) {
      case BottomSheetView.chatSettings:
        return ChatSettingsBottomSheet();
      case BottomSheetView.messageEmergency:
        return EmergencyWidget();

      case BottomSheetView.reportviolation:
        return ViolationFormBottomSheet(
          title: headertitle,
          subtitle: headersubtitle,
        );
      default:
        return Column(
          key: const ValueKey('userDetails'),
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header section
            Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ),
                Text(
                  headertitle,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontFamilies.bold,
                    fontSize: 20,
                    color: AppColors.instance.black600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  headersubtitle,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 12,
                    color: AppColors.instance.black300,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),

            // Primary option tile
            _buildPrimaryOptionTile(bottom, ref, context),
            const SizedBox(height: 5),

            // Secondary option tile
            _buildSecondaryOptionTile(bottom, ref, context),

            if (bottom == BottomSheetView.messageuplodefile) ...[
              const SizedBox(height: 5),
              _buildthirdaryOptionTile(bottom, ref, context),
            ],

            const SizedBox(height: 5),
          ],
        );
    }
  }

  // Switch-case for the first ListTile (e.g., Edit or Set permissions)
  Widget _buildPrimaryOptionTile(
    BottomSheetView bottom,
    WidgetRef ref,
    BuildContext context,
  ) {
    late VoidCallback onTap;
    late Widget leading;
    late String title;

    final chatNotifier = ref.watch(chatProvider.notifier);

    switch (bottom) {
      case BottomSheetView.vendorLog:
        onTap = () {
          log(vendor!.vendorName);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubmitWorkOrderPage(vendor: vendor),
            ),
          );
        };
        leading = CircleAvatar(
          backgroundColor: AppColors.instance.grey400,
          child: Center(
            child: Icon(
              Icons.drive_file_rename_outline_outlined,
              color: AppColors.instance.black600,
            ),
          ),
        );
        title = "Edit vendor Log";
        break;

      case BottomSheetView.permissions:
        onTap = () {
          ref.read(bottomSheetStateProvider.notifier).state =
              BottomSheetView.permissions;
        };
        leading = CircleAvatar(
          backgroundColor: AppColors.instance.grey400,
          backgroundImage: AssetImage(AssetPaths.permission),
        );
        title = "Set permissions";
        break;
      case BottomSheetView.startConversation:
        onTap = () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MessageScreens()),
          );
        };
        leading = CircleAvatar(
          backgroundColor: AppColors.instance.grey400,
          backgroundImage: AssetImage(AssetPaths.searchUser),
        );
        title = "Reach out to an estate Comittee";
        break;

      case BottomSheetView.messageuplodefile:
      default:
        onTap = () async {
          Navigator.of(context).pop();
          await chatNotifier.pickImagefromcamera();
        };
        leading = Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.instance.grey400,
          ),
          child: Center(
            child: Image.asset(AssetPaths.takephoto, width: 25, height: 25),
          ),
        );

        // CircleAvatar(
        //   backgroundColor: AppColors.instance.grey400,
        //   backgroundImage: AssetImage(AssetPaths.takephoto),
        // );
        title = "Take Photo";
        break;
    }

    return Container(
      height: 100,
      color: AppColors.instance.grey300,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        onTap: onTap,
        leading: leading,
        title: Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  // Switch-case for the second ListTile (e.g., Revoke or Remove)
  Widget _buildSecondaryOptionTile(
    BottomSheetView bottom,
    WidgetRef ref,
    BuildContext context,
  ) {
    late VoidCallback onTap;
    late Widget leading;
    late String title;

    final chatNotifier = ref.watch(chatProvider.notifier);
    switch (bottom) {
      case BottomSheetView.vendorLog:
        onTap = () {
          ref.read(bottomSheetStateProvider.notifier).state =
              BottomSheetView.revokevendorconfirm;
        };
        leading = CircleAvatar(
          backgroundColor: AppColors.instance.error300,
          child: Center(
            child: Icon(Icons.restore, color: AppColors.instance.error500),
          ),
        );
        title = "Revoke vendor Log";
        break;

      case BottomSheetView.permissions:
        onTap = () {
          ref.read(bottomSheetStateProvider.notifier).state =
              BottomSheetView.deleteConfirmation;
        };
        leading = CircleAvatar(
          backgroundColor: AppColors.instance.error300,
          backgroundImage: AssetImage(AssetPaths.remove),
        );
        title = "Remove family member";
        break;
      case BottomSheetView.startConversation:
        onTap = () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MessageScreens()),
          );
        };
        leading = CircleAvatar(
          backgroundColor: AppColors.instance.error300,
          backgroundImage: AssetImage(AssetPaths.reachout),
        );
        title = "Reach out to an estate Security";
        break;
      case BottomSheetView.messageuplodefile:
        onTap = () async {
          Navigator.of(context).pop();
          await chatNotifier.pickImage();
        };
        leading = Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.instance.grey400,
          ),
          child: Center(
            child: Image.asset(
              AssetPaths.choosfromgallery,
              width: 25,
              height: 25,
            ),
          ),
        );
        title = "Choose from Gallery";
        break;
      case BottomSheetView.messageEmergency:
      default:
        onTap = () {};
        leading = SizedBox();
        title = "";
        break;
    }
    //// we only need one container for emergency?
    return bottom == BottomSheetView.messageEmergency
        ? SizedBox()
        : Container(
          height: 100,
          color: AppColors.instance.grey300,
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            onTap: onTap,
            leading: leading,
            title: Text(
              title,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                fontSize: 15,
              ),
            ),
          ),
        );
  }

  Widget _buildthirdaryOptionTile(
    BottomSheetView bottom,
    WidgetRef ref,
    BuildContext context,
  ) {
    late VoidCallback onTap;
    late Widget leading;
    late String title;
    final chatNotifier = ref.watch(chatProvider.notifier);

    switch (bottom) {
      case BottomSheetView.messageuplodefile:
      default:
        onTap = () async {
          Navigator.of(context).pop();
          await chatNotifier.pickFile();
        };
        leading = Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.instance.grey400,
          ),
          child: Center(
            child: Image.asset(AssetPaths.chooseFile, width: 25, height: 25),
          ),
        );
        title = "Choose file";
        break;
    }

    return Container(
      height: 100,
      color: AppColors.instance.grey300,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        onTap: onTap,
        leading: leading,
        title: Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
