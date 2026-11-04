import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void showEmergencyContactsSheet(
  BuildContext context,
  List<String> contacts,
  String title,
  String dec,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.instance.black600,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 18,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dec,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 13,
                      color: AppColors.instance.black300,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),
              ...contacts.map(
                (c) => Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(8),
                  color: AppColors.instance.grey300,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(c),
                    trailing: CircleAvatar(
                      backgroundColor: AppColors.instance.grey300,
                      child: Icon(
                        _isPhoneNumber(c) ? Icons.call : Icons.email,
                        color: AppColors.instance.black600,
                      ),
                    ),
                    onTap:
                        () =>
                            _isPhoneNumber(c)
                                ? _confirmCall(context, c)
                                : _confirmEmail(context, c),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _confirmCall(BuildContext context, String phone) {
  showDialog(
    context: context,
    builder:
        (ctx) => AlertDialog(
          title: Text(
            "Call Emergency Number?",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 17,
              color: AppColors.instance.black600,
              fontWeight: FontFamilies.bold,
            ),
          ),
          content: Text(
            "Do you want to call: $phone",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 14,
              color: AppColors.instance.black400,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                  fontSize: 12,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                launchUrl(Uri.parse("tel:$phone"));
                Navigator.pop(ctx);
              },
              child: Text(
                "Call",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
  );
}

void _confirmEmail(BuildContext context, String email) {
  showDialog(
    context: context,
    builder:
        (ctx) => AlertDialog(
          title: Text(
            "Send Email?",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 17,
              color: AppColors.instance.black600,
              fontWeight: FontFamilies.bold,
            ),
          ),
          content: Text(
            "Do you want to send an email to: $email",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 14,
              color: AppColors.instance.black400,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                  fontSize: 12,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                launchUrl(Uri.parse("mailto:$email"));
                Navigator.pop(ctx);
              },
              child: Text(
                "Email",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
  );
}

bool _isPhoneNumber(String value) {
  // Allow digits and + sign
  final phoneRegex = RegExp(r'^[\d+\- ]+$');
  return phoneRegex.hasMatch(value);
}
