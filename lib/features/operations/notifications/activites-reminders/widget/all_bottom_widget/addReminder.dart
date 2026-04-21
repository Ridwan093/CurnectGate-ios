import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
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
import 'package:curnectgate/features/operations/notifications/provider/reminder_household_provider.dart';
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
    "Maintenance",
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
                        ? "Stay on top of payment, maintenance, and more."
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

                  if (widget.isUpdate == '') ...[
                    SizedBox(height: 20),
                    _buildSmsFallback(ref),

                    SizedBox(height: 20),
                    AddReminderDate(),
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
                    if (notifier.remberType.toLowerCase().contains(
                      "recurring",
                    )) ...[
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
                        title: 'Recurring',
                      ),
                    ],

                    if (notifier.frequence.isNotEmpty &&
                        notifier.remberType.toLowerCase().contains(
                          "recurring",
                        )) ...[
                      const SizedBox(height: 20),
                      _buildinterval(ref),
                    ],

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

                    ReminderListTile(
                      title: "Share with household",
                      onChanged: (value) {
                        if (value) {
                          state.updateIsSharedWithHousehold(true);
                          _showHouseholdSelectionSheet(context, ref).then((_) {
                            // When bottom sheet closes, check if we need to revert the toggle
                            final selected =
                                ref
                                    .read(reminderProvider)
                                    .selectedHouseholdMembers;
                            if (selected.isEmpty) {
                              state.updateIsSharedWithHousehold(false);
                            }
                          });
                        } else {
                          state.clearHouseholdMembers();
                          state.updateIsSharedWithHousehold(false);
                        }
                      },
                      isEnabled: notifier.isSharedWithHousehold,
                      context: context,
                    ),
                    if (notifier.isSharedWithHousehold &&
                        notifier.selectedHouseholdMembers.isNotEmpty)
                      _buildSelectedMembersList(ref),
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
                    const SizedBox(height: 20),
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

  Future<void> _showHouseholdSelectionSheet(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final state = ref.read(reminderProvider.notifier);

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) {
            final houseMembersAsync = ref.watch(reminderHouseholdProvider);
            final List<int> selectedMembers =
                (ref.watch(reminderProvider).selectedHouseholdMembers
                    as dynamic) ??
                <int>[];

            Widget buildMemberList(List<dynamic> houseMembers) {
              if (houseMembers.isEmpty) {
                return const Center(child: Text("No household members found"));
              }
              return ListView.builder(
                itemCount: houseMembers.length,
                itemBuilder: (context, index) {
                  final member = houseMembers[index];
                  final isSelected = selectedMembers.contains(member.id);
                  final name =
                      "${member.firstname ?? ''} ${member.lastname ?? ''}"
                          .trim();
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 4,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: AppColors.instance.grey200,
                      backgroundImage:
                          member.avatar != null
                              ? NetworkImage(member.avatar!)
                              : null,
                      child:
                          member.avatar == null
                              ? Text(
                                name.isNotEmpty
                                    ? name[0].toUpperCase()
                                    : (member.email?[0].toUpperCase() ?? "?"),
                                style: TextStyle(
                                  color: AppColors.instance.black600,
                                  fontWeight: FontFamilies.bold,
                                ),
                              )
                              : null,
                    ),
                    title: Text(
                      name.isEmpty ? (member.email ?? "") : name,
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.black600,
                        fontWeight: FontFamilies.medium,
                      ),
                    ),
                    subtitle:
                        member.role != null
                            ? Text(
                              member.role!,
                              style: TextStyle(
                                fontFamily: FontFamilies.interDisplay,
                                color: AppColors.instance.black300,
                                fontSize: 12,
                              ),
                            )
                            : null,
                    trailing: Icon(
                      isSelected
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color:
                          isSelected
                              ? AppColors.instance.yellow500
                              : AppColors.instance.grey300,
                    ),
                    onTap: () {
                      if (member.id != null) {
                        state.toggleHouseholdMember(member.id!);
                      }
                    },
                  );
                },
              );
            }

            return Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 20 + MediaQuery.paddingOf(context).bottom,
              ),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.7,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Select Household Members",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: houseMembersAsync.when(
                      data: (response) {
                        final houseMembers = response?.data?.members ?? [];
                        return buildMemberList(houseMembers);
                      },
                      loading: () {
                        try {
                          final cachedResponse =
                              ref.read(reminderHouseholdProvider).value;
                          final cachedMembers =
                              cachedResponse?.data?.members ?? [];
                          if (cachedMembers.isNotEmpty) {
                            return buildMemberList(cachedMembers);
                          }
                        } catch (_) {}
                        return Loadingstates();
                      },
                      error: (err, stack) {
                        try {
                          final cachedResponse =
                              ref.read(reminderHouseholdProvider).value;
                          final cachedMembers =
                              cachedResponse?.data?.members ?? [];
                          if (cachedMembers.isNotEmpty) {
                            return buildMemberList(cachedMembers);
                          }
                        } catch (e) {
                          return Builderroul(
                            error: err.toString(),
                            onTap:
                                () => ref
                                    .read(reminderHouseholdProvider.notifier)
                                    .refreshHousehold(context, ref),
                            firstMessae: "Faile to load housedhold",
                          );
                        }
                        return Builderroul(
                          error: err.toString(),
                          onTap:
                              () => ref
                                  .read(reminderHouseholdProvider.notifier)
                                  .refreshHousehold(context, ref),
                          firstMessae: "Faile to load housedhold",
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  FilterSubmitButtion(
                    isLoading: false,
                    buttionColor: AppColors.instance.black600,
                    buttionTextColor: Colors.white,
                    buttiontext: "Done",
                    width: MediaQuery.sizeOf(context).width,
                    onTap: () {
                      if (selectedMembers.isEmpty) {
                        state.updateIsSharedWithHousehold(false);
                      }
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSelectedMembersList(WidgetRef ref) {
    final List<int> selectedIds =
        (ref.watch(reminderProvider).selectedHouseholdMembers as dynamic) ??
        <int>[];
    final houseMembers =
        ref.watch(reminderHouseholdProvider).value?.data?.members ?? [];
    final selectedMembers =
        houseMembers.where((m) => selectedIds.contains(m.id)).toList();

    if (selectedMembers.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: SizedBox(
        height: 60,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: selectedMembers.length,
          separatorBuilder: (context, index) => const SizedBox(width: 8),
          itemBuilder: (context, index) {
            final member = selectedMembers[index];
            final fullName =
                "${member.firstname ?? ''} ${member.lastname ?? ''}".trim();
            final name = fullName.isEmpty ? (member.email ?? "") : fullName;
            final initials = name.isNotEmpty ? name[0].toUpperCase() : "?";

            return Container(
              padding: const EdgeInsets.only(
                right: 12,
                top: 4,
                bottom: 4,
                left: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.instance.grey200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.instance.yellow400.withOpacity(
                      0.2,
                    ),
                    backgroundImage:
                        member.avatar != null
                            ? NetworkImage(member.avatar!)
                            : null,
                    child:
                        member.avatar == null
                            ? Text(
                              initials,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontFamilies.bold,
                                color: AppColors.instance.black600,
                              ),
                            )
                            : null,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name.length > 12 ? "${name.substring(0, 12)}..." : name,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontFamilies.medium,
                          color: AppColors.instance.black600,
                          fontFamily: FontFamilies.interDisplay,
                        ),
                      ),
                      if (member.role != null)
                        Text(
                          member.role!,
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.instance.black400,
                            fontFamily: FontFamilies.interDisplay,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.instance.grey200,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        size: 14,
                        color: AppColors.instance.black400,
                      ),
                    ),
                    onTap: () {
                      if (member.id != null) {
                        ref
                            .read(reminderProvider.notifier)
                            .toggleHouseholdMember(member.id!);
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
