class Candidate {
  final String id;
  final String name;
  final String party;
  final String avatarUrl; // can be empty

  final int? totalVotes;

  Candidate({
    required this.id,
    required this.name,
    required this.party,
    this.avatarUrl = '',

    this.totalVotes = 0,
  });
}

class PositionModel {
  final String id;
  final String title;
  final String description;
  final List<Candidate> candidates;

  PositionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.candidates,
  });
}

class ElectionModel {
  final String id;
  final String title;
  final String estateName;
  final String memberName;
  final String memberId;
  final int activeCount;
  final int yourVotes;
  final int totalVoters;
  final int votesSoFar; // used for turnout
  final Duration timeLeft;
  final List<PositionModel> positions;

  ElectionModel({
    required this.id,
    required this.title,
    required this.estateName,
    required this.memberName,
    required this.memberId,
    required this.activeCount,
    required this.yourVotes,
    required this.totalVoters,
    required this.votesSoFar,
    required this.timeLeft,
    required this.positions,
  });
}
