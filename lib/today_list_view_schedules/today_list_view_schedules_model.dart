import '/appointment/pages/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'today_list_view_schedules_widget.dart'
    show TodayListViewSchedulesWidget;
import 'package:flutter/material.dart';

class TodayListViewSchedulesModel
    extends FlutterFlowModel<TodayListViewSchedulesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    navBar1Model.dispose();
  }
}
