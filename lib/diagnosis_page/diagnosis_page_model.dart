import '/components/diagnosis_view_b_s_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'diagnosis_page_widget.dart' show DiagnosisPageWidget;
import 'package:flutter/material.dart';

class DiagnosisPageModel extends FlutterFlowModel<DiagnosisPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for diagnosisViewBS component.
  late DiagnosisViewBSModel diagnosisViewBSModel;

  @override
  void initState(BuildContext context) {
    diagnosisViewBSModel = createModel(context, () => DiagnosisViewBSModel());
  }

  @override
  void dispose() {
    diagnosisViewBSModel.dispose();
  }
}
