import 'package:curnectgate/features/ResidentDirectory/model/resident_model/resident_model.dart';
import 'package:curnectgate/features/ResidentDirectory/widget/resident_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResidentLists extends ConsumerWidget {
  List<Resident> data;
  ResidentLists({super.key, required this.data});

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
          onChangePressed: () {},
        );
      },
    );
  }
}
