import '/flutter_flow/flutter_flow_util.dart';
import '/work_order_diagnosis_pages/diagnosis_botton_sheet/diagnosis_botton_sheet_widget.dart';
import 'diagnosis_part_widget.dart' show DiagnosisPartWidget;
import 'package:flutter/material.dart';

class DiagnosisPartModel extends FlutterFlowModel<DiagnosisPartWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for diagnosisBottonSheet component.
  late DiagnosisBottonSheetModel diagnosisBottonSheetModel;

  @override
  void initState(BuildContext context) {
    diagnosisBottonSheetModel =
        createModel(context, () => DiagnosisBottonSheetModel());
  }

  @override
  void dispose() {
    diagnosisBottonSheetModel.dispose();
  }
}
