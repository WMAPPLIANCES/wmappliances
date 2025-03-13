import '/flutter_flow/flutter_flow_util.dart';
import 'notes_wo_widget.dart' show NotesWoWidget;
import 'package:flutter/material.dart';

class NotesWoModel extends FlutterFlowModel<NotesWoWidget> {
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
