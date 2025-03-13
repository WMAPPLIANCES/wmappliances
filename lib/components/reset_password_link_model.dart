import '/flutter_flow/flutter_flow_util.dart';
import 'reset_password_link_widget.dart' show ResetPasswordLinkWidget;
import 'package:flutter/material.dart';

class ResetPasswordLinkModel extends FlutterFlowModel<ResetPasswordLinkWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
