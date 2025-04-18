import '/flutter_flow/flutter_flow_util.dart';
import 'part_cost_update_widget.dart' show PartCostUpdateWidget;
import 'package:flutter/material.dart';

class PartCostUpdateModel extends FlutterFlowModel<PartCostUpdateWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
