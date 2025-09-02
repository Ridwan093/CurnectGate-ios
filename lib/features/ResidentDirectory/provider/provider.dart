// resident_search_provider.dart
import 'package:curnectgate/features/ResidentDirectory/model/resident_model/resident_directory_respond.dart';
import 'package:curnectgate/features/ResidentDirectory/model/resident_model/resident_model.dart';
import 'package:curnectgate/features/ResidentDirectory/provider/getResidentProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final residentSearchProvider =
    StateNotifierProvider<ResidentSearchNotifier, ResidentSearchState>((ref) {
      return ResidentSearchNotifier(ref);
    });

class ResidentSearchState {
  final String searchQuery;
  final List<Resident> filteredResidents;
  final String? errorMessage;
  final AsyncValue<ResidentDirectoryResponse?> residentData;

  ResidentSearchState({
    this.searchQuery = '',
    required this.filteredResidents,
    this.errorMessage,
    required this.residentData,
  });

  ResidentSearchState copyWith({
    String? searchQuery,
    List<Resident>? filteredResidents,
    String? errorMessage,
    AsyncValue<ResidentDirectoryResponse?>? residentData,
  }) {
    return ResidentSearchState(
      searchQuery: searchQuery ?? this.searchQuery,
      filteredResidents: filteredResidents ?? this.filteredResidents,
      errorMessage: errorMessage ?? this.errorMessage,
      residentData: residentData ?? this.residentData,
    );
  }
}

class ResidentSearchNotifier extends StateNotifier<ResidentSearchState> {
  final Ref ref;

  ResidentSearchNotifier(this.ref)
    : super(
        ResidentSearchState(
          filteredResidents: [],
          residentData: const AsyncValue.loading(),
        ),
      ) {
    _init();
  }

  Future<void> _init() async {
    final residentData = ref.watch(getResidentProvider);
    state = state.copyWith(residentData: residentData);

    residentData.when(
      data: (data) {
        if (data != null) {
          state = state.copyWith(
            filteredResidents: data.data?.residents?.data,
            errorMessage:
                data.data?.residents?.data == null
                    ? 'No residents found.'
                    : null,
          );
        }
      },
      error: (error, _) {
        state = state.copyWith(
          filteredResidents: [],
          errorMessage: 'Failed to load residents: $error',
        );
      },
      loading: () {
        state = state.copyWith(filteredResidents: [], errorMessage: null);
      },
    );
  }

  void searchResidents(String query, WidgetRef ref) {
    final residentData = state.residentData;

    if (query.isEmpty) {
      state = state.copyWith(
        searchQuery: query,
        filteredResidents:
            residentData.valueOrNull?.data?.residents?.data ?? [],
        errorMessage:
            residentData.valueOrNull?.data?.residents?.data.isEmpty ?? true
                ? 'No residents found.'
                : '',
      );
      return;
    }

    final filtered =
        residentData.valueOrNull?.data?.residents?.data.where((resident) {
          return resident.fullName.toLowerCase().contains(query.toLowerCase());
        }).toList() ??
        [];

    state = state.copyWith(
      searchQuery: query,
      filteredResidents: filtered,
      errorMessage:
          filtered.isEmpty
              ? 'No profile found, try adjusting your search'
              : null,
    );
  }

  void filterByStatus(String status, WidgetRef ref) {
    final residentData = state.residentData;

    if (status == 'All') {
      state = state.copyWith(
        filteredResidents:
            residentData.valueOrNull?.data?.residents?.data ?? [],
        errorMessage:
            residentData.valueOrNull?.data?.residents?.data.isEmpty ?? true
                ? 'No residents found.'
                : null,
      );
      return;
    }

    final filtered =
        residentData.valueOrNull?.data?.residents?.data.where((resident) {
          return resident.memberCode == status;
        }).toList() ??
        [];

    state = state.copyWith(
      filteredResidents: filtered,
      errorMessage:
          filtered.isEmpty ? 'No residents with status: $status' : null,
    );
  }

  Future<void> refresh(BuildContext context, WidgetRef ref) async {
    await ref.read(getResidentProvider.notifier).refreshResident(context, ref);
    _init();
  }
}
