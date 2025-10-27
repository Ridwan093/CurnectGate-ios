import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/elections/provider/eletion_provider.dart';
import 'package:curnectgate/features/estate_management/elections/widgets/Dasbord_Bordy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// --- Models ---

// --- UI ---
class ElectionPage extends ConsumerWidget {
  const ElectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(electionProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Estate Elections',
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      // NOTE: you requested no bottom navigation — so none included here.
      body: ElectionBody(state: state),
    );
  }
}
