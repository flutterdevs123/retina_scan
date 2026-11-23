import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retina_scan_app/models/user_model.dart';
import 'package:retina_scan_app/models/user_role.dart';
import 'package:retina_scan_app/res/constants/app_strings.dart';
import 'package:retina_scan_app/res/routes/app_routes.dart';
import 'package:retina_scan_app/res/services/auth_service.dart';
import 'package:retina_scan_app/res/utils/form_controller_mixin.dart';

/// Handles login validation, role detection and navigation to the
/// dashboard that matches the user's role.
class LoginController extends GetxController with FormControllerMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// Error shown above the login button (wrong email or password).
  final Rxn<String> loginError = Rxn<String>();

  /// Hard-coded demo accounts. The role is decided by the email.
  /// TODO: Remove when the real backend login is connected.
  static const List<_DemoAccount> _accounts = <_DemoAccount>[
    _DemoAccount(
      name: 'Demo Doctor',
      email: 'doctor@gmail.com',
      password: '123456',
      role: UserRole.doctor,
    ),
    _DemoAccount(
      name: 'Demo Patient',
      email: 'patient@gmail.com',
      password: '123456',
      role: UserRole.patient,
    ),
  ];

  @override
  List<TextEditingController> get textControllers =>
      <TextEditingController>[emailController, passwordController];

  @override
  void onInit() {
    super.onInit();
    // Hide the old error as soon as the user edits any field.
    emailController.addListener(_clearError);
    passwordController.addListener(_clearError);
  }

  /// Validates the form, checks the account and opens the role dashboard.
  void login() {
    closeKeyboard();

    // Stop here if any validator returns an error.
    if (!validateForm()) return;

    final _DemoAccount? account = _findAccount(
      emailController.text.trim().toLowerCase(),
      passwordController.text,
    );

    if (account == null) {
      loginError.value = AppStrings.errInvalidCredentials;
      return;
    }

    // Save the session so middleware and dashboards know who is logged in.
    Get.find<AuthService>().setUser(
      UserModel(
        name: account.name,
        email: account.email,
        role: account.role,
      ),
    );

    clearForm();
    // Removes login from the back stack and opens the matching dashboard.
    Get.offAllNamed(AppRoutes.dashboardFor(account.role));
  }

  /// Opens the forgot password screen (fields are cleared first).
  void goToForgotPassword() {
    _resetScreen();
    Get.toNamed(AppRoutes.forgotPassword);
  }

  /// Opens the sign up screen (fields are cleared first).
  void goToSignUp() {
    _resetScreen();
    Get.toNamed(AppRoutes.signUp);
  }

  /// Returns the account that matches the email and password, or null.
  _DemoAccount? _findAccount(String email, String password) {
    for (final _DemoAccount account in _accounts) {
      if (account.email == email && account.password == password) {
        return account;
      }
    }
    return null;
  }

  /// Clears typed text, validation errors and the login error.
  void _resetScreen() {
    clearForm();
    loginError.value = null;
  }

  void _clearError() {
    if (loginError.value != null) loginError.value = null;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

/// Temporary account used until the real backend is connected.
class _DemoAccount {
  const _DemoAccount({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });

  final String name;
  final String email;
  final String password;
  final UserRole role;
}