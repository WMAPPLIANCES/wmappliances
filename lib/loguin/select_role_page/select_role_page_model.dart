import '/flutter_flow/flutter_flow_util.dart';
import 'select_role_page_widget.dart' show SelectRolePageWidget;
import 'package:flutter/material.dart';

class SelectRolePageModel extends FlutterFlowModel<SelectRolePageWidget> {
  ///  Local state fields for this page.

  String technician = 'user';

  String dispatch = 'user';

  String manager = 'user';

  String officeManager = 'user';

  bool officeComputer = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for technician widget.
  bool? technicianValue;
  // State field(s) for dispatch widget.
  bool? dispatchValue;
  // State field(s) for manager widget.
  bool? managerValue;
  // State field(s) for officemanager widget.
  bool? officemanagerValue;
  // State field(s) for officecomputer widget.
  bool? officecomputerValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
