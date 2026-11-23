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
import 'package:retina_scan_app/view_models/doctor_dashboard_controller.dart';

/// Basic dashboard for users with the doctor role.
class DoctorDashboardScreen extends GetView<DoctorDashboardController> {
  const DoctorDashboardScreen({super.key});

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
                role: UserRole.doctor,
                onLogout: controller.logout,
              ),
              24.vSpace,
              Row(
                children: <Widget>[
                  Expanded(
                    child: StatCard(
                      icon: Icons.groups_rounded,
                      value: '${controller.patientsToday}',
                      label: AppStrings.statPatientsToday,
                    ),
                  ),
                  12.hSpace,
                  Expanded(
                    child: StatCard(
                      icon: Icons.pending_actions_rounded,
                      value: '${controller.pendingReports}',
                      label: AppStrings.statPendingReports,
                    ),
                  ),
                ],
              ),
              28.vSpace,
              const SectionTitle(title: AppStrings.quickActions),
              12.vSpace,
              const ActionCard(
                icon: Icons.people_alt_rounded,
                title: AppStrings.actionPatientList,
                subtitle: AppStrings.actionPatientListDesc,
              ),
              12.vSpace,
              const ActionCard(
                icon: Icons.image_search_rounded,
                title: AppStrings.actionReviewScans,
                subtitle: AppStrings.actionReviewScansDesc,
              ),
            ],
          ),
        ),
      ),
    );
  }
}