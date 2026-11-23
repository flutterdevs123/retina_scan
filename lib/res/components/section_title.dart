import 'package:flutter/material.dart';

/// Heading used above a group of cards.
class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});

  /// Heading text.
  final String title;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Text(
      title,
      style: theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w700,
        color: theme.colorScheme.onSurface,
      ),
    );
  }
}