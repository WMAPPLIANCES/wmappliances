import '/appointment/pages/nav_bar1/nav_bar1_widget.dart';
import '/backend/supabase/supabase.dart';
import '/components/side_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dashboard_technician_widget.dart' show DashboardTechnicianWidget;
import 'package:flutter/material.dart';

class DashboardTechnicianModel
    extends FlutterFlowModel<DashboardTechnicianWidget> {
  ///  Local state fields for this page.

  bool viewDetail = false;

  bool viewNotes = false;

  DateTime? dateTime;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in dashboardTechnician widget.
  List<StockPartsRow>? queryStock;
  // Stores action output result for [Backend Call - Query Rows] action in dashboardTechnician widget.
  List<DiagnosesRow>? queryDiagnosis;
  // Stores action output result for [Backend Call - Query Rows] action in dashboardTechnician widget.
  List<DiagnosesRow>? queryDiagnosisPArts;
  // Stores action output result for [Backend Call - Query Rows] action in dashboardTechnician widget.
  List<SchedulesRow>? followUp;
  // Model for sideMenuView component.
  late SideMenuViewModel sideMenuViewModel;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    sideMenuViewModel = createModel(context, () => SideMenuViewModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    sideMenuViewModel.dispose();
    navBar1Model.dispose();
  }
}
