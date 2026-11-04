import 'package:flutter/material.dart';

void closeAllBottomSheets(BuildContext context) {
  Navigator.of(context).popUntil((route) {
    // Pop until we reach a route that is NOT a bottom sheet
    return route.settings.name != null || !route.isActive;
    // or more aggressive:
    // return route.isFirst;
  });
}
