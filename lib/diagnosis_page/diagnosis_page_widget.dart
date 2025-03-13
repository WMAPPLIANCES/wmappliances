import '/backend/supabase/supabase.dart';
import '/components/diagnosis_view_b_s_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'diagnosis_page_model.dart';
export 'diagnosis_page_model.dart';

class DiagnosisPageWidget extends StatefulWidget {
  const DiagnosisPageWidget({
    super.key,
    required this.diagnosisParameterWorkId,
  });

  final DiagnosesRow? diagnosisParameterWorkId;

  static String routeName = 'DiagnosisPage';
  static String routePath = '/diagnosisPage';

  @override
  State<DiagnosisPageWidget> createState() => _DiagnosisPageWidgetState();
}

class _DiagnosisPageWidgetState extends State<DiagnosisPageWidget> {
  late DiagnosisPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DiagnosisPageModel());

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
        title: 'DiagnosisPage',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: wrapWithModel(
              model: _model.diagnosisViewBSModel,
              updateCallback: () => safeSetState(() {}),
              child: DiagnosisViewBSWidget(
                diagnosisParameterWorkId: widget.diagnosisParameterWorkId!,
              ),
            ),
          ),
        ));
  }
}
