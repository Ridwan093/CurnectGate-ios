import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/estate_settings/widget/bottom_seet/emergency_list_view.dart';
import 'package:curnectgate/features/member_management/estate_settings/setting_model/estate_settings_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../estateSetting_data.dart';

class Residentmergency extends ConsumerWidget {
  const Residentmergency({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.close, color: AppColors.instance.black600),
                ),
              ),
              SizedBox(height: 40),
              Text(
                "Emergency contacts",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 18,
                  color: AppColors.instance.black600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Call an emergency contact",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 13,
                  color: AppColors.instance.black300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          EstateSettingsDatas(
            builder: (context, data) {
              final estateData = data as EstateSettingsData;
              final settings = estateData.settings ?? {};

              return Column(
                children:
                    settings.entries.map((entry) {
                      // e.g. "emergency_contacts"
                      final contact = entry.value; // EmergencyContacts

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Display nested contacts inside category
                          if (contact.police?.isNotEmpty ?? false)
                            _buildContainer(
                              context: context,
                              list: contact.police ?? [],
                              size: size,
                              title: "Police",
                              subtitle:
                                  "The Police department handles crime prevention, safety protection",
                              icon: Icons.policy,
                            ),

                          if (contact.estateManagement?.isNotEmpty ?? false)
                            _buildContainer(
                              context: context,
                              list: contact.estateManagement ?? [],
                              size: size,
                              title: "Estate Management",
                              subtitle:
                                  "Estate Management serves as the primary contact for all estate-related issues",
                              icon: Icons.manage_accounts,
                            ),

                          if (contact.fireAlarm?.isNotEmpty ?? false)
                            _buildContainer(
                              context: context,
                              list: contact.fireAlarm ?? [],
                              size: size,
                              title: "Fire service",
                              subtitle:
                                  "The Fire Service responds to fire outbreaks, hazardous material incidents",
                              icon: Icons.local_fire_department,
                            ),
                          if (contact.ambulance?.isNotEmpty ?? false)
                            _buildContainer(
                              context: context,
                              list: contact.ambulance ?? [],
                              size: size,
                              title: "Ambulance",
                              subtitle:
                                  "Ambulance services provide urgent medical response and patient transportation.",
                              icon: Icons.sick,
                            ),
                        ],
                      );
                    }).toList(),
              );
            },
          ),

          // _buildContainer(
          //   size: size,
          //   title: "Emergency line",
          //   subtitle: "+234 81203894898",
          //   icon: Icons.emergency,
          // ),
          // _buildContainer(
          //   size: size,
          //   title: "Fire service",
          //   subtitle: "+234 81203894898",
          //   icon: Icons.local_fire_department,
          // ),
        ],
      ),
    );
  }

  Widget _buildContainer({
    required Size size,
    required String title,
    required String subtitle,
    required IconData icon,
    // required BuildContext context,
    required BuildContext context,
    required List<String> list,
  }) {
    return InkWell(
      onTap: () => showEmergencyContactsSheet(context, list, title, subtitle),
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
        padding: EdgeInsets.all(8),

        width: size.width,
        decoration: BoxDecoration(
          color: AppColors.instance.grey200,

          borderRadius: BorderRadius.circular(5),
        ),

        child: ListTile(
          leading: Material(
            elevation: 1,
            shape: CircleBorder(),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(icon, color: AppColors.instance.error600),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontWeight: FontFamilies.bold,
              fontSize: 14,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black300,
              fontWeight: FontFamilies.medium,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
