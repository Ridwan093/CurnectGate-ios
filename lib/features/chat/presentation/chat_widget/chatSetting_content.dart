import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/chat/data/model/get_model/conversation_settings.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/setting_duration.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/work_submitbutton.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatsettingContent extends ConsumerStatefulWidget {
  final int id;
  final ConversationSettings? settings;

  const ChatsettingContent({super.key, required this.id, this.settings});

  @override
  ConsumerState<ChatsettingContent> createState() => _ChatsettingContentState();
}

class _ChatsettingContentState extends ConsumerState<ChatsettingContent> {
  late bool _doNotDisturb;
  int? _selectedDurationIndex;
  Duration _customDuration = const Duration(hours: 1);

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() {
    final settings = widget.settings;

    _doNotDisturb = settings?.doNotDisturb ?? false;

    /// Parse duration safely
    final dndUntil = settings?.dndUntil;

    if (dndUntil != null && dndUntil.isNotEmpty) {
      final hours = int.tryParse(dndUntil) ?? 1;
      _customDuration = Duration(hours: hours);

      if (hours == 1) {
        _selectedDurationIndex = 0;
      } else if (hours == 24) {
        _selectedDurationIndex = 1;
      } else {
        _selectedDurationIndex = 2;
      }
    }
  }

  void _showCustomDurationDialog() {
    final hoursController = TextEditingController(
      text: _customDuration.inHours.toString(),
    );

    final minutesController = TextEditingController(
      text: _customDuration.inMinutes.remainder(60).toString(),
    );

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(
              'Custom Duration',
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: hoursController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Hours'),
                ),
                TextField(
                  controller: minutesController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Minutes'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black300,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _customDuration = Duration(
                      hours: int.tryParse(hoursController.text) ?? 0,
                      minutes: int.tryParse(minutesController.text) ?? 0,
                    );
                    _selectedDurationIndex = 2;
                  });

                  Navigator.pop(context);
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                    fontWeight: FontFamilies.bold,
                  ),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(formProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ---------- DND SWITCH ----------
        Container(
          decoration: BoxDecoration(
            color: AppColors.instance.grey300,
            borderRadius: BorderRadius.circular(2),
          ),
          child: SwitchListTile(
            value: _doNotDisturb,
            onChanged: (value) {
              setState(() => _doNotDisturb = value);
            },
            activeColor: AppColors.instance.teal300,
            thumbColor: WidgetStatePropertyAll(AppColors.instance.grey200),
            inactiveTrackColor: Colors.grey,
            activeTrackColor: AppColors.instance.teal300,
            trackOutlineColor: WidgetStatePropertyAll(
              AppColors.instance.grey200,
            ),
            title: Text(
              'Do-Not-Disturb',
              style: TextStyle(
                fontSize: 14,
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
                fontWeight: FontFamilies.bold,
              ),
            ),
            subtitle: Text(
              'Mute notifications from this chat',
              style: TextStyle(
                fontSize: 12,
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black300,
              ),
            ),
          ),
        ),

        const SizedBox(height: 32),

        /// ---------- DURATION ----------
        Text(
          'Muted Duration',
          style: TextStyle(
            fontSize: 14,
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black600,
            fontWeight: FontFamilies.bold,
          ),
        ),

        const SizedBox(height: 10),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DurationButton(
                label: '1 Hour',
                isSelected: _selectedDurationIndex == 0,
                onTap: () {
                  setState(() {
                    _customDuration = const Duration(hours: 1);
                    _selectedDurationIndex = 0;
                  });
                },
              ),
              const SizedBox(width: 8),
              DurationButton(
                label: '1 Day',
                isSelected: _selectedDurationIndex == 1,
                onTap: () {
                  setState(() {
                    _customDuration = const Duration(hours: 24);
                    _selectedDurationIndex = 1;
                  });
                },
              ),
              const SizedBox(width: 8),
              DurationButton(
                label: 'Custom',
                isSelected: _selectedDurationIndex == 2,
                onTap: _showCustomDurationDialog,
              ),
            ],
          ),
        ),

        if (_selectedDurationIndex == 2)
          Padding(
            padding: const EdgeInsets.all(16),
            child: OutlinedButton(
              onPressed: _showCustomDurationDialog,
              child: Text(
                'Custom: ${_customDuration.inHours}h ${_customDuration.inMinutes.remainder(60)}m',
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                ),
              ),
            ),
          ),

        const SizedBox(height: 24),

        /// ---------- SAVE ----------
        WorkSubmitbutton(
          label: "Save settings",
          onPressed: () {
            provider.chattingSetting(
              context: context,
              id: widget.id,
              do_not_disturb: _doNotDisturb,
              dnd_duration_hours: _customDuration.inHours,
              ref: ref,
            );
          },
        ),
      ],
    );
  }
}
