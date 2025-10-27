// import 'package:flutter/material.dart';

// import '../models/election_models.dart';
// import '../widgets/bottom_navigation.dart';
// import '../widgets/result_card.dart';

// class ResultsScreen extends StatelessWidget {
//   final ElectionData electionData;

//   const ResultsScreen({super.key, required this.electionData});

//   @override
//   Widget build(BuildContext context) {
//     final presidentialCandidates =
//         electionData.candidates
//             .where((c) => c.position == 'President')
//             .toList();
//     final winners = electionData.candidates.where((c) => c.isWinner).toList();

//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         backgroundColor: Colors.grey[50],
//         appBar: AppBar(
//           title: const Text('Live Election Results'),
//           centerTitle: true,
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           bottom: const TabBar(
//             tabs: [
//               Tab(text: 'Gen. Secretary'),
//               Tab(text: 'Financial Sec.'),
//               Tab(text: 'Summary'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             _buildGeneralSecretaryTab(),
//             _buildFinancialSecretaryTab(),
//             _buildSummaryTab(presidentialCandidates, winners),
//           ],
//         ),
//         bottomNavigationBar: const ElectionBottomNavigation(),
//       ),
//     );
//   }

//   Widget _buildGeneralSecretaryTab() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         children: [
//           // Add General Secretary results here
//           const Center(child: Text('General Secretary Results')),
//         ],
//       ),
//     );
//   }

//   Widget _buildFinancialSecretaryTab() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         children: [
//           // Add Financial Secretary results here
//           const Center(child: Text('Financial Secretary Results')),
//         ],
//       ),
//     );
//   }

//   Widget _buildSummaryTab(
//     List<Candidate> presidentialCandidates,
//     List<Candidate> winners,
//   ) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         children: [
//           // Total Votes Card
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.1),
//                   blurRadius: 10,
//                   offset: const Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Column(
//               children: [
//                 const Text(
//                   'Total Votes',
//                   style: TextStyle(fontSize: 16, color: Colors.grey),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   electionData.totalVotes.toString(),
//                   style: const TextStyle(
//                     fontSize: 36,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),

//           // Presidential Results
//           ...presidentialCandidates
//               .map(
//                 (candidate) => Padding(
//                   padding: const EdgeInsets.only(bottom: 12),
//                   child: ResultCard(candidate: candidate),
//                 ),
//               )
//               .toList(),

//           const SizedBox(height: 20),

//           // Election Winners Section
//           _buildWinnersSection(winners),
//         ],
//       ),
//     );
//   }

//   Widget _buildWinnersSection(List<Candidate> winners) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Election Winners',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 16),
//         Wrap(
//           spacing: 12,
//           runSpacing: 12,
//           children: winners.map((winner) => _buildWinnerCard(winner)).toList(),
//         ),
//       ],
//     );
//   }

//   Widget _buildWinnerCard(Candidate winner) {
//     return Container(
//       width: 150,
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.green[100]!),
//       ),
//       child: Column(
//         children: [
//           Text(
//             winner.position,
//             style: const TextStyle(
//               fontSize: 12,
//               color: Colors.grey,
//               fontWeight: FontWeight.bold,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 8),
//           Text(
//             winner.name,
//             style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//           Text(
//             '${winner.percentage}%',
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.green,
//             ),
//           ),
//           Text(
//             '${winner.votes} votes',
//             style: const TextStyle(fontSize: 12, color: Colors.grey),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             winner.party,
//             style: const TextStyle(fontSize: 11, color: Colors.blue),
//           ),
//         ],
//       ),
//     );
//   }
// }
