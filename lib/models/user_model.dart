import 'package:retina_scan_app/models/user_role.dart';

/// Basic data of the logged in (or newly registered) user.
class UserModel {
  const UserModel({
    required this.name,
    required this.email,
    required this.role,
  });

  /// Full name of the user.
  final String name;

  /// Email address (always stored in lower case).
  final String email;

  /// Role that decides which dashboard the user can open.
  final UserRole role;
}