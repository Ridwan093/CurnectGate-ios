import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserProfile {
  final String userProfilePix;
  final String userName;
  final String userRole;
  final String memberId;
  final String estateName;
  final String lastLogin;
  final String email;
  final String phoneNumber;

  UserProfile({
    required this.userProfilePix,
    required this.userName,
    required this.userRole,
    required this.memberId,
    required this.estateName,
    required this.lastLogin,
    required this.email,
    required this.phoneNumber,
  });
}

class ProfileDetailScreen extends ConsumerStatefulWidget {
  final UserProfile profile;

  const ProfileDetailScreen({super.key, required this.profile});

  @override
  ConsumerState<ProfileDetailScreen> createState() =>
      _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends ConsumerState<ProfileDetailScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profile = widget.profile;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back_ios, color: AppColors.instance.black600),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Profile Details',
          style: TextStyle(
            color: AppColors.instance.black600,

            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: FadeTransition(
        opacity: _fadeAnim,
        child: SlideTransition(
          position: _slideAnim,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              _buildHeader(profile),
              const SizedBox(height: 24),
              _buildInfoCard(profile),
              const SizedBox(height: 32),
             
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(UserProfile profile) {
    return Column(
      children: [
        Hero(
          tag: 'profile-pix',
          child: CircleAvatar(
            radius: 48,
            backgroundColor: Colors.grey.shade200,
            backgroundImage:
                profile.userProfilePix.isNotEmpty
                    ? NetworkImage(profile.userProfilePix)
                    : null,
            child:
                profile.userProfilePix.isEmpty
                    ? Icon(
                      Icons.person,
                      size: 40,
                      color: AppColors.instance.black500,
                    )
                    : null,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          profile.userName,
          style: TextStyle(
            fontSize: 20,
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black600,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.instance.teal200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            profile.userRole,
            style: TextStyle(
              fontSize: 12,
              fontFamily: FontFamilies.interDisplay,

              color: AppColors.instance.black600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(UserProfile profile) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 20,
            offset: Offset(0, 10),
            color: Color(0x14000000),
          ),
        ],
      ),
      child: Column(
        children: [
          _infoRow('Member ID', profile.memberId),
          _divider(),
          _infoRow('Estate', profile.estateName),

          _divider(),
          _infoRow('Email', profile.email),
          _divider(),
          _infoRow('Phone Number', profile.phoneNumber),
        ],
      ),
    );
  }

  Widget _divider() => const Padding(
    padding: EdgeInsets.symmetric(vertical: 12),
    child: Divider(height: 1),
  );

  Widget _infoRow(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black300,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            value.isEmpty ? '-' : value,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
            ),
          ),
        ),
      ],
    );
  }

}
