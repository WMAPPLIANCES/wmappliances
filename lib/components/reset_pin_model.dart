import '/flutter_flow/flutter_flow_util.dart';
import 'reset_pin_widget.dart' show ResetPinWidget;
import 'package:flutter/material.dart';

class ResetPinModel extends FlutterFlowModel<ResetPinWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
