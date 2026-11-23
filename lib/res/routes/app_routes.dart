import 'package:retina_scan_app/models/user_role.dart';

/// Route names only. Every new screen adds one constant here.
class AppRoutes {
  AppRoutes._();

  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signUp = '/sign-up';
  static const String verifyEmail = '/verify-email';
  static const String forgotPassword = '/forgot-password';
  static const String doctorDashboard = '/doctor-dashboard';
  static const String patientDashboard = '/patient-dashboard';

  /// Returns the dashboard route that belongs to [role].
  static String dashboardFor(UserRole role) {
    switch (role) {
      case UserRole.doctor:
        return doctorDashboard;
      case UserRole.patient:
        return patientDashboard;
    }
  }
}