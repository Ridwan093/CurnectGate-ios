import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class appLogo extends StatelessWidget {
  const appLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Image.asset(AssetPaths.appLogo, width: 220,),
    );
  }
}
