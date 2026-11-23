import 'package:get/get.dart';
import 'package:retina_scan_app/models/user_role.dart';
import 'package:retina_scan_app/res/routes/app_routes.dart';
import 'package:retina_scan_app/res/routes/role_middleware.dart';
import 'package:retina_scan_app/view/doctor_dashboard_screen.dart';
import 'package:retina_scan_app/view/forgot_password_screen.dart';
import 'package:retina_scan_app/view/login_screen.dart';
import 'package:retina_scan_app/view/onboarding_screen.dart';
import 'package:retina_scan_app/view/patient_dashboard_screen.dart';
import 'package:retina_scan_app/view/signup_screen.dart';
import 'package:retina_scan_app/view/splash_screen.dart';
import 'package:retina_scan_app/view/verify_email_screen.dart';
import 'package:retina_scan_app/view_models/doctor_dashboard_controller.dart';
import 'package:retina_scan_app/view_models/forgot_password_controller.dart';
import 'package:retina_scan_app/view_models/login_controller.dart';
import 'package:retina_scan_app/view_models/onboarding_controller.dart';
import 'package:retina_scan_app/view_models/patient_dashboard_controller.dart';
import 'package:retina_scan_app/view_models/signup_controller.dart';
import 'package:retina_scan_app/view_models/splash_controller.dart';
import 'package:retina_scan_app/view_models/verify_email_controller.dart';

/// Maps every route name to its screen and controller binding.
class AppPages {
  AppPages._();

  /// First route shown when the app starts.
  static const String initial = AppRoutes.splash;

  /// Short duration so screen changes feel instant.
  static const Duration transitionDuration = Duration(milliseconds: 200);

  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      // Controller is created only when the screen opens.
      binding: BindingsBuilder<dynamic>(() {
        Get.lazyPut<SplashController>(() => SplashController());
      }),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
      binding: BindingsBuilder<dynamic>(() {
        Get.lazyPut<OnboardingController>(() => OnboardingController());
      }),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: BindingsBuilder<dynamic>(() {
        Get.lazyPut<LoginController>(() => LoginController());
      }),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: AppRoutes.signUp,
      page: () => const SignupScreen(),
      binding: BindingsBuilder<dynamic>(() {
        Get.lazyPut<SignupController>(() => SignupController());
      }),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: AppRoutes.verifyEmail,
      page: () => const VerifyEmailScreen(),
      binding: BindingsBuilder<dynamic>(() {
        Get.lazyPut<VerifyEmailController>(() => VerifyEmailController());
      }),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      binding: BindingsBuilder<dynamic>(() {
        Get.lazyPut<ForgotPasswordController>(
              () => ForgotPasswordController(),
        );
      }),
      transition: Transition.rightToLeft,
    ),
    // -------------------------------------------------------------------------
    // Protected routes: RoleMiddleware blocks users with the wrong role.
    // -------------------------------------------------------------------------
    GetPage<dynamic>(
      name: AppRoutes.doctorDashboard,
      page: () => const DoctorDashboardScreen(),
      middlewares: <GetMiddleware>[RoleMiddleware(UserRole.doctor)],
      binding: BindingsBuilder<dynamic>(() {
        Get.lazyPut<DoctorDashboardController>(
              () => DoctorDashboardController(),
        );
      }),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: AppRoutes.patientDashboard,
      page: () => const PatientDashboardScreen(),
      middlewares: <GetMiddleware>[RoleMiddleware(UserRole.patient)],
      binding: BindingsBuilder<dynamic>(() {
        Get.lazyPut<PatientDashboardController>(
              () => PatientDashboardController(),
        );
      }),
      transition: Transition.fadeIn,
    ),
  ];
}