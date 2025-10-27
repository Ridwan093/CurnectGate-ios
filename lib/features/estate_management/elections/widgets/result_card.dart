// import 'package:curnectgate/features/estate_management/elections/models/election_models.dart';
// import 'package:flutter/material.dart';


// class ResultCard extends StatelessWidget {
//   final Candidate candidate;

//   const ResultCard({super.key, required this.candidate});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         candidate.name,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         candidate.party,
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 if (candidate.isLeading)
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: Colors.green[50],
//                       borderRadius: BorderRadius.circular(6),
//                       border: Border.all(color: Colors.green),
//                     ),
//                     child: const Text(
//                       'LEADING',
//                       style: TextStyle(
//                         color: Colors.green,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 10,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             Row(
//               children: [
//                 Text(
//                   '${candidate.percentage}%',
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: LinearProgressIndicator(
//                     value: candidate.percentage / 100,
//                     backgroundColor: Colors.grey[200],
//                     valueColor: AlwaysStoppedAnimation<Color>(
//                       candidate.isLeading ? Colors.green : Colors.blue,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Text(
//               '${candidate.votes} votes',
//               style: const TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }