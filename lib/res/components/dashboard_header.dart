import 'package:flutter/material.dart';
import 'package:retina_scan_app/models/user_role.dart';
import 'package:retina_scan_app/res/components/app_logo.dart';
import 'package:retina_scan_app/res/constants/app_strings.dart';
import 'package:retina_scan_app/res/responsive/responsive_extensions.dart';

/// Top section shared by every dashboard: avatar, greeting, name,
/// role badge and a logout button.
class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    super.key,
    required this.name,
    required this.role,
    required this.onLogout,
  });

  /// Name of the logged in user.
  final String name;

  /// Role of the logged in user (shown as a badge).
  final UserRole role;

  /// Called when the logout button is tapped.
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;

    return Row(
      children: <Widget>[
        AppLogo(size: 56, icon: role.icon),
        14.hSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                AppStrings.welcomeBack,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
              2.vSpace,
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              6.vSpace,
              _RoleBadge(role: role),
            ],
          ),
        ),
        IconButton(
          onPressed: onLogout,
          tooltip: AppStrings.logOut,
          icon: Icon(
            Icons.logout_rounded,
            size: 24.sz,
            color: scheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

/// Small pill that shows the role name.
class _RoleBadge extends StatelessWidget {
  const _RoleBadge({required this.role});

  final UserRole role;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color color = theme.colorScheme.primary;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.sz, vertical: 4.sz),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20.sz),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(role.icon, size: 14.sz, color: color),
          6.hSpace,
          Text(
            role.label,
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}