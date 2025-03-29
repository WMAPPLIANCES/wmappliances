import '/components/side_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loguin/user_list/user_list_widget.dart';
import 'assign_user_widget.dart' show AssignUserWidget;
import 'package:flutter/material.dart';

class AssignUserModel extends FlutterFlowModel<AssignUserWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideMenuView component.
  late SideMenuViewModel sideMenuViewModel;
  // Models for userList dynamic component.
  late FlutterFlowDynamicModels<UserListModel> userListModels;

  @override
  void initState(BuildContext context) {
    sideMenuViewModel = createModel(context, () => SideMenuViewModel());
    userListModels = FlutterFlowDynamicModels(() => UserListModel());
  }

  @override
  void dispose() {
    sideMenuViewModel.dispose();
    userListModels.dispose();
  }
}
