import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/appErrorBody/buildEmptyBody.dart';
import 'package:curnectgate/core/appErrorBody/buildErroUl.dart';
import 'package:curnectgate/core/appErrorBody/expireSessionBody.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/%20operations/property_agreement/provider/agreement_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class AgreementData extends ConsumerWidget {
  const AgreementData({super.key});
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agreementAsync = ref.watch(agreementProvider);
    return agreementAsync.when(
      data: (agreement) {
        try {
          final user = agreement?.data;
          return user != null
              ? _contents(
                content: user.agreements?.propertyAgreement?.content ?? "",
              )
              : EmptyBodys(message: "No data?");
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(agreementProvider.notifier)
                    .refreshAgreement(context, ref),
            firstMessae: "Faile to load data?",
          );
        }
      },
      loading: () {
        try {
          final cachedProfile = ref.read(agreementProvider).value;
          final data =
              cachedProfile?.data?.agreements?.propertyAgreement?.content ?? "";
          return cachedProfile?.data?.agreements != null
              ? _contents(content: data)
              : Loadingstates();
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(agreementProvider.notifier)
                    .refreshAgreement(context, ref),
            firstMessae: "Faile to load data?",
          );
        }
      },
      error: (error, stack) {
        try {
          // Handle session expiration
          if (error.toString().contains("Unauthorized")) {
            return Expiresessionbody();
          }

          // Try to show cached data
          final cachedProfile = ref.read(agreementProvider).value;
          final data =
              cachedProfile?.data?.agreements?.propertyAgreement?.content ?? "";
          if (cachedProfile?.data?.agreements != null) {
            return _contents(content: data);
          }

          // No cached data available
          return Builderroul(
            error: error.toString(),
            onTap:
                () => ref
                    .read(agreementProvider.notifier)
                    .refreshAgreement(context, ref),
            firstMessae: "Faile to load data?",
          );
        } catch (e) {
          return Builderroul(
            error: e.toString(),
            onTap:
                () => ref
                    .read(agreementProvider.notifier)
                    .refreshAgreement(context, ref),
            firstMessae: "Faile to load data?",
          );
        }
      },
    );
  }

  Widget _contents({required String content}) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          fontWeight: FontFamilies.regular,
          fontSize: 15,
          color: AppColors.instance.black600,
          height: 1.6,
        ),
        children: _buildFormattedText(content),
      ),
    );
  }

  List<TextSpan> _buildFormattedText(String text) {
    final List<TextSpan> spans = [];
    final RegExp urlRegex = RegExp(r'https?://[^\s]+', caseSensitive: false);

    // Split text by URLs to handle clickable links separately
    final matches = urlRegex.allMatches(text).toList();
    int lastEnd = 0;

    for (final match in matches) {
      // Add normal text before URL
      if (match.start > lastEnd) {
        spans.add(TextSpan(text: text.substring(lastEnd, match.start)));
      }

      // Add clickable URL
      final String url = text.substring(match.start, match.end);
      spans.add(
        TextSpan(
          text: url,
          style: const TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w500,
          ),
          recognizer: TapGestureRecognizer()..onTap = () => _launchUrl(url),
        ),
      );

      lastEnd = match.end;
    }

    // Add remaining text after last URL
    if (lastEnd < text.length) {
      spans.add(TextSpan(text: text.substring(lastEnd)));
    }

    // Optional: Bold specific phrases (e.g., "2026 vision", "$1000")
    // You can extend this with more patterns if needed

    return spans;
  }
}
