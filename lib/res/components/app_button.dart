import 'package:flutter/material.dart';
import 'package:retina_scan_app/res/responsive/responsive_extensions.dart';

/// Reusable primary button used across the whole app.
///
/// Usage: `AppButton(label: 'Continue', onPressed: controller.submit)`
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.width,
  });

  /// Button text.
  final String label;

  /// Tap callback. Pass null to disable the button.
  final VoidCallback? onPressed;

  /// Optional icon shown after the label.
  final IconData? icon;

  /// Shows a loader instead of the label and blocks taps.
  final bool isLoading;

  /// Fixed design width. Null means full width.
  final double? width;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;

    return SizedBox(
      width: width?.sz ?? double.infinity,
      height: 54.sz,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          disabledBackgroundColor: scheme.primary.withValues(alpha: 0.5),
          disabledForegroundColor: scheme.onPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.sz),
          ),
        ),
        child: isLoading
            ? SizedBox(
          width: 22.sz,
          height: 22.sz,
          child: CircularProgressIndicator(
            strokeWidth: 2.5.sz,
            color: scheme.onPrimary,
          ),
        )
            : Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: scheme.onPrimary,
                ),
              ),
            ),
            if (icon != null) ...<Widget>[
              8.hSpace,
              Icon(icon, size: 20.sz),
            ],
          ],
        ),
      ),
    );
  }
}