import 'package:flutter/material.dart';
import '../models/election_models.dart';

class CandidateCard extends StatelessWidget {
  final Candidate candidate;
  final VoidCallback onVote;

  const CandidateCard({
    super.key,
    required this.candidate,
    required this.onVote,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              candidate.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              candidate.party,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onVote,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Vote for Candidate'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}