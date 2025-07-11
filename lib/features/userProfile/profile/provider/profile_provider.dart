// Provider for your API class
import 'package:curnectgate/core/%20utils/api/api_Service.dart';

import 'package:curnectgate/core/%20utils/api/getApi_Method.dart';
import 'package:curnectgate/features/userProfile/profile/model/profile_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// get_api_provider.dart
final getApiServiceProvider = Provider<GetApiService>((ref) {
  return GetApiService(
    ref.read(dioProvider),
    ref,
  );
});

final userProfileProvider = FutureProvider<GetUserProfile>((ref) async {
  return ref.read(getApiServiceProvider).getUserProfile();
});

final preferencesProvider = FutureProvider<List<Preference>>((ref) async {
  return ref.read(getApiServiceProvider).getPreferences();
});