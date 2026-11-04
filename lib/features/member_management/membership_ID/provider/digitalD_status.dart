// providers/digital_id_status_provider.dart
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/features/member_management/membership_ID/model/digital_id_status.dart';
import 'package:curnectgate/features/signOut/provider/logOut_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final digitalIdStatusProvider = FutureProvider<DigitalIdStatus>((ref) async {
  final token = await ref.watch(accessTokenProvider.future);
  return await ref
      .read(getApiServiceProvider)
      .fetchDigitalIdStatus(bearerToken: token ?? "");
});
