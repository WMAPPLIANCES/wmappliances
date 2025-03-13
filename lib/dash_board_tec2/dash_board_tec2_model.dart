import '/flutter_flow/flutter_flow_util.dart';
import 'dash_board_tec2_widget.dart' show DashBoardTec2Widget;
import 'package:flutter/material.dart';

class DashBoardTec2Model extends FlutterFlowModel<DashBoardTec2Widget> {
  ///  State fields for stateful widgets in this page.

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
