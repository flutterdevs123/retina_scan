import 'package:retina_scan_app/res/constants/app_strings.dart';
import 'package:retina_scan_app/view_models/base_dashboard_controller.dart';

/// Logic of the patient dashboard.
class PatientDashboardController extends BaseDashboardController {
  // TODO: Replace these sample values with real data from the API.
  final int totalScans = 4;
  final String lastResult = AppStrings.resultNormal;
}