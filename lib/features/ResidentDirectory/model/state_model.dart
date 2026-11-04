import 'package:curnectgate/features/ResidentDirectory/model/comittee_model/committee_model.dart';
import 'package:curnectgate/features/ResidentDirectory/model/comittee_model/committees_response_model.dart';
import 'package:curnectgate/features/ResidentDirectory/model/resident_model/resident_directory_respond.dart';
import 'package:curnectgate/features/ResidentDirectory/model/resident_model/resident_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResidentSearchState {
  final String searchQuery;
  final List<Resident> filteredResidents;
  final String? errorMessage;
  final String? errorType; // Added errorType field
  final AsyncValue<ResidentDirectoryResponse?> residentData;
  final AsyncValue<CommitteesResponse?> committeeData;
  final String? commmitteeErrorMessage;
  final String? commmitteeErrorType;
  final String committeeSearchQuery;
  final List<Committee> committeeFilteredResidents;

  ResidentSearchState({
    this.searchQuery = '',
    required this.filteredResidents,
    this.errorMessage,
    this.errorType, // Initialize errorType
    this.commmitteeErrorMessage,
    this.commmitteeErrorType,
    this.committeeSearchQuery = '',
    required this.committeeFilteredResidents,
    required this.residentData,
    required this.committeeData,
  });

  ResidentSearchState copyWith({
    String? searchQuery,
    List<Resident>? filteredResidents,
    String? errorMessage,
    String? errorType, // Add errorType to copyWith
    AsyncValue<ResidentDirectoryResponse?>? residentData,
    AsyncValue<CommitteesResponse?>? committeeData,
    String? commmitteeErrorMessage,
    String? commmitteeErrorType,
    String? committeeSearchQuery,
    List<Committee>? committeeFilteredResidents,
  }) {
    return ResidentSearchState(
      committeeData: committeeData ?? this.committeeData,
      commmitteeErrorMessage:
          commmitteeErrorMessage ?? this.commmitteeErrorMessage,
      commmitteeErrorType: commmitteeErrorType ?? this.commmitteeErrorType,
      committeeSearchQuery: committeeSearchQuery ?? this.committeeSearchQuery,
      committeeFilteredResidents:
          committeeFilteredResidents ?? this.committeeFilteredResidents,
      searchQuery: searchQuery ?? this.searchQuery,
      filteredResidents: filteredResidents ?? this.filteredResidents,
      errorMessage: errorMessage ?? this.errorMessage,
      errorType: errorType ?? this.errorType, // Handle errorType
      residentData: residentData ?? this.residentData,
    );
  }
}
