import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/co_dropdown.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/Reminder_form.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/datePicker.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/filter_submit_buttion.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/reminderListTile.dart';
import 'package:curnectgate/features/operations/notifications/activites-reminders/widget/reminder_dropDown.dart';
import 'package:curnectgate/features/operations/notifications/event/model/notification_reminder_model/remider/reminder_model.dart';
import 'package:curnectgate/features/operations/notifications/provider/notificationa_Reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddReminder extends ConsumerStatefulWidget {
  final String title;
  final String subtitle;
  final String? isUpdate;
  final int? id;
  ReminderModel? activity;
  AddReminder({
    super.key,
    this.isUpdate,
    required this.title,
    required this.subtitle,
    required this.id,
    this.activity,
  });

  @override
  ConsumerState<AddReminder> createState() => _AddReminderState();
}

class _AddReminderState extends ConsumerState<AddReminder> {
  final _titlecontroller = TextEditingController();
  final _intarvercontroller = TextEditingController();
  final _deccontroller = TextEditingController();

  final List<String> _catetgory = [
    "Payment",

    "Visitor",
    "Community ",
    "Personal",

    "Event",
    "Bill Payment",
  ];

  final List<String> _remberType = ["One time", "Recurring"];

  final List<String> _preferNotify = ["SMS", "Email", "All"];

  final List<String> _repeatLis = ["Monthly", "Daily", "Weekly"];

  final List<String> _peority = ["High", "Low"];

  final _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();

    if (widget.activity != null) {
      final activity = widget.activity!;

      // Prefill text controllers
      _titlecontroller.text = activity.title ?? '';
      _deccontroller.text = activity.description ?? '';

      // Sync provider state (VERY IMPORTANT)
      Future.microtask(() {
        final state = ref.read(reminderProvider.notifier);

        state.updateTitle(activity.title ?? '');
        state.updateDescription(activity.description ?? '');
     

       
        state.updateRemberType(activity.reminderType ?? '');
            state.updateTime(activity.createdAt ?? '');

        state.updateIsSharedWithHousehold(
          activity.isSharedWithHousehold ?? false,
        );
      });
    }
  }

  @override
  void dispose() {
    _titlecontroller.dispose();
    _deccontroller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formPriders = ref.watch(formProvider.notifier);
    final state = ref.read(reminderProvider.notifier);
    final notifier = ref.watch(reminderProvider);
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          // Dismiss keyboard when tapping outside
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 2,
                      width: 35,
                      color: AppColors.instance.grey300,
                    ),
                  ),

                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () => context.pop(),
                      icon: Text(
                        "Close",
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          color: AppColors.instance.teal300,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    widget.isUpdate == ''
                        ? "Add reminder"
                        : "Update ${widget.title}",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 18,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.isUpdate == ''
                        ? "stay on top of payment, maintenance, and more."
                        : widget.subtitle,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 11,
                      color: AppColors.instance.black300,
                    ),
                  ),
                  SizedBox(height: 40),
                  AddReminderForms(
                    textInputType: TextInputType.name,
                    _titlecontroller,
                    onChanged: (value) {
                      state.updateTitle(value);
                    },

                    label: "Reminder title",
                  ),
                  SizedBox(height: 20),
                  AddReminderForms(
                    textInputType: TextInputType.name,
                    onChanged: (value) {
                      state.updateDescription(value);
                    },
                    focusNode: _focusNode,

                    _deccontroller,
                    label: "Reminder decscribtion",
                  ),
                  const SizedBox(height: 20),
                  if (widget.isUpdate == '') ...[
                    SizedBox(height: 20),
                    _buildSmsFallback(ref),

                    SizedBox(height: 20),

                    const SizedBox(height: 20),
                    ReminderDropDown(
                      label: "N/A",
                      items: _repeatLis,
                      selectedValue:
                          _repeatLis.contains(notifier.frequence)
                              ? notifier.frequence
                              : "",
                      onChanged: (value) {
                        state.updateFrequence(value);

                        if (value.isNotEmpty) {}
                      },
                      title: 'Repeat?',
                    ),

                    if (notifier.frequence.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      _buildinterval(ref),
                    ],

                    const SizedBox(height: 20),
                    AddReminderDate(),
                    const SizedBox(height: 20),
                    // TimePickerTile(),
                    // const SizedBox(height: 20),
                    ReminderDropDown(
                      label: "N/A",
                      items: _preferNotify,
                      selectedValue:
                          _preferNotify.contains(notifier.notificationmethod)
                              ? notifier.notificationmethod
                              : "",
                      onChanged: (value) {
                        state.updateNotificationMethod(value);
                      },
                      title: 'Notify via*',
                    ),

                    SizedBox(height: 20),
                    ReminderDropDown(
                      label: "N/A",
                      items: _remberType,
                      selectedValue:
                          _remberType.contains(notifier.remberType)
                              ? notifier.remberType
                              : "",
                      onChanged: (value) {
                        state.updateRemberType(value);
                      },
                      title: 'Reminder Type*',
                    ),

                    SizedBox(height: 20),

                    ReminderListTile(
                      title: "Share with household",
                      onChanged: (value) {
                        state.updateIsSharedWithHousehold(value);
                      },
                      isEnabled: notifier.isSharedWithHousehold,
                      context: context,
                    ),
                    const SizedBox(height: 20),

                    FilterSubmitButtion(
                      isLoading: notifier.isLoading,
                      buttionColor:
                          notifier.reminderValidate
                              ? AppColors.instance.black600
                              : AppColors.instance.grey400,
                      buttionTextColor: AppColors.instance.grey200,
                      buttiontext: 'Save reminder',
                      width: MediaQuery.sizeOf(context).width,
                      onTap:
                          notifier.reminderValidate
                              ? () {
                                formPriders.cerateReminder(
                                  context: context,
                                  reason: '',
                                  id: "",
                                  ref: ref,
                                );
                                _titlecontroller.clear();
                                _deccontroller.clear();
                                _intarvercontroller.clear();
                              }
                              : null,
                    ),
                  ] else ...[
                    AddReminderDate(),
                    const SizedBox(height: 20),
                    ReminderDropDown(
                      label: "N/A",
                      items: _preferNotify,
                      selectedValue:
                          _preferNotify.contains(notifier.notificationmethod)
                              ? notifier.notificationmethod
                              : "",
                      onChanged: (value) {
                        state.updateNotificationMethod(value);
                      },
                      title: 'Notify via*',
                    ),
                    const SizedBox(height: 20),
                    ReminderDropDown(
                      label: "N/A",
                      items: _peority,
                      selectedValue:
                          _peority.contains(notifier.piority)
                              ? notifier.piority
                              : "",
                      onChanged: (value) {
                        state.updatePiority(value);
                      },
                      title: 'Priority*',
                    ),
                    const SizedBox(height: 20),

                    FilterSubmitButtion(
                      isLoading: notifier.isLoading,
                      buttionColor:
                          notifier.updateValid
                              ? AppColors.instance.black600
                              : AppColors.instance.grey400,
                      buttionTextColor: AppColors.instance.grey200,
                      buttiontext: 'Update reminder',
                      width: MediaQuery.sizeOf(context).width,
                      onTap:
                          notifier.updateValid
                              ? () {
                                formPriders.updateReminder(
                                  context: context,
                                  reason: '',
                                  id: widget.id.toString(),
                                  ref: ref,
                                );
                                _titlecontroller.clear();
                                _deccontroller.clear();
                                _intarvercontroller.clear();
                              }
                              : () {},
                    ),
                  ],
                ],
              ),
            ),
            if (notifier.isLoading) Positioned.fill(child: _buildcontainer()),
          ],
        ),
      ),
    );
  }

  Widget _buildinterval(WidgetRef ref) {
    final state = ref.read(reminderProvider.notifier);
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            "Interval",
            style: TextStyle(
              fontWeight: FontFamilies.medium,
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black400,

              fontSize: 14,
            ),
          ),
        ),

        Expanded(
          flex: 1,
          child: AddReminderForms(
            textInputType: TextInputType.number,
            textInputFormatter: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(2),
            ],
            _intarvercontroller,
            onChanged: (value) {
              state.updateNotificationType(value);
            },

            label: "interval",
          ),
        ),
      ],
    );
  }

  Widget _buildcontainer() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Center(child: Loadingstates()),
    );
  }

  Widget _buildSmsFallback(WidgetRef ref) {
    final state = ref.read(reminderProvider.notifier);
    final notifier = ref.read(reminderProvider);
    return CoDropdown(
      errorKey: "Category",

      onChanged: (value) {
        state.updateCategory(value ?? "");
      },
      label: "Category",
      value: _catetgory.contains(notifier.category) ? notifier.category : null,
      item: _catetgory,
    );
  }
}
