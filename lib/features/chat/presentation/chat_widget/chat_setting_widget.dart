import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/setting_duration.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_widget/work_submitbutton.dart';
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
  bool _doNotDisturb = false;
  int? _selectedDurationIndex;
  Duration _customDuration = const Duration(hours: 1);

  // final List<Map<String, dynamic>> _durationOptions = [
  //   {'label': '1 Hour', 'duration': const Duration(hours: 1)},
  //   {'label': '1 Day', 'duration': const Duration(days: 1)},
  //   {'label': 'Custom', 'duration': null},
  // ];

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
          (context) => AlertDialog(
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
                  'Report issues like noise, parking, or misconduct',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black300,
                  ),
                ),
                const SizedBox(height: 40),
                // Do Not Disturb in container with switch
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.instance.grey300,

                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: SwitchListTile(
                    activeColor: AppColors.instance.teal300,
                    thumbColor: WidgetStatePropertyAll(
                      AppColors.instance.grey200,
                    ),
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
                    value: _doNotDisturb,
                    onChanged: (value) => setState(() => _doNotDisturb = value),
                  ),
                ),

                const SizedBox(height: 44),

                // Mute Duration section (no switch)
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
                // Duration buttons
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DurationButton(
                        label: '1 Hour',
                        isSelected: _selectedDurationIndex == 0,
                        onTap: () {
                          setState(() {
                            _customDuration = Duration(hours: 1);
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
                            _customDuration = Duration(hours: 24);
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
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
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

                // Save Button
                WorkSubmitbutton(
                  label: "Save settins",
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
