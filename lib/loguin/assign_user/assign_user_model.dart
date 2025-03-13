import '/components/side_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'assign_user_widget.dart' show AssignUserWidget;
import 'package:flutter/material.dart';

class AssignUserModel extends FlutterFlowModel<AssignUserWidget> {
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
