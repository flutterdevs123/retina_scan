import 'package:get/get.dart';
import 'package:retina_scan_app/models/user_model.dart';

/// Keeps the current user in memory for the whole app session.
/// Registered once in `main.dart` and used by controllers and middleware.
class AuthService extends GetxService {
  /// Currently logged in user. Null means nobody is logged in.
  final Rxn<UserModel> currentUser = Rxn<UserModel>();

  /// True when a user is logged in.
  bool get isLoggedIn => currentUser.value != null;

  /// Saves the user after a successful login.
  void setUser(UserModel user) => currentUser.value = user;

  /// Clears the session.
  void logout() => currentUser.value = null;
}