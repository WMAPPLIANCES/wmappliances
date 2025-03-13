import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_part_botton_sheet_widget.dart' show AddPartBottonSheetWidget;
import 'package:flutter/material.dart';

class AddPartBottonSheetModel
    extends FlutterFlowModel<AddPartBottonSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for partname widget.
  FocusNode? partnameFocusNode;
  TextEditingController? partnameTextController;
  String? Function(BuildContext, String?)? partnameTextControllerValidator;
  // State field(s) for partnumber widget.
  FocusNode? partnumberFocusNode;
  TextEditingController? partnumberTextController;
  String? Function(BuildContext, String?)? partnumberTextControllerValidator;
  // State field(s) for qty widget.
  FocusNode? qtyFocusNode;
  TextEditingController? qtyTextController;
  String? Function(BuildContext, String?)? qtyTextControllerValidator;
  // State field(s) for link widget.
  FocusNode? linkFocusNode;
  TextEditingController? linkTextController;
  String? Function(BuildContext, String?)? linkTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Save widget.
  PartsRow? error;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    partnameFocusNode?.dispose();
    partnameTextController?.dispose();

    partnumberFocusNode?.dispose();
    partnumberTextController?.dispose();

    qtyFocusNode?.dispose();
    qtyTextController?.dispose();

    linkFocusNode?.dispose();
    linkTextController?.dispose();
  }
}
