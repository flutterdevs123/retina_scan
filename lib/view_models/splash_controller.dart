import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retina_scan_app/res/routes/app_routes.dart';

/// Controls all splash animations and the delay before the next screen.
class SplashController extends GetxController
    with GetTickerProviderStateMixin {
  static const Duration _entranceDuration = Duration(milliseconds: 1000);
  static const Duration _loopDuration = Duration(milliseconds: 2600);
  static const Duration _splashDuration = Duration(seconds: 3);

  /// Plays once: logo and text appear.
  late final AnimationController entranceController;

  /// Repeats forever: drives pulse rings and the scan line.
  late final AnimationController loopController;

  /// Plays once: fills the progress bar, then opens the next screen.
  late final AnimationController progressController;

  late final Animation<double> logoFade;
  late final Animation<double> logoScale;
  late final Animation<double> textFade;
  late final Animation<Offset> textSlide;

  @override
  void onInit() {
    super.onInit();

    entranceController = AnimationController(
      vsync: this,
      duration: _entranceDuration,
    );
    loopController = AnimationController(
      vsync: this,
      duration: _loopDuration,
    );
    progressController = AnimationController(
      vsync: this,
      duration: _splashDuration,
    );

    // Logo appears first.
    logoFade = CurvedAnimation(
      parent: entranceController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    );
    logoScale = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(
        parent: entranceController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOutBack),
      ),
    );

    // Text follows slightly later.
    final CurvedAnimation textCurve = CurvedAnimation(
      parent: entranceController,
      curve: const Interval(0.4, 1.0, curve: Curves.easeOutCubic),
    );
    textFade = textCurve;
    textSlide = Tween<Offset>(
      begin: const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(textCurve);

    // Move to the next screen when the progress bar is full.
    progressController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) _navigateToNext();
    });

    entranceController.forward();
    loopController.repeat();
    progressController.forward();
  }

  /// Opens the onboarding screen and removes the splash from the stack.
  void _navigateToNext() {
    // TODO: Later, skip onboarding for returning users (check a saved flag).
    Get.offAllNamed(AppRoutes.onboarding);
  }

  @override
  void onClose() {
    entranceController.dispose();
    loopController.dispose();
    progressController.dispose();
    super.onClose();
  }
}