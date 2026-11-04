import 'dart:developer';

import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/%20overlay_multi_select.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/startDate_widget.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/yearofExperecnandeducationWidget.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/reusableform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Adissonalfildformanager extends ConsumerWidget {
  final TextEditingController emergencyContactname;
  final TextEditingController emergencyContactphnoe;
  final TextEditingController desgination;

  Adissonalfildformanager({
    super.key,
    required this.desgination,
    required this.emergencyContactname,
    required this.emergencyContactphnoe,
  });

  final List<String> _specialize = [
    // Construction & Development
    "New Construction",
    "Commercial Construction",
    "Residential Construction",
    "Green Building Construction",
    "Historical Renovation",

    // Maintenance & Operations
    "Facility Maintenance",
    "Preventive Maintenance",
    "Emergency Maintenance",
    "HVAC Systems",
    "Electrical Systems",
    "Plumbing Systems",

    // Financial & Administrative
    "Budget Management",
    "Lease Administration",
    "Vendor Contract Management",
    "Tax Compliance",
    "Insurance Management",

    // Tenant & Community
    "Tenant Relations",
    "Community Management",
    "Resident Services",
    "HOA Management",

    // Technical Specializations
    "Smart Building Technologies",
    "Energy Efficiency",
    "Sustainability Management",
    "Disaster Recovery",

    // Commercial Focus
    "Retail Property Management",
    "Office Building Management",
    "Industrial Property Management",

    // Residential Focus
    "Multi-Family Housing",
    "Student Housing",
    "Senior Living Facilities",

    // Legal & Compliance
    "Property Law Compliance",
    "ADA Compliance",
    "Zoning Regulations",

    // Emerging Areas
    "PropTech Implementation",
    "Co-Living Spaces",
    "Short-Term Rental Management",

    // General
    "Mixed-Use Properties",
    "Portfolio Management",
    "Asset Management",
  ];
  final List<String> _cv = [
    "PMP",
    "PRINCE2",
    "CAPM",
    "CSM",
    "LEED",
    "RPA",
    "CPM",
    "Other",
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
 

    return Column(
      children: [
        ReusabelProfileForm(
          controller: emergencyContactname,
          fieldKey: 'emergency_contact_name',
          fieldType: FieldType.name,
          hintText: 'eg. same jone',
          label: 'Emergency contact name',
          onChanged: (value) {},
          onValidationChanged: (validation) {
            ref
                .read(formProvider.notifier)
                .updateField(
                  field: 'emergency_contact_name',
                  isValid: validation.isValid,
                  errorMessage: validation.error,
                );
          },
        ),
        const SizedBox(height: 16),
        ReusabelProfileForm(
          controller: emergencyContactphnoe,
          fieldKey: 'emergency_contact_phone',
          fieldType: FieldType.phone,
          hintText: 'eg +234-748748',
          label: 'Emergency contact number',
          onChanged: (value) {},
          onValidationChanged: (validation) {
            ref
                .read(formProvider.notifier)
                .updateField(
                  field: 'emergency_contact_phone',
                  isValid: validation.isValid,
                  errorMessage: validation.error,
                );
          },
        ),
        const SizedBox(height: 16),
        ReusabelProfileForm(
          controller: desgination,
          fieldKey: 'desgination',
          fieldType: FieldType.name,
          hintText: 'eg. Senior Project Manager',
          label: 'desgination',
          onChanged: (value) {},
          onValidationChanged: (validation) {
            ref
                .read(formProvider.notifier)
                .updateField(
                  field: 'desgination',
                  isValid: validation.isValid,
                  errorMessage: validation.error,
                );
          },
        ),
        const SizedBox(height: 16),
        ExperienceEducationRow(),
        const SizedBox(height: 16),
        OverlayMultiSelect(
          onChanged: (value) {
            log(value ?? "");
          },
          label: 'Specializations',
          providerId: 'Specializations', // Unique identifier
          options: _specialize,
        ),

        const SizedBox(height: 16),
        OverlayMultiSelect(
          onChanged: (value) {
            if (value == null) {
              log("nulll");
            } else {
              log(value);
            }
          },
          label: 'Certifications',
          providerId: 'Certifications', // Unique identifier
          options: _cv,
          // showAbove: true,
        ),
       
        const SizedBox(height: 16),
        DatePickerWidget(),
      ],
    );
  }
}
