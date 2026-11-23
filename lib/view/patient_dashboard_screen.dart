import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retina_scan_app/models/user_role.dart';
import 'package:retina_scan_app/res/components/action_card.dart';
import 'package:retina_scan_app/res/components/app_gradient_background.dart';
import 'package:retina_scan_app/res/components/dashboard_header.dart';
import 'package:retina_scan_app/res/components/responsive_scroll_body.dart';
import 'package:retina_scan_app/res/components/section_title.dart';
import 'package:retina_scan_app/res/components/stat_card.dart';
import 'package:retina_scan_app/res/constants/app_strings.dart';
import 'package:retina_scan_app/res/responsive/responsive_extensions.dart';
import 'package:retina_scan_app/view_models/patient_dashboard_controller.dart';

/// Basic dashboard for users with the patient role.
class PatientDashboardScreen extends GetView<PatientDashboardController> {
  const PatientDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBackground(
        child: ResponsiveScrollBody(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DashboardHeader(
                name: controller.userName,
                role: UserRole.patient,
                onLogout: controller.logout,
              ),
              24.vSpace,
              Row(
                children: <Widget>[
                  Expanded(
                    child: StatCard(
                      icon: Icons.remove_red_eye_rounded,
                      value: '${controller.totalScans}',
                      label: AppStrings.statTotalScans,
                    ),
                  ),
                  12.hSpace,
                  Expanded(
                    child: StatCard(
                      icon: Icons.verified_rounded,
                      value: controller.lastResult,
                      label: AppStrings.statLastResult,
                    ),
                  ),
                ],
              ),
              28.vSpace,
              const SectionTitle(title: AppStrings.quickActions),
              12.vSpace,
              const ActionCard(
                icon: Icons.center_focus_strong_rounded,
                title: AppStrings.actionStartScan,
                subtitle: AppStrings.actionStartScanDesc,
              ),
              12.vSpace,
              const ActionCard(
                icon: Icons.description_rounded,
                title: AppStrings.actionMyReports,
                subtitle: AppStrings.actionMyReportsDesc,
              ),
              12.vSpace,
              const ActionCard(
                icon: Icons.medical_services_rounded,
                title: AppStrings.actionFindDoctor,
                subtitle: AppStrings.actionFindDoctorDesc,
              ),
            ],
          ),
        ),
      ),
    );
  }
}