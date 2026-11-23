import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retina_scan_app/models/user_model.dart';
import 'package:retina_scan_app/models/user_role.dart';
import 'package:retina_scan_app/res/routes/app_routes.dart';
import 'package:retina_scan_app/res/utils/form_controller_mixin.dart';

/// Handles sign up validation and opens the verify email screen.
class SignupController extends GetxController with FormControllerMixin {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  /// Role chosen by the user (patient by default).
  final Rx<UserRole> selectedRole = UserRole.patient.obs;

  @override
  List<TextEditingController> get textControllers => <TextEditingController>[
    nameController,
    emailController,
    passwordController,
    confirmPasswordController,
  ];

  /// Current password text, used by the confirm password validator.
  String get password => passwordController.text;

  /// Called when the user taps a role tile.
  void selectRole(UserRole role) => selectedRole.value = role;

  /// Validates the form, creates the account and asks for email verification.
  void signUp() {
    closeKeyboard();

    // Stop here if any validator returns an error.
    if (!validateForm()) return;

    // Read the values before the fields are cleared.
    final UserModel user = UserModel(
      name: nameController.text.trim(),
      email: emailController.text.trim().toLowerCase(),
      role: selectedRole.value,
    );

    // TODO: Call the real sign up API here.

    clearForm();
    // Replaces sign up with the verification screen (no way back to the form).
    Get.offNamed(AppRoutes.verifyEmail, arguments: user);
  }

  /// Goes back to the login screen (fields are cleared first).
  void goToLogin() {
    clearForm();
    Get.back();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}