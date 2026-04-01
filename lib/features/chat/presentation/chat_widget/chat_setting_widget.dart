import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/chatSettingData.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatSettingsBottomSheet extends ConsumerStatefulWidget {
  final int id;
  const ChatSettingsBottomSheet({super.key, required this.id});

  @override
  ConsumerState<ChatSettingsBottomSheet> createState() =>
      _ChatSettingsBottomSheetState();
}

class _ChatSettingsBottomSheetState
    extends ConsumerState<ChatSettingsBottomSheet> {
 

  @override
  Widget build(BuildContext context) {

    final isLoading = ref.watch(formProvider).privacyLoading;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "Close",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontFamilies.bold,
                        color: AppColors.instance.black400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Chat Settings',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                    fontWeight: FontFamilies.bold,
                  ),
                ),
                Text(
                  'Set up message notification',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black300,
                  ),
                ),
                const SizedBox(height: 40),
                ChatSettingsData(id: widget.id,)
                
               
              ],
            ),
          ),
        ),
        if (isLoading) Positioned.fill(child: _loadingState()),
      ],
    );
  }

  Widget _loadingState() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.instance.grey300.withOpacity(.9),
      ),
      child: Loadingstates(),
    );
  }
}
