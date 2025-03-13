import '/components/side_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'find_work_order_botton_sheet_widget.dart'
    show FindWorkOrderBottonSheetWidget;
import 'package:flutter/material.dart';

class FindWorkOrderBottonSheetModel
    extends FlutterFlowModel<FindWorkOrderBottonSheetWidget> {
  ///  Local state fields for this page.

  bool viewDetail = false;

  bool viewNotes = false;

  ///  State fields for stateful widgets in this page.

  // Model for sideMenuView component.
  late SideMenuViewModel sideMenuViewModel;

  @override
  void initState(BuildContext context) {
    sideMenuViewModel = createModel(context, () => SideMenuViewModel());
  }

  @override
  void dispose() {
    sideMenuViewModel.dispose();
  }
}
