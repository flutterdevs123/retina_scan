import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retina_scan_app/models/onboarding_model.dart';
import 'package:retina_scan_app/res/constants/app_strings.dart';
import 'package:retina_scan_app/res/routes/app_routes.dart';

/// Controls the onboarding pages: current page, next and skip actions.
class OnboardingController extends GetxController {
  /// Drives the PageView.
  final PageController pageController = PageController();

  /// Index of the visible page (observed by the UI).
  final RxInt currentIndex = 0.obs;

  /// Content of all onboarding pages.
  final List<OnboardingModel> pages = const <OnboardingModel>[
    OnboardingModel(
      icon: Icons.remove_red_eye_rounded,
      accentIcons: <IconData>[
        Icons.center_focus_strong_rounded,
        Icons.bolt_rounded,
      ],
      title: AppStrings.onboardingTitle1,
      description: AppStrings.onboardingDesc1,
    ),
    OnboardingModel(
      icon: Icons.analytics_rounded,
      accentIcons: <IconData>[
        Icons.auto_awesome_rounded,
        Icons.insights_rounded,
      ],
      title: AppStrings.onboardingTitle2,
      description: AppStrings.onboardingDesc2,
    ),
    OnboardingModel(
      icon: Icons.verified_user_rounded,
      accentIcons: <IconData>[
        Icons.lock_rounded,
        Icons.folder_shared_rounded,
      ],
      title: AppStrings.onboardingTitle3,
      description: AppStrings.onboardingDesc3,
    ),
  ];

  /// True when the last page is visible.
  bool get isLastPage => currentIndex.value == pages.length - 1;

  /// Called by the PageView on swipe or button press.
  void onPageChanged(int index) => currentIndex.value = index;

  /// Goes to the next page, or finishes onboarding on the last page.
  void next() {
    if (isLastPage) {
      _finish();
      return;
    }
    pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutCubic,
    );
  }

  /// Skips all remaining pages.
  void skip() => _finish();

  /// Leaves onboarding and opens the login screen (onboarding is removed
  /// from the back stack, so the user can't return to it).
  void _finish() => Get.offAllNamed(AppRoutes.login);

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}