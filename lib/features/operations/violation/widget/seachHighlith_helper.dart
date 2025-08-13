import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class HighlightedText extends StatelessWidget {
  final String text;
  final String query;
  final TextStyle style;
  final Color highlightColor;

  const HighlightedText({
    super.key,
    required this.text,
    required this.query,
    required this.style,
    this.highlightColor = Colors.yellow,
  });

  @override
  Widget build(BuildContext context) {
    if (query.isEmpty || !text.toLowerCase().contains(query.toLowerCase())) {
      return Text(text, style: style);
    }

    final matches = query.toLowerCase().allMatches(text.toLowerCase());
    final spans = <TextSpan>[];
    int lastEnd = 0;

    for (final match in matches) {
      // Add non-matching text before the match
      if (match.start > lastEnd) {
        spans.add(
          TextSpan(text: text.substring(lastEnd, match.start), style: style),
        );
      }

      // Add matching text with highlight
      spans.add(
        TextSpan(
          text: text.substring(match.start, match.end),
          style: style.copyWith(
            backgroundColor: highlightColor,
            fontWeight: FontFamilies.bold,
          ),
        ),
      );

      lastEnd = match.end;
    }

    // Add remaining non-matching text
    if (lastEnd < text.length) {
      spans.add(TextSpan(text: text.substring(lastEnd), style: style));
    }

    return RichText(text: TextSpan(children: spans));
  }
}
