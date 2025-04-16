import '/components/voice_diagnosis2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'voice_diagnosis_n8n_widget.dart' show VoiceDiagnosisN8nWidget;
import 'package:flutter/material.dart';

class VoiceDiagnosisN8nModel extends FlutterFlowModel<VoiceDiagnosisN8nWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for voiceDiagnosis2 component.
  late VoiceDiagnosis2Model voiceDiagnosis2Model;

  @override
  void initState(BuildContext context) {
    voiceDiagnosis2Model = createModel(context, () => VoiceDiagnosis2Model());
  }

  @override
  void dispose() {
    voiceDiagnosis2Model.dispose();
  }
}
