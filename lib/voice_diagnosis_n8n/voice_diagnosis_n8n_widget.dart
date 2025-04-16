import '/components/voice_diagnosis2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'voice_diagnosis_n8n_model.dart';
export 'voice_diagnosis_n8n_model.dart';

class VoiceDiagnosisN8nWidget extends StatefulWidget {
  const VoiceDiagnosisN8nWidget({super.key});

  static String routeName = 'voiceDiagnosisN8n';
  static String routePath = '/voiceDiagnosisN8n';

  @override
  State<VoiceDiagnosisN8nWidget> createState() =>
      _VoiceDiagnosisN8nWidgetState();
}

class _VoiceDiagnosisN8nWidgetState extends State<VoiceDiagnosisN8nWidget> {
  late VoiceDiagnosisN8nModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VoiceDiagnosisN8nModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'voiceDiagnosisN8n',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.voiceDiagnosis2Model,
                      updateCallback: () => safeSetState(() {}),
                      child: VoiceDiagnosis2Widget(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
