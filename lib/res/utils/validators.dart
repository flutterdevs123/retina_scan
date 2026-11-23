import 'package:retina_scan_app/res/constants/app_strings.dart';

/// Reusable form validators. Each one returns `null` when the value is valid,
/// or an error message that the field shows under itself.
///
/// Usage: `validator: Validators.email`
class Validators {
  Validators._();

  /// Basic email format: something@something.domain
  static final RegExp _emailRegex = RegExp(
    r'^[\w\.\-+]+@([\w\-]+\.)+[\w\-]{2,}$',
  );

  static final RegExp _hasLetter = RegExp(r'[A-Za-z]');
  static final RegExp _hasDigit = RegExp(r'\d');

  /// Minimum length of a new password.
  static const int _minPasswordLength = 8;

  /// Minimum length of a full name.
  static const int _minNameLength = 3;

  /// Full name: required and at least [_minNameLength] characters.
  static String? fullName(String? value) {
    final String text = value?.trim() ?? '';
    if (text.isEmpty) return AppStrings.errNameRequired;
    if (text.length < _minNameLength) return AppStrings.errNameShort;
    return null;
  }

  /// Email: required and must look like a real address.
  static String? email(String? value) {
    final String text = value?.trim() ?? '';
    if (text.isEmpty) return AppStrings.errEmailRequired;
    if (!_emailRegex.hasMatch(text)) return AppStrings.errEmailInvalid;
    return null;
  }

  /// Password on the login screen: only checks that something is entered.
  static String? requiredPassword(String? value) {
    if (value == null || value.isEmpty) return AppStrings.errPasswordRequired;
    return null;
  }

  /// Password on the sign up screen: min length, one letter and one digit.
  static String? newPassword(String? value) {
    if (value == null || value.isEmpty) return AppStrings.errPasswordRequired;
    if (value.length < _minPasswordLength) return AppStrings.errPasswordShort;
    if (!_hasLetter.hasMatch(value) || !_hasDigit.hasMatch(value)) {
      return AppStrings.errPasswordWeak;
    }
    return null;
  }

  /// Confirm password: required and must match [original].
  static String? confirmPassword(String? value, String original) {
    if (value == null || value.isEmpty) return AppStrings.errConfirmRequired;
    if (value != original) return AppStrings.errPasswordMismatch;
    return null;
  }
}