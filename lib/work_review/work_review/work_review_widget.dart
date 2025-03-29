import '/backend/supabase/supabase.dart';
import '/components/diagnosis_view_b_s_widget.dart';
import '/components/side_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/work_review/work_status_notes/work_status_notes_widget.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'work_review_model.dart';
export 'work_review_model.dart';

class WorkReviewWidget extends StatefulWidget {
  const WorkReviewWidget({super.key});

  static String routeName = 'work_review';
  static String routePath = '/work_review';

  @override
  State<WorkReviewWidget> createState() => _WorkReviewWidgetState();
}

class _WorkReviewWidgetState extends State<WorkReviewWidget> {
  late WorkReviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkReviewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DiagnosesRow>>(
      future: DiagnosesTable().queryRows(
        queryFn: (q) => q,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<DiagnosesRow> workReviewDiagnosesRowList = snapshot.data!;

        return Title(
            title: 'work_review',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                body: Stack(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      child: Stack(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  decoration: BoxDecoration(),
                                  child: wrapWithModel(
                                    model: _model.sideMenuViewModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: SideMenuViewWidget(),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100.0,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 24.0, 24.0, 24.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Work Management',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 16.0)),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    24.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: Container(
                                                          width: 400.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child:
                                                                SingleChildScrollView(
                                                              primary: false,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Diagnosis',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Manrope',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            8.0,
                                                                            4.0,
                                                                            8.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(8.0),
                                                                            child:
                                                                                Text(
                                                                              '1',
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            4.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.transparent,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(4.0),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final diagnosisFilter = workReviewDiagnosesRowList.toList();

                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    children: List.generate(diagnosisFilter.length, (diagnosisFilterIndex) {
                                                                                      final diagnosisFilterItem = diagnosisFilter[diagnosisFilterIndex];
                                                                                      return Visibility(
                                                                                        visible: diagnosisFilterItem.status == 'Diagnosis',
                                                                                        child: Expanded(
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            height: 170.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsets.all(8.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        if (diagnosisFilterItem.approvalStatus == 'Updated')
                                                                                                          Container(
                                                                                                            width: 8.0,
                                                                                                            height: 100.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).warning,
                                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                        Expanded(
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Flexible(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              valueOrDefault<String>(
                                                                                                                                diagnosisFilterItem.workOrderId,
                                                                                                                                'wmId',
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                                    fontFamily: 'Manrope',
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                              children: [
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                                                  child: InkWell(
                                                                                                                                    splashColor: Colors.transparent,
                                                                                                                                    focusColor: Colors.transparent,
                                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                                    onTap: () async {
                                                                                                                                      await DiagnosesTable().update(
                                                                                                                                        data: {
                                                                                                                                          'pending': true,
                                                                                                                                          'approval_status': 'Pending',
                                                                                                                                        },
                                                                                                                                        matchingRows: (rows) => rows.eqOrNull(
                                                                                                                                          'diagnosis_id',
                                                                                                                                          valueOrDefault<String>(
                                                                                                                                            diagnosisFilterItem.diagnosisId,
                                                                                                                                            '003006202',
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      );
                                                                                                                                      await showModalBottomSheet(
                                                                                                                                        isScrollControlled: true,
                                                                                                                                        backgroundColor: Colors.transparent,
                                                                                                                                        enableDrag: false,
                                                                                                                                        context: context,
                                                                                                                                        builder: (context) {
                                                                                                                                          return WebViewAware(
                                                                                                                                            child: GestureDetector(
                                                                                                                                              onTap: () {
                                                                                                                                                FocusScope.of(context).unfocus();
                                                                                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                              },
                                                                                                                                              child: Padding(
                                                                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                                child: Container(
                                                                                                                                                  height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                                                                                  child: WorkStatusNotesWidget(
                                                                                                                                                    workReviewNotes: diagnosisFilterItem,
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          );
                                                                                                                                        },
                                                                                                                                      ).then((value) => safeSetState(() {}));
                                                                                                                                    },
                                                                                                                                    child: Container(
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                                                                      ),
                                                                                                                                      child: Padding(
                                                                                                                                        padding: EdgeInsets.all(8.0),
                                                                                                                                        child: Text(
                                                                                                                                          'Pending',
                                                                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                                                                letterSpacing: 0.0,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 8.0),
                                                                                                                                  child: InkWell(
                                                                                                                                    splashColor: Colors.transparent,
                                                                                                                                    focusColor: Colors.transparent,
                                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                                    onTap: () async {
                                                                                                                                      await DiagnosesTable().update(
                                                                                                                                        data: {
                                                                                                                                          'status': 'Approved',
                                                                                                                                          'approval_status': 'Approved',
                                                                                                                                        },
                                                                                                                                        matchingRows: (rows) => rows.eqOrNull(
                                                                                                                                          'diagnosis_id',
                                                                                                                                          valueOrDefault<String>(
                                                                                                                                            diagnosisFilterItem.diagnosisId,
                                                                                                                                            '003006202',
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      );

                                                                                                                                      FFAppState().update(() {});
                                                                                                                                    },
                                                                                                                                    child: Container(
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                                                                      ),
                                                                                                                                      child: Padding(
                                                                                                                                        padding: EdgeInsets.all(8.0),
                                                                                                                                        child: Text(
                                                                                                                                          'Approved',
                                                                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                                                                letterSpacing: 0.0,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                                        child: Text(
                                                                                                                          valueOrDefault<String>(
                                                                                                                            diagnosisFilterItem.item,
                                                                                                                            'Appliance',
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                                              children: [
                                                                                                                                Icon(
                                                                                                                                  Icons.person_rounded,
                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                  size: 16.0,
                                                                                                                                ),
                                                                                                                                Align(
                                                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                                  child: Text(
                                                                                                                                    valueOrDefault<String>(
                                                                                                                                      diagnosisFilterItem.technicianName,
                                                                                                                                      'technician_name',
                                                                                                                                    ),
                                                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                          fontFamily: 'Manrope',
                                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                        ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ].divide(SizedBox(width: 4.0)),
                                                                                                                            ),
                                                                                                                            Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                              children: [
                                                                                                                                Icon(
                                                                                                                                  Icons.calendar_today,
                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                  size: 16.0,
                                                                                                                                ),
                                                                                                                                Text(
                                                                                                                                  dateTimeFormat("relative", diagnosisFilterItem.createdAt!),
                                                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                        fontFamily: 'Manrope',
                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ].divide(SizedBox(width: 4.0)),
                                                                                                                            ),
                                                                                                                          ].divide(SizedBox(width: 12.0)),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Expanded(
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                          child: Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                            children: [
                                                                                                                              Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: [
                                                                                                                                  Align(
                                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                                    child: FFButtonWidget(
                                                                                                                                      onPressed: () async {
                                                                                                                                        await showModalBottomSheet(
                                                                                                                                          isScrollControlled: true,
                                                                                                                                          backgroundColor: Colors.transparent,
                                                                                                                                          enableDrag: false,
                                                                                                                                          context: context,
                                                                                                                                          builder: (context) {
                                                                                                                                            return WebViewAware(
                                                                                                                                              child: GestureDetector(
                                                                                                                                                onTap: () {
                                                                                                                                                  FocusScope.of(context).unfocus();
                                                                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                                },
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                                  child: Container(
                                                                                                                                                    height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                                                                    child: DiagnosisViewBSWidget(
                                                                                                                                                      diagnosisParameterWorkId: diagnosisFilterItem,
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            );
                                                                                                                                          },
                                                                                                                                        ).then((value) => safeSetState(() {}));
                                                                                                                                      },
                                                                                                                                      text: 'View Diagnosis',
                                                                                                                                      options: FFButtonOptions(
                                                                                                                                        width: 218.1,
                                                                                                                                        height: 36.0,
                                                                                                                                        padding: EdgeInsets.all(8.0),
                                                                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                                        textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                              fontFamily: 'Manrope',
                                                                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                            ),
                                                                                                                                        elevation: 0.0,
                                                                                                                                        borderSide: BorderSide(
                                                                                                                                          color: Colors.transparent,
                                                                                                                                        ),
                                                                                                                                        borderRadius: BorderRadius.circular(18.0),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                                                              ),
                                                                                                                            ].divide(SizedBox(width: 4.0)),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ].divide(SizedBox(height: 4.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ].divide(SizedBox(width: 8.0)),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ].divide(SizedBox(width: 8.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }).divide(
                                                                                      SizedBox(height: 12.0),
                                                                                      filterFn: (diagnosisFilterIndex) {
                                                                                        final diagnosisFilterItem = diagnosisFilter[diagnosisFilterIndex];
                                                                                        return diagnosisFilterItem.status == 'Diagnosis';
                                                                                      },
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 8.0)),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        4.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    24.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: Container(
                                                          width: 400.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child:
                                                                SingleChildScrollView(
                                                              primary: false,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Follow Up',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Manrope',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            8.0,
                                                                            4.0,
                                                                            8.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(8.0),
                                                                            child:
                                                                                Text(
                                                                              '2',
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            4.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.all(4.0),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final diagnosisFilter = workReviewDiagnosesRowList.toList();

                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: List.generate(diagnosisFilter.length, (diagnosisFilterIndex) {
                                                                                  final diagnosisFilterItem = diagnosisFilter[diagnosisFilterIndex];
                                                                                  return Visibility(
                                                                                    visible: diagnosisFilterItem.status == 'Follow Up',
                                                                                    child: Expanded(
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        height: 170.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsets.all(8.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    if (diagnosisFilterItem.approvalStatus == 'Updated')
                                                                                                      Container(
                                                                                                        width: 8.0,
                                                                                                        height: 100.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).warning,
                                                                                                          borderRadius: BorderRadius.circular(4.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                    Expanded(
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Flexible(
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          valueOrDefault<String>(
                                                                                                                            diagnosisFilterItem.workOrderId,
                                                                                                                            'wmId',
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                          children: [
                                                                                                                            Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                                              child: InkWell(
                                                                                                                                splashColor: Colors.transparent,
                                                                                                                                focusColor: Colors.transparent,
                                                                                                                                hoverColor: Colors.transparent,
                                                                                                                                highlightColor: Colors.transparent,
                                                                                                                                onTap: () async {
                                                                                                                                  await DiagnosesTable().update(
                                                                                                                                    data: {
                                                                                                                                      'pending': true,
                                                                                                                                      'approval_status': 'Pending',
                                                                                                                                    },
                                                                                                                                    matchingRows: (rows) => rows.eqOrNull(
                                                                                                                                      'diagnosis_id',
                                                                                                                                      valueOrDefault<String>(
                                                                                                                                        diagnosisFilterItem.diagnosisId,
                                                                                                                                        '00300',
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                  await showModalBottomSheet(
                                                                                                                                    isScrollControlled: true,
                                                                                                                                    backgroundColor: Colors.transparent,
                                                                                                                                    enableDrag: false,
                                                                                                                                    context: context,
                                                                                                                                    builder: (context) {
                                                                                                                                      return WebViewAware(
                                                                                                                                        child: GestureDetector(
                                                                                                                                          onTap: () {
                                                                                                                                            FocusScope.of(context).unfocus();
                                                                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                          },
                                                                                                                                          child: Padding(
                                                                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                            child: Container(
                                                                                                                                              height: MediaQuery.sizeOf(context).height * 0.4,
                                                                                                                                              child: WorkStatusNotesWidget(
                                                                                                                                                workReviewNotes: diagnosisFilterItem,
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      );
                                                                                                                                    },
                                                                                                                                  ).then((value) => safeSetState(() {}));

                                                                                                                                  Navigator.pop(context);

                                                                                                                                  safeSetState(() {});
                                                                                                                                },
                                                                                                                                child: Container(
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                                                  ),
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsets.all(8.0),
                                                                                                                                    child: Text(
                                                                                                                                      'Pending',
                                                                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                            fontFamily: 'Manrope',
                                                                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 8.0),
                                                                                                                              child: InkWell(
                                                                                                                                splashColor: Colors.transparent,
                                                                                                                                focusColor: Colors.transparent,
                                                                                                                                hoverColor: Colors.transparent,
                                                                                                                                highlightColor: Colors.transparent,
                                                                                                                                onTap: () async {
                                                                                                                                  await DiagnosesTable().update(
                                                                                                                                    data: {
                                                                                                                                      'status': 'Approved',
                                                                                                                                      'approval_status': 'Approved',
                                                                                                                                    },
                                                                                                                                    matchingRows: (rows) => rows.eqOrNull(
                                                                                                                                      'diagnosis_id',
                                                                                                                                      valueOrDefault<String>(
                                                                                                                                        diagnosisFilterItem.diagnosisId,
                                                                                                                                        '003006202',
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  );

                                                                                                                                  FFAppState().update(() {});
                                                                                                                                },
                                                                                                                                child: Container(
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                                                  ),
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsets.all(8.0),
                                                                                                                                    child: Text(
                                                                                                                                      'Approved',
                                                                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                            fontFamily: 'Manrope',
                                                                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ].divide(SizedBox(width: 8.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                                    child: Text(
                                                                                                                      valueOrDefault<String>(
                                                                                                                        diagnosisFilterItem.item,
                                                                                                                        'Appliance',
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                            fontFamily: 'Manrope',
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                      children: [
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                                          children: [
                                                                                                                            Icon(
                                                                                                                              Icons.person_rounded,
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                              size: 16.0,
                                                                                                                            ),
                                                                                                                            Align(
                                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                              child: Text(
                                                                                                                                valueOrDefault<String>(
                                                                                                                                  diagnosisFilterItem.technicianName,
                                                                                                                                  'technician_name',
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                      fontFamily: 'Manrope',
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ].divide(SizedBox(width: 4.0)),
                                                                                                                        ),
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Icon(
                                                                                                                              Icons.calendar_today,
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                              size: 16.0,
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              dateTimeFormat("relative", diagnosisFilterItem.createdAt!),
                                                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                    fontFamily: 'Manrope',
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ].divide(SizedBox(width: 4.0)),
                                                                                                                        ),
                                                                                                                      ].divide(SizedBox(width: 12.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Expanded(
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                        children: [
                                                                                                                          Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Align(
                                                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                                child: FFButtonWidget(
                                                                                                                                  onPressed: () async {
                                                                                                                                    await showModalBottomSheet(
                                                                                                                                      isScrollControlled: true,
                                                                                                                                      backgroundColor: Colors.transparent,
                                                                                                                                      enableDrag: false,
                                                                                                                                      context: context,
                                                                                                                                      builder: (context) {
                                                                                                                                        return WebViewAware(
                                                                                                                                          child: GestureDetector(
                                                                                                                                            onTap: () {
                                                                                                                                              FocusScope.of(context).unfocus();
                                                                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                            },
                                                                                                                                            child: Padding(
                                                                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                              child: Container(
                                                                                                                                                height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                                                                child: DiagnosisViewBSWidget(
                                                                                                                                                  diagnosisParameterWorkId: diagnosisFilterItem,
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        );
                                                                                                                                      },
                                                                                                                                    ).then((value) => safeSetState(() {}));
                                                                                                                                  },
                                                                                                                                  text: 'View Diagnosis',
                                                                                                                                  options: FFButtonOptions(
                                                                                                                                    width: 218.1,
                                                                                                                                    height: 36.0,
                                                                                                                                    padding: EdgeInsets.all(8.0),
                                                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                          fontFamily: 'Manrope',
                                                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                        ),
                                                                                                                                    elevation: 0.0,
                                                                                                                                    borderSide: BorderSide(
                                                                                                                                      color: Colors.transparent,
                                                                                                                                    ),
                                                                                                                                    borderRadius: BorderRadius.circular(18.0),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ].divide(SizedBox(width: 8.0)),
                                                                                                                          ),
                                                                                                                        ].divide(SizedBox(width: 4.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ].divide(SizedBox(height: 4.0)),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ].divide(SizedBox(width: 8.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }).divide(
                                                                                  SizedBox(height: 12.0),
                                                                                  filterFn: (diagnosisFilterIndex) {
                                                                                    final diagnosisFilterItem = diagnosisFilter[diagnosisFilterIndex];
                                                                                    return diagnosisFilterItem.status == 'Follow Up';
                                                                                  },
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 8.0)),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        4.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    24.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: Container(
                                                          width: 400.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child:
                                                                SingleChildScrollView(
                                                              primary: false,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Update',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Manrope',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            8.0,
                                                                            4.0,
                                                                            8.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(8.0),
                                                                            child:
                                                                                Text(
                                                                              '3',
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            4.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.all(4.0),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final diagnosisFilter = workReviewDiagnosesRowList.toList();

                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: List.generate(diagnosisFilter.length, (diagnosisFilterIndex) {
                                                                                  final diagnosisFilterItem = diagnosisFilter[diagnosisFilterIndex];
                                                                                  return Visibility(
                                                                                    visible: diagnosisFilterItem.status == 'Update',
                                                                                    child: Expanded(
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        height: 170.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsets.all(8.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    if (diagnosisFilterItem.approvalStatus == 'Updated')
                                                                                                      Container(
                                                                                                        width: 8.0,
                                                                                                        height: 100.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).warning,
                                                                                                          borderRadius: BorderRadius.circular(4.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                    Expanded(
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Flexible(
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          valueOrDefault<String>(
                                                                                                                            diagnosisFilterItem.workOrderId,
                                                                                                                            'wmId',
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                          children: [
                                                                                                                            Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                                              child: InkWell(
                                                                                                                                splashColor: Colors.transparent,
                                                                                                                                focusColor: Colors.transparent,
                                                                                                                                hoverColor: Colors.transparent,
                                                                                                                                highlightColor: Colors.transparent,
                                                                                                                                onTap: () async {
                                                                                                                                  await DiagnosesTable().update(
                                                                                                                                    data: {
                                                                                                                                      'pending': true,
                                                                                                                                      'approval_status': 'Pending',
                                                                                                                                    },
                                                                                                                                    matchingRows: (rows) => rows.eqOrNull(
                                                                                                                                      'diagnosis_id',
                                                                                                                                      valueOrDefault<String>(
                                                                                                                                        diagnosisFilterItem.diagnosisId,
                                                                                                                                        '00332',
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                  await showModalBottomSheet(
                                                                                                                                    isScrollControlled: true,
                                                                                                                                    backgroundColor: Colors.transparent,
                                                                                                                                    enableDrag: false,
                                                                                                                                    context: context,
                                                                                                                                    builder: (context) {
                                                                                                                                      return WebViewAware(
                                                                                                                                        child: GestureDetector(
                                                                                                                                          onTap: () {
                                                                                                                                            FocusScope.of(context).unfocus();
                                                                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                          },
                                                                                                                                          child: Padding(
                                                                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                            child: Container(
                                                                                                                                              height: MediaQuery.sizeOf(context).height * 0.4,
                                                                                                                                              child: WorkStatusNotesWidget(
                                                                                                                                                workReviewNotes: diagnosisFilterItem,
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      );
                                                                                                                                    },
                                                                                                                                  ).then((value) => safeSetState(() {}));

                                                                                                                                  Navigator.pop(context);

                                                                                                                                  safeSetState(() {});
                                                                                                                                },
                                                                                                                                child: Container(
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                                                  ),
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsets.all(8.0),
                                                                                                                                    child: Text(
                                                                                                                                      'Pending',
                                                                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                            fontFamily: 'Manrope',
                                                                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 8.0),
                                                                                                                              child: InkWell(
                                                                                                                                splashColor: Colors.transparent,
                                                                                                                                focusColor: Colors.transparent,
                                                                                                                                hoverColor: Colors.transparent,
                                                                                                                                highlightColor: Colors.transparent,
                                                                                                                                onTap: () async {
                                                                                                                                  await DiagnosesTable().update(
                                                                                                                                    data: {
                                                                                                                                      'status': 'Approved',
                                                                                                                                      'approval_status': 'Approved',
                                                                                                                                    },
                                                                                                                                    matchingRows: (rows) => rows.eqOrNull(
                                                                                                                                      'diagnosis_id',
                                                                                                                                      valueOrDefault<String>(
                                                                                                                                        diagnosisFilterItem.diagnosisId,
                                                                                                                                        '003006202',
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  );

                                                                                                                                  FFAppState().update(() {});
                                                                                                                                },
                                                                                                                                child: Container(
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                                                  ),
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsets.all(8.0),
                                                                                                                                    child: Text(
                                                                                                                                      'Approved',
                                                                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                            fontFamily: 'Manrope',
                                                                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ].divide(SizedBox(width: 8.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                                    child: Text(
                                                                                                                      valueOrDefault<String>(
                                                                                                                        diagnosisFilterItem.item,
                                                                                                                        'Appliance',
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                            fontFamily: 'Manrope',
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                      children: [
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                                          children: [
                                                                                                                            Icon(
                                                                                                                              Icons.person_rounded,
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                              size: 16.0,
                                                                                                                            ),
                                                                                                                            Align(
                                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                              child: Text(
                                                                                                                                valueOrDefault<String>(
                                                                                                                                  diagnosisFilterItem.technicianName,
                                                                                                                                  'technician_name',
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                      fontFamily: 'Manrope',
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ].divide(SizedBox(width: 4.0)),
                                                                                                                        ),
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Icon(
                                                                                                                              Icons.calendar_today,
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                              size: 16.0,
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              dateTimeFormat("relative", diagnosisFilterItem.createdAt!),
                                                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                    fontFamily: 'Manrope',
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ].divide(SizedBox(width: 4.0)),
                                                                                                                        ),
                                                                                                                      ].divide(SizedBox(width: 12.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Expanded(
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                        children: [
                                                                                                                          Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Align(
                                                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                                child: FFButtonWidget(
                                                                                                                                  onPressed: () async {
                                                                                                                                    await showModalBottomSheet(
                                                                                                                                      isScrollControlled: true,
                                                                                                                                      backgroundColor: Colors.transparent,
                                                                                                                                      enableDrag: false,
                                                                                                                                      context: context,
                                                                                                                                      builder: (context) {
                                                                                                                                        return WebViewAware(
                                                                                                                                          child: GestureDetector(
                                                                                                                                            onTap: () {
                                                                                                                                              FocusScope.of(context).unfocus();
                                                                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                            },
                                                                                                                                            child: Padding(
                                                                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                              child: Container(
                                                                                                                                                height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                                                                child: DiagnosisViewBSWidget(
                                                                                                                                                  diagnosisParameterWorkId: diagnosisFilterItem,
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        );
                                                                                                                                      },
                                                                                                                                    ).then((value) => safeSetState(() {}));
                                                                                                                                  },
                                                                                                                                  text: 'View Diagnosis',
                                                                                                                                  options: FFButtonOptions(
                                                                                                                                    width: 218.1,
                                                                                                                                    height: 36.0,
                                                                                                                                    padding: EdgeInsets.all(8.0),
                                                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                          fontFamily: 'Manrope',
                                                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                        ),
                                                                                                                                    elevation: 0.0,
                                                                                                                                    borderSide: BorderSide(
                                                                                                                                      color: Colors.transparent,
                                                                                                                                    ),
                                                                                                                                    borderRadius: BorderRadius.circular(18.0),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ].divide(SizedBox(width: 8.0)),
                                                                                                                          ),
                                                                                                                        ].divide(SizedBox(width: 4.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ].divide(SizedBox(height: 4.0)),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ].divide(SizedBox(width: 8.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }).divide(
                                                                                  SizedBox(height: 12.0),
                                                                                  filterFn: (diagnosisFilterIndex) {
                                                                                    final diagnosisFilterItem = diagnosisFilter[diagnosisFilterIndex];
                                                                                    return diagnosisFilterItem.status == 'Update';
                                                                                  },
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 8.0)),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        4.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    24.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: Container(
                                                          width: 400.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child:
                                                                SingleChildScrollView(
                                                              primary: false,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Pending',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Manrope',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            8.0,
                                                                            4.0,
                                                                            8.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(8.0),
                                                                            child:
                                                                                Text(
                                                                              '4',
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            4.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.all(4.0),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final diagnosisFilter = workReviewDiagnosesRowList.toList();

                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: List.generate(diagnosisFilter.length, (diagnosisFilterIndex) {
                                                                                  final diagnosisFilterItem = diagnosisFilter[diagnosisFilterIndex];
                                                                                  return Visibility(
                                                                                    visible: diagnosisFilterItem.status == 'Updated',
                                                                                    child: Expanded(
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        height: 170.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsets.all(8.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    if (diagnosisFilterItem.approvalStatus == 'Updated')
                                                                                                      Container(
                                                                                                        width: 8.0,
                                                                                                        height: 100.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).warning,
                                                                                                          borderRadius: BorderRadius.circular(4.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                    Expanded(
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Flexible(
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          valueOrDefault<String>(
                                                                                                                            diagnosisFilterItem.workOrderId,
                                                                                                                            'wmId',
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                          children: [
                                                                                                                            Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                                              child: InkWell(
                                                                                                                                splashColor: Colors.transparent,
                                                                                                                                focusColor: Colors.transparent,
                                                                                                                                hoverColor: Colors.transparent,
                                                                                                                                highlightColor: Colors.transparent,
                                                                                                                                onTap: () async {
                                                                                                                                  await DiagnosesTable().update(
                                                                                                                                    data: {
                                                                                                                                      'pending': true,
                                                                                                                                      'approval_status': 'Pending',
                                                                                                                                    },
                                                                                                                                    matchingRows: (rows) => rows.eqOrNull(
                                                                                                                                      'diagnosis_id',
                                                                                                                                      valueOrDefault<String>(
                                                                                                                                        diagnosisFilterItem.diagnosisId,
                                                                                                                                        '00300',
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                  await showModalBottomSheet(
                                                                                                                                    isScrollControlled: true,
                                                                                                                                    backgroundColor: Colors.transparent,
                                                                                                                                    enableDrag: false,
                                                                                                                                    context: context,
                                                                                                                                    builder: (context) {
                                                                                                                                      return WebViewAware(
                                                                                                                                        child: GestureDetector(
                                                                                                                                          onTap: () {
                                                                                                                                            FocusScope.of(context).unfocus();
                                                                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                          },
                                                                                                                                          child: Padding(
                                                                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                            child: Container(
                                                                                                                                              height: MediaQuery.sizeOf(context).height * 0.4,
                                                                                                                                              child: WorkStatusNotesWidget(
                                                                                                                                                workReviewNotes: diagnosisFilterItem,
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      );
                                                                                                                                    },
                                                                                                                                  ).then((value) => safeSetState(() {}));

                                                                                                                                  Navigator.pop(context);

                                                                                                                                  safeSetState(() {});
                                                                                                                                },
                                                                                                                                child: Container(
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                                                  ),
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsets.all(8.0),
                                                                                                                                    child: Text(
                                                                                                                                      'Pending',
                                                                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                            fontFamily: 'Manrope',
                                                                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 8.0),
                                                                                                                              child: InkWell(
                                                                                                                                splashColor: Colors.transparent,
                                                                                                                                focusColor: Colors.transparent,
                                                                                                                                hoverColor: Colors.transparent,
                                                                                                                                highlightColor: Colors.transparent,
                                                                                                                                onTap: () async {
                                                                                                                                  await DiagnosesTable().update(
                                                                                                                                    data: {
                                                                                                                                      'status': 'Approved',
                                                                                                                                      'approval_status': 'Approved',
                                                                                                                                    },
                                                                                                                                    matchingRows: (rows) => rows.eqOrNull(
                                                                                                                                      'diagnosis_id',
                                                                                                                                      valueOrDefault<String>(
                                                                                                                                        diagnosisFilterItem.diagnosisId,
                                                                                                                                        '003006202',
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                },
                                                                                                                                child: Container(
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                                                  ),
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsets.all(8.0),
                                                                                                                                    child: Text(
                                                                                                                                      'Approved',
                                                                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                            fontFamily: 'Manrope',
                                                                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ].divide(SizedBox(width: 8.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                                    child: Text(
                                                                                                                      valueOrDefault<String>(
                                                                                                                        diagnosisFilterItem.item,
                                                                                                                        'Appliance',
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                            fontFamily: 'Manrope',
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                      children: [
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                                          children: [
                                                                                                                            Icon(
                                                                                                                              Icons.person_rounded,
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                              size: 16.0,
                                                                                                                            ),
                                                                                                                            Align(
                                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                              child: Text(
                                                                                                                                valueOrDefault<String>(
                                                                                                                                  diagnosisFilterItem.technicianName,
                                                                                                                                  'technician_name',
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                      fontFamily: 'Manrope',
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ].divide(SizedBox(width: 4.0)),
                                                                                                                        ),
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Icon(
                                                                                                                              Icons.calendar_today,
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                              size: 16.0,
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              dateTimeFormat("relative", diagnosisFilterItem.createdAt!),
                                                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                    fontFamily: 'Manrope',
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ].divide(SizedBox(width: 4.0)),
                                                                                                                        ),
                                                                                                                      ].divide(SizedBox(width: 12.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Expanded(
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                        children: [
                                                                                                                          Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Align(
                                                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                                child: FFButtonWidget(
                                                                                                                                  onPressed: () async {
                                                                                                                                    await showModalBottomSheet(
                                                                                                                                      isScrollControlled: true,
                                                                                                                                      backgroundColor: Colors.transparent,
                                                                                                                                      enableDrag: false,
                                                                                                                                      context: context,
                                                                                                                                      builder: (context) {
                                                                                                                                        return WebViewAware(
                                                                                                                                          child: GestureDetector(
                                                                                                                                            onTap: () {
                                                                                                                                              FocusScope.of(context).unfocus();
                                                                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                            },
                                                                                                                                            child: Padding(
                                                                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                              child: Container(
                                                                                                                                                height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                                                                child: DiagnosisViewBSWidget(
                                                                                                                                                  diagnosisParameterWorkId: diagnosisFilterItem,
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        );
                                                                                                                                      },
                                                                                                                                    ).then((value) => safeSetState(() {}));
                                                                                                                                  },
                                                                                                                                  text: 'View Diagnosis',
                                                                                                                                  options: FFButtonOptions(
                                                                                                                                    width: 218.1,
                                                                                                                                    height: 36.0,
                                                                                                                                    padding: EdgeInsets.all(8.0),
                                                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                          fontFamily: 'Manrope',
                                                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                        ),
                                                                                                                                    elevation: 0.0,
                                                                                                                                    borderSide: BorderSide(
                                                                                                                                      color: Colors.transparent,
                                                                                                                                    ),
                                                                                                                                    borderRadius: BorderRadius.circular(18.0),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ].divide(SizedBox(width: 8.0)),
                                                                                                                          ),
                                                                                                                        ].divide(SizedBox(width: 4.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ].divide(SizedBox(height: 4.0)),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ].divide(SizedBox(width: 8.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }).divide(
                                                                                  SizedBox(height: 12.0),
                                                                                  filterFn: (diagnosisFilterIndex) {
                                                                                    final diagnosisFilterItem = diagnosisFilter[diagnosisFilterIndex];
                                                                                    return diagnosisFilterItem.status == 'Updated';
                                                                                  },
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 8.0)),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        4.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 16.0)),
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
