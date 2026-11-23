import 'package:get/get.dart';
import 'package:retina_scan_app/models/user_model.dart';
import 'package:retina_scan_app/res/routes/app_routes.dart';
import 'package:retina_scan_app/res/services/auth_service.dart';

/// Logic shared by every dashboard controller (DRY).
abstract class BaseDashboardController extends GetxController {
  final AuthService _auth = Get.find<AuthService>();

  /// Logged in user (null only if the session was cleared).
  UserModel? get user => _auth.currentUser.value;

  /// Name shown in the dashboard header.
  String get userName => user?.name ?? '';

  /// Clears the session and returns to login. The back stack is removed,
  /// so the user can't go back to the dashboard.
  void logout() {
    _auth.logout();
    Get.offAllNamed(AppRoutes.login);
  }
}