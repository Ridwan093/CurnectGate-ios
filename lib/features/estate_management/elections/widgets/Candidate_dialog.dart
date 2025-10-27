import 'dart:ui';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class CandidateDialog extends StatefulWidget {
  final String name;
  final String role;
  final String party;
  final String bio;
  final int voteShare;
  final int totalVotes;
  final String avatarUrl;

  const CandidateDialog({
    super.key,
    required this.name,
    required this.role,
    required this.party,
    required this.bio,
    required this.voteShare,
    required this.totalVotes,
    required this.avatarUrl,
  });

  @override
  State<CandidateDialog> createState() => _CandidateDialogState();
}

class _CandidateDialogState extends State<CandidateDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _glowController;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(), // tap outside to close
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Center(
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.95, end: 1).animate(
                CurvedAnimation(
                  parent: _glowController,
                  curve: Curves.easeInOut,
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                clipBehavior: Clip.antiAlias,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Gradient header
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.instance.teal300,
                              AppColors.instance.teal500,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // avatar glow wrapper
                            AnimatedBuilder(
                              animation: _glowController,
                              builder: (_, __) {
                                double glow = 6 + (_glowController.value * 6);
                                return Container(
                                  padding: EdgeInsets.all(glow),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(0.1),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(
                                          0.6 + (_glowController.value * 0.4),
                                        ),
                                        blurRadius: glow * 2,
                                        spreadRadius: glow / 2,
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 45,
                                    backgroundImage: NetworkImage(
                                      widget.avatarUrl,
                                    ),
                                  ),
                                );
                              },
                            ),
                            Positioned(
                              top: 16,
                              right: 16,
                              child: GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.close,
                                    color: AppColors.instance.black600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontFamilies.bold,
                          color: AppColors.instance.black600,
                          fontFamily: FontFamilies.interDisplay,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.party,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.instance.grey300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Running for ${widget.role}",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.instance.black400,
                            fontFamily: FontFamilies.interDisplay,
                          ),
                        ),
                      ),

                      const SizedBox(height: 22),

                      // Biography
                      _sectionTitle(icon: Icons.person, title: "Biography"),
                      _sectionContent(widget.bio),
                      SizedBox(height: 20),
                      _sectionTitle(icon: Icons.flag, title: "Manifesto"),
                      _sectionContent(widget.bio),

                      // Vote stats
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            _voteCard(
                              "${widget.voteShare}%",
                              "Current Vote Share",
                            ),
                            const SizedBox(width: 16),
                            _voteCard("${widget.totalVotes}", "Total Votes"),
                          ],
                        ),
                      ),

                      // Vote Button
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.instance.black600,
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {},
                          icon: Icon(
                            Icons.check,
                            color: AppColors.instance.teal100,
                          ),
                          label: Text(
                            "Vote for ${widget.name.split(' ').first}",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: FontFamilies.interDisplay,
                              color: AppColors.instance.teal100,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _voteCard(String value, String label) {
    return Expanded(
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontFamilies.bold,
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.teal400,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontFamily: FontFamilies.interDisplay,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle({required IconData icon, required String title}) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.black87),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontWeight.w700,
              color: AppColors.instance.black600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionContent(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          color: AppColors.instance.black300,
          fontFamily: FontFamilies.interDisplay,
        ),
      ),
    );
  }
}
