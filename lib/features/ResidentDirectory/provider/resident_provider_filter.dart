import 'package:curnectgate/features/ResidentDirectory/model/state_model.dart';
import 'package:curnectgate/features/ResidentDirectory/provider/getResidentProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final residentSearchProvider =
    StateNotifierProvider<ResidentSearchNotifier, ResidentSearchState>((ref) {
      return ResidentSearchNotifier(ref);
    });

class ResidentSearchNotifier extends StateNotifier<ResidentSearchState> {
  final Ref ref;

  ResidentSearchNotifier(this.ref)
    : super(
        ResidentSearchState(
          committeeFilteredResidents: [],
          filteredResidents: [],
          residentData: const AsyncValue.loading(),
          committeeData: const AsyncValue.loading(),
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
            filteredResidents: data.data?.residents?.data ?? [],
            errorMessage:
                data.data?.residents?.data == null ||
                        data.data!.residents!.data.isEmpty
                    ? 'No residents found.'
                    : null,
            errorType:
                data.data?.residents?.data == null ||
                        data.data!.residents!.data.isEmpty
                    ? 'no_results'
                    : null,
          );
        }
      },
      error: (error, stackTrace) {
        // API errors are handled in the widget, so clear search/filter state
        state = state.copyWith(
          filteredResidents: [],
          errorMessage: null,
          errorType: null,
        );
      },
      loading: () {
        state = state.copyWith(
          filteredResidents: [],
          errorMessage: null,
          errorType: null,
        );
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
        errorType:
            residentData.valueOrNull?.data?.residents?.data.isEmpty ?? true
                ? 'no_results'
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
              ? 'No profile found, try adjusting your search.'
              : null,
      errorType: filtered.isEmpty ? 'no_results' : null,
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
        errorType:
            residentData.valueOrNull?.data?.residents?.data.isEmpty ?? true
                ? 'no_results'
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
      errorType: filtered.isEmpty ? 'no_results' : null,
    );
  }

  Future<void> refresh(BuildContext context, WidgetRef ref) async {
    await ref.read(getResidentProvider.notifier).refreshResident(context, ref);
    await _init();
  }
}
