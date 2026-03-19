import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/set_restriction/restriction_status_data.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestrictionContent extends ConsumerStatefulWidget {
  final String title;
  final RestrictionStatusData? data;
  final Function(bool) onChanged;
  final bool isLoading;
  const RestrictionContent({
    super.key,
    required this.title,
    required bool value,
    required this.onChanged,
    this.data,
    required this.isLoading,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RestrictionContentState();
}

class _RestrictionContentState extends ConsumerState<RestrictionContent> {
  bool? get resEnable => ref.watch(formProvider).restrictionValue;
  void initState() {
    super.initState();
    // _initializeState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeState();
    });
  }

  void _initializeState() {
    final notifier = ref.read(formProvider.notifier);
    final res = widget.data;

    if (res != null) {
      notifier.updateRestrictionValue(res.isRestricted ?? false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              widget.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black600,
              ),
            ),
          ),
          if (widget.isLoading) ...[
            Loadingstates(),
          ] else
            Switch(
              inactiveThumbColor: Colors.white,
              activeTrackColor: AppColors.instance.teal200,

              value: resEnable ?? false,
              onChanged: widget.onChanged,
            ),
        ],
      ),
    );
  }
}
