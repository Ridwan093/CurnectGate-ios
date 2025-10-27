// import 'package:flutter/material.dart';

// import '../models/election_models.dart';
// import '../widgets/bottom_navigation.dart';
// import '../widgets/candidate_card.dart';

// class VotingScreen extends StatelessWidget {
//   final List<Candidate> candidates;
//   final Function(Candidate) onVote;

//   const VotingScreen({
//     super.key,
//     required this.candidates,
//     required this.onVote,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final presidentialCandidates =
//         candidates.where((c) => c.position == 'President').toList();

//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         title: const Text('How to Vote'),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildInstructions(),
//             const SizedBox(height: 24),
//             _buildPresidentSection(presidentialCandidates),
//           ],
//         ),
//       ),
//       bottomNavigationBar: const ElectionBottomNavigation(),
//     );
//   }

//   Widget _buildInstructions() {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.blue[50],
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.blue[100]!),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           Text(
//             'Voting Instructions',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//               color: Colors.blue,
//             ),
//           ),
//           SizedBox(height: 8),
//           _buildInstructionItem('Select ONE candidate for each position'),
//           _buildInstructionItem('Review your choices before submitting'),
//           _buildInstructionItem('You can only vote once per position'),
//         ],
//       ),
//     );
//   }

//   Widget _buildPresidentSection(List<Candidate> candidates) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'President',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 8),
//         const Text(
//           'Lead the estate executive council',
//           style: TextStyle(fontSize: 14, color: Colors.grey),
//         ),
//         const SizedBox(height: 16),
//         ...candidates
//             .map(
//               (candidate) => Padding(
//                 padding: const EdgeInsets.only(bottom: 12),
//                 child: CandidateCard(
//                   candidate: candidate,
//                   onVote: () => onVote(candidate),
//                 ),
//               ),
//             )
//             .toList(),
//       ],
//     );
//   }
// }

// class _buildInstructionItem extends StatelessWidget {
//   final String text;

//   const _buildInstructionItem(this.text);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('• ', style: TextStyle(color: Colors.blue)),
//           Expanded(
//             child: Text(
//               text,
//               style: const TextStyle(fontSize: 14, color: Colors.blue),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
