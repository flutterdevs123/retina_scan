import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retina_scan_app/res/responsive/responsive_wrapper.dart';
import 'package:retina_scan_app/res/routes/app_pages.dart';
import 'package:retina_scan_app/res/services/auth_service.dart';
import 'package:retina_scan_app/res/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Session holder, available everywhere for the whole app lifetime.
  Get.put<AuthService>(AuthService(), permanent: true);

  runApp(const RetinaScanApp());
}

/// Root widget of the app.
class RetinaScanApp extends StatelessWidget {
  const RetinaScanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Retina Scan',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      // Follows the phone's light/dark setting.
      themeMode: ThemeMode.system,
      initialRoute: AppPages.initial,
      getPages: AppPages.pages,
      // Short transitions make navigation feel instant.
      defaultTransition: Transition.fadeIn,
      transitionDuration: AppPages.transitionDuration,
      // Makes every screen responsive.
      builder: (BuildContext context, Widget? child) {
        return ResponsiveWrapper(child: child ?? const SizedBox.shrink());
      },
    );
  }
}