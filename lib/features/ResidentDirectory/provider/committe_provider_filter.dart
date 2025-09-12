import 'package:curnectgate/features/ResidentDirectory/model/state_model.dart';
import 'package:curnectgate/features/ResidentDirectory/provider/getCommitte_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final committeeSearchProvider =
    StateNotifierProvider<CommitteeSearchNotifier, ResidentSearchState>((ref) {
      return CommitteeSearchNotifier(ref);
    });

class CommitteeSearchNotifier extends StateNotifier<ResidentSearchState> {
  final Ref ref;

  CommitteeSearchNotifier(this.ref)
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
    final committeData = ref.watch(getCommitteeProvider);
    state = state.copyWith(committeeData: committeData);

    committeData.when(
      data: (data) {
        if (data != null) {
          state = state.copyWith(
            committeeFilteredResidents: data.data?.committees?.data ?? [],
            commmitteeErrorMessage:
                data.data?.committees?.data == null ||
                        data.data!.committees!.data!.isEmpty
                    ? 'No residents found.'
                    : null,
            commmitteeErrorType:
                data.data?.committees?.data == null ||
                        data.data!.committees!.data!.isEmpty
                    ? 'no_results'
                    : null,
          );
        }
      },
      error: (error, stackTrace) {
        // API errors are handled in the widget, so clear search/filter state
        state = state.copyWith(
          filteredResidents: [],
          errorMessage: '',
          errorType: '',
          committeeFilteredResidents: [],
          commmitteeErrorMessage: "",
          commmitteeErrorType: "",
        );
      },
      loading: () {
        state = state.copyWith(
          filteredResidents: [],
          errorMessage: '',
          errorType: '',
          committeeFilteredResidents: [],
          commmitteeErrorMessage: "",
          commmitteeErrorType: "",
        );
      },
    );
  }

  void searchResidents(String query, WidgetRef ref) {
    final residentData = state.committeeData;

    if (query.isEmpty) {
      state = state.copyWith(
        searchQuery: query,
        committeeFilteredResidents:
            residentData.valueOrNull?.data?.committees?.data ?? [],
        commmitteeErrorMessage:
            residentData.valueOrNull?.data?.committees?.data?.isEmpty ?? true
                ? 'No residents found.'
                : '',
        commmitteeErrorType:
            residentData.valueOrNull?.data?.committees?.data?.isEmpty ?? true
                ? 'no_results'
                : '',
      );
      return;
    }

    final filtered =
        residentData.valueOrNull?.data?.committees?.data?.where((resident) {
          return resident.name!.toLowerCase().contains(query.toLowerCase());
        }).toList() ??
        [];

    state = state.copyWith(
      searchQuery: query,
      committeeFilteredResidents: filtered,
      commmitteeErrorMessage:
          filtered.isEmpty
              ? 'No profile found, try adjusting your search.'
              : null,
      commmitteeErrorType: filtered.isEmpty ? 'no_results' : null,
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
    await ref.read(getCommitteeProvider.notifier).refreshCommitte(context, ref);
    await _init();
  }
}
