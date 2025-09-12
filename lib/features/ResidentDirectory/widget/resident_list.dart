import 'package:curnectgate/features/ResidentDirectory/model/resident_model/resident_model.dart';
import 'package:curnectgate/features/ResidentDirectory/widget/resident_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class ResidentLists extends ConsumerWidget {
  List<Resident> data;
  ResidentLists({super.key, required this.data});
  Future<void> _launchDialer(String phoneNumber) async {
    // Validate the phone number (optional: remove non-digits)
    String formattedNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
    if (formattedNumber.isEmpty) {
      // Handle empty number (e.g., show a snackbar)
      return;
    }

    final Uri url = Uri(scheme: 'tel', path: formattedNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // Handle launch failure (e.g., show error message)
      throw 'Could not launch dialer for $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        var res = data[index];
        return ResidentCard(
          userName: res.fullName,
          block: res.memberCode,
          adrress: res.address,
          onChangePressed:
              res.phone == null
                  ? null
                  : () {
                    _launchDialer(res.phone ?? "");
                  },
        );
      },
    );
  }
}
