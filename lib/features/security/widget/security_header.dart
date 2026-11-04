// lib/widgets/security_header.dart
import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/local_store/User_localdata_provider.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/security/model/duty_model/duty_helper.dart';
import 'package:curnectgate/features/security/provider/duty_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart'; // for nice date formatting

class PremiumSecurityHeader extends ConsumerStatefulWidget {
  const PremiumSecurityHeader({super.key});

  @override
  ConsumerState<PremiumSecurityHeader> createState() =>
      _PremiumSecurityHeaderState();
}

class _PremiumSecurityHeaderState extends ConsumerState<PremiumSecurityHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _slide = Tween(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _getFormattedDate() {
    final now = DateTime.now();
    return DateFormat('EEEE, MMM d').format(now);
  }

  void _showDateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: AppColors.instance.teal400,
                    onPrimary: Colors.white,
                    surface: Colors.white,
                    onSecondary: Colors.white,
                    primaryContainer: AppColors.instance.teal400,

                    onSurface: AppColors.instance.black600, // normal text color
                  ),
                  datePickerTheme: DatePickerThemeData(
                    todayForegroundColor: MaterialStateProperty.all(
                      AppColors.instance.grey200,
                    ),
                    todayBorder: BorderSide(
                      color: AppColors.instance.teal400,
                      width: 1.5,
                    ),
                  ),
                ),
                child: CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  onDateChanged: (_) {},
                ),
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final user = authState.user;

    final memberID = user?["member_code"] ?? "";
    final estateName = user?['estate_name'] ?? "";

    // Extract first and last word logic
    String firstWord = "";
    // ignore: unused_local_variable
    String lastWord = "";

    if (estateName.trim().isNotEmpty) {
      final parts = estateName.trim().split(RegExp(r"\s+"));
      final containsEstate = parts.contains("Estate");

      if (containsEstate) {
        lastWord = "ESTATE";
        final filtered = parts.where((w) => w != "Estate").toList();
        firstWord = filtered.isNotEmpty ? "${filtered.first}." : "";
      } else {
        firstWord = parts.isNotEmpty ? "${parts.first}." : "";
        lastWord =
            parts.length > 1
                ? parts.last.toUpperCase()
                : parts.first.toUpperCase();
      }
    }

    final isSmall = MediaQuery.sizeOf(context).width < 360;
    final fontScale = isSmall ? 0.92 : 1.0;

    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: Card(
          elevation: 12,
          margin: EdgeInsets.zero,
          shadowColor: Colors.black.withOpacity(.12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
                color: AppColors.instance.teal400,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$firstWord",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: FontFamilies.interDisplay,
                              fontSize: isSmall ? 18 : 20,
                              fontWeight: FontFamilies.bold,
                              color: AppColors.instance.grey200,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "ESTATE",
                            style: TextStyle(
                              fontFamily: FontFamilies.interDisplay,
                              fontSize: isSmall ? 13 : 15,
                              letterSpacing: isSmall ? 6 : 8,
                              color: AppColors.instance.grey400,
                              fontWeight: FontFamilies.medium,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// RIGHT QR
                    Column(
                      children: [
                        Image.asset(
                          AssetPaths.qrCode,
                          width: isSmall ? 36 : 42,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          memberID,
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 11,
                            fontWeight: FontFamilies.bold,
                            color: AppColors.instance.grey200,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// ================= BOTTOM =================
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(10, 26, 10, 14),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDuty(),
                        // _timeRow(
                        //   "06:00 AM - 06:00 PM",
                        //   "",
                        //   Icons.access_time,
                        //   true,
                        //   fontScale,
                        // ),
                        Divider(color: AppColors.instance.grey300),
                        GestureDetector(
                          onTap: () => _showDateDialog(context),
                          child: _timeRow(
                            _getFormattedDate(),
                            "",
                            Icons.calendar_month,
                            false,
                            fontScale,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// 🔥 PREMIUM GLASS PILL
                  Positioned(
                    top: -16,
                    left: 10,
                    child: _PremiumEstatePill(estateName: estateName),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDuty() {
    final isSmall = MediaQuery.sizeOf(context).width < 360;
    final fontScale = isSmall ? 0.92 : 1.0;

    final dutyState = ref.watch(dutyProvider);
    return dutyState.when(
      data: (profile) {
        try {
          final dutyData = profile?.data;
          final dutyUi = DutyUiMapper.mapCurrentDuty(dutyData);
          return _timeRow(
            dutyUi.dutyTime,
            dutyUi.label,
            Icons.access_time,
            true,
            fontScale,
          );
        } catch (e) {
          return _timeRow(
            "----..----",
            "----..----",
            Icons.access_time,
            true,
            fontScale,
          );
        }
      },
      loading: () {
        return _timeRow(
          "----..----",
          "----..----",
          Icons.access_time,
          true,
          fontScale,
        );
      },
      error: (error, stack) {
        try {
          // Handle session expiration
          if (error.toString().contains("Unauthorized")) {
            return _timeRow(
              "----..----",
              "----..----",
              Icons.access_time,
              true,
              fontScale,
            );
          }

          // Try to show cached data
          final cachDuty = ref.read(dutyProvider).value;
          if (cachDuty != null) {
            final dutyUi = DutyUiMapper.mapCurrentDuty(cachDuty.data);
            return _timeRow(
              dutyUi.dutyTime,
              dutyUi.label,
              Icons.access_time,
              true,
              fontScale,
            );
          }

          // No cached data available
          return _timeRow(
            "----..----",
            "----..----",
            Icons.access_time,
            true,
            fontScale,
          );
        } catch (e) {
          return _timeRow(
            "----..----",
            "----..----",
            Icons.access_time,
            true,
            fontScale,
          );
        }
      },
    );
  }

  Widget _timeRow(
    String text,
    String duty,
    IconData icon,
    bool isDuty,
    double scale,
  ) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.instance.black400),
        const SizedBox(width: 8),
        if (isDuty)
          Text(
            duty,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 14 * scale,
              color: AppColors.instance.black400,
            ),
          ),
        Expanded(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 14 * scale,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black500,
            ),
          ),
        ),
      ],
    );
  }
}

class _PremiumEstatePill extends StatelessWidget {
  final String estateName;

  const _PremiumEstatePill({required this.estateName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(.95),
            Colors.white.withOpacity(.88),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.white.withOpacity(.6)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_on, size: 14, color: AppColors.instance.teal400),
          const SizedBox(width: 6),
          Text(
            estateName.isEmpty ? "Estate" : estateName,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
            ),
          ),
        ],
      ),
    );
  }
}
