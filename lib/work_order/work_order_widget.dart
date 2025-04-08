import '/backend/supabase/supabase.dart';
import '/components/appointment_sugested_time_component_widget.dart';
import '/components/diagnosis_view_b_s_widget.dart';
import '/components/print_parts_arrived_widget.dart';
import '/components/side_menu_view_widget.dart';
import '/components/work_order_status_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/work_order_diagnosis_pages/add_part_botton_sheet/add_part_botton_sheet_widget.dart';
import 'dart:async';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'work_order_model.dart';
export 'work_order_model.dart';

/// **Design Prompt for a Modern Responsive Work Order Interface**
///
/// Create a modern, responsive layout for displaying work orders on both
/// desktop and mobile devices.
///
/// ### Layout Requirements:
/// - **Header**: "Work Order" at the top.
/// - **Left Panel**: Include fields:
///   - **Work Order** (WoNumber)
///   - **Customer**
///   - **Tenant**
///   - **Address**
///   - **Detail**
///   - **Status**: Modern display with color-coded labels (e.g., green for
/// "Completed," yellow for "In Progress") and icons.
///
/// - **Right Panel**: Display a list of notes.
///
/// ### Design Features:
/// - Balanced screen split, clean fonts, and intuitive icons.
/// - Status field highlighted with subtle colors.
/// - Consistent padding and responsive scaling.
///
/// ### Mobile View:
/// - Stack panels, prioritize the information panel, and ensure
/// touch-friendly navigation. *** KEEP SIDE BAR***
class WorkOrderWidget extends StatefulWidget {
  const WorkOrderWidget({
    super.key,
    String? workOrderId,
  }) : this.workOrderId = workOrderId ?? 'id';

  final String workOrderId;

  static String routeName = 'workOrder';
  static String routePath = '/workOrder';

  @override
  State<WorkOrderWidget> createState() => _WorkOrderWidgetState();
}

class _WorkOrderWidgetState extends State<WorkOrderWidget> {
  late WorkOrderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkOrderModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.workOrderQueryOnPage = await WorkOrdersTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'work_order_id',
              widget.workOrderId,
            )
            .order('created_at'),
      );
      _model.queryPreviusJob = await WorkOrdersTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'customer_email',
              valueOrDefault<String>(
                _model.workOrderQueryOnPage?.firstOrNull?.customerEmail,
                '00300',
              ),
            )
            .order('created_at'),
      );
    });

    _model.switchValue1 = false;
    _model.switchValue2 = false;
    _model.switchValue3 = false;
    _model.switchValue4 = false;
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.switchValue5 = false;
    _model.addNoteDispatchTextController ??= TextEditingController();
    _model.addNoteDispatchFocusNode ??= FocusNode();

    _model.switchValue6 = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<DiagnosesRow>>(
      future: DiagnosesTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'work_order_id',
              widget.workOrderId,
            )
            .order('created_at'),
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
        List<DiagnosesRow> workOrderDiagnosesRowList = snapshot.data!;

        return Title(
            title: 'workOrder',
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
                body: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Stack(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                      ))
                        Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 1.0,
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
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.45,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 24.0, 24.0, 24.0),
                                            child: SingleChildScrollView(
                                              primary: false,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Work Order Details',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                  Material(
                                                    color: Colors.transparent,
                                                    elevation: 1.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    16.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              '${valueOrDefault<String>(
                                                                _model
                                                                    .workOrderQueryOnPage
                                                                    ?.firstOrNull
                                                                    ?.workOrderId,
                                                                '003006069',
                                                              )} - ${valueOrDefault<String>(
                                                                _model
                                                                    .workOrderQueryOnPage
                                                                    ?.firstOrNull
                                                                    ?.typeService,
                                                                'Normal',
                                                              )}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        30.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Icon(
                                                                              Icons.person_rounded,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 35.0,
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                _model.workOrderQueryOnPage?.firstOrNull?.customerName,
                                                                                'Willian Marciano',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    fontSize: 22.0,
                                                                                    letterSpacing: 0.0,
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
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Flexible(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Icon(
                                                                          Icons
                                                                              .email_sharp,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              35.0,
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              _model.workOrderQueryOnPage?.firstOrNull?.customerEmail,
                                                                              'support@wmappliances.net',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  fontSize: 22.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 8.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Expanded(
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Flexible(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Icon(
                                                                            Icons.add_home_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                35.0,
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                '${valueOrDefault<String>(
                                                                                  _model.workOrderQueryOnPage?.firstOrNull?.address,
                                                                                  '0',
                                                                                )}  ',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      fontSize: 22.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              if (valueOrDefault<String>(
                                                                                        _model.workOrderQueryOnPage?.firstOrNull?.apartmentNumber,
                                                                                        '0',
                                                                                      ) ==
                                                                                      '')
                                                                                Text(
                                                                                  'APT: ${_model.workOrderQueryOnPage?.firstOrNull?.apartmentNumber}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Manrope',
                                                                                        fontSize: 22.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ].divide(SizedBox(width: 8.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await launchUrl(
                                                                          Uri(
                                                                        scheme:
                                                                            'tel',
                                                                        path: valueOrDefault<
                                                                            String>(
                                                                          _model
                                                                              .workOrderQueryOnPage
                                                                              ?.firstOrNull
                                                                              ?.customerPhone,
                                                                          '+15109003030',
                                                                        ),
                                                                      ));
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Icon(
                                                                          Icons
                                                                              .phone,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              35.0,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              36.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '+1 ${valueOrDefault<String>(
                                                                              _model.workOrderQueryOnPage?.firstOrNull?.customerPhone,
                                                                              '5109003030',
                                                                            )}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  fontSize: 22.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 8.0)),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .calendar_month,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            35.0,
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          dateTimeFormat(
                                                                              "MMMEd",
                                                                              _model.workOrderQueryOnPage?.firstOrNull?.createdAt),
                                                                          '12',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Manrope',
                                                                              fontSize: 22.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Previous Job                                          ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  Switch
                                                                      .adaptive(
                                                                    value: _model
                                                                        .switchValue1!,
                                                                    onChanged:
                                                                        (newValue) async {
                                                                      safeSetState(() =>
                                                                          _model.switchValue1 =
                                                                              newValue);
                                                                      if (newValue) {
                                                                        _model.viewPreviousWorkOrder =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        _model.viewPreviousWorkOrder =
                                                                            false;
                                                                        safeSetState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    activeColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    activeTrackColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    inactiveTrackColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    inactiveThumbColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Job Description                                   ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  Switch
                                                                      .adaptive(
                                                                    value: _model
                                                                        .switchValue2!,
                                                                    onChanged:
                                                                        (newValue) async {
                                                                      safeSetState(() =>
                                                                          _model.switchValue2 =
                                                                              newValue);
                                                                      if (newValue) {
                                                                        _model.showDetail =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        _model.showDetail =
                                                                            false;
                                                                        safeSetState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    activeColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    activeTrackColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    inactiveTrackColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    inactiveThumbColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Appliance Requested                     ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  Switch
                                                                      .adaptive(
                                                                    value: _model
                                                                        .switchValue3!,
                                                                    onChanged:
                                                                        (newValue) async {
                                                                      safeSetState(() =>
                                                                          _model.switchValue3 =
                                                                              newValue);
                                                                      if (newValue) {
                                                                        _model.applianceRequested =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        _model.applianceRequested =
                                                                            false;
                                                                        safeSetState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    activeColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    activeTrackColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    inactiveTrackColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    inactiveThumbColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Sugested Appointment                 ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  Switch
                                                                      .adaptive(
                                                                    value: _model
                                                                        .switchValue4!,
                                                                    onChanged:
                                                                        (newValue) async {
                                                                      safeSetState(() =>
                                                                          _model.switchValue4 =
                                                                              newValue);
                                                                      if (newValue) {
                                                                        _model.showAppointmentRequested =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        _model.showAppointmentRequested =
                                                                            false;
                                                                        safeSetState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    activeColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    activeTrackColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    inactiveTrackColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    inactiveThumbColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (_model.showDetail == true)
                                                    Material(
                                                      color: Colors.transparent,
                                                      elevation: 1.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      16.0,
                                                                      16.0,
                                                                      16.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Job Description',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Manrope',
                                                                            fontSize:
                                                                                22.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                MarkdownBody(
                                                                              data: valueOrDefault<String>(
                                                                                _model.workOrderQueryOnPage?.firstOrNull?.detail,
                                                                                'No Detail Found',
                                                                              ),
                                                                              selectable: true,
                                                                              onTapLink: (_, url, __) => launchURL(url!),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 16.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (_model
                                                          .viewPreviousWorkOrder ==
                                                      true)
                                                    Material(
                                                      color: Colors.transparent,
                                                      elevation: 1.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      16.0,
                                                                      16.0,
                                                                      16.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Previous Job',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Manrope',
                                                                            fontSize:
                                                                                22.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final previusJob =
                                                                              _model.queryPreviusJob?.toList() ?? [];

                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                List.generate(previusJob.length, (previusJobIndex) {
                                                                              final previusJobItem = previusJob[previusJobIndex];
                                                                              return Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(8.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      context.pushNamed(
                                                                                        WorkOrderWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'workOrderId': serializeParam(
                                                                                            valueOrDefault<String>(
                                                                                              previusJobItem.workOrderId,
                                                                                              '124334',
                                                                                            ),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          kTransitionInfoKey: TransitionInfo(
                                                                                            hasTransition: true,
                                                                                            transitionType: PageTransitionType.fade,
                                                                                            duration: Duration(milliseconds: 0),
                                                                                          ),
                                                                                        },
                                                                                      );

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            previusJobItem.workOrderId,
                                                                                            '00300',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Manrope',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            previusJobItem.technician,
                                                                                            'Not Assing',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Manrope',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                        InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            context.pushNamed(
                                                                                              WorkOrderWidget.routeName,
                                                                                              queryParameters: {
                                                                                                'workOrderId': serializeParam(
                                                                                                  valueOrDefault<String>(
                                                                                                    previusJobItem.workOrderId,
                                                                                                    '51415',
                                                                                                  ),
                                                                                                  ParamType.String,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                              extra: <String, dynamic>{
                                                                                                kTransitionInfoKey: TransitionInfo(
                                                                                                  hasTransition: true,
                                                                                                  transitionType: PageTransitionType.fade,
                                                                                                  duration: Duration(milliseconds: 0),
                                                                                                ),
                                                                                              },
                                                                                            );

                                                                                            safeSetState(() {});
                                                                                          },
                                                                                          child: Icon(
                                                                                            Icons.work_history,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 16.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (_model
                                                          .showAppointmentRequested ==
                                                      true)
                                                    Material(
                                                      color: Colors.transparent,
                                                      elevation: 1.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      16.0,
                                                                      16.0,
                                                                      16.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Suggested Appointment Dates',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Manrope',
                                                                            fontSize:
                                                                                22.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          wrapWithModel(
                                                                            model:
                                                                                _model.appointmentSugestedTimeComponentModel,
                                                                            updateCallback: () =>
                                                                                safeSetState(() {}),
                                                                            child:
                                                                                AppointmentSugestedTimeComponentWidget(
                                                                              workOrder: valueOrDefault<String>(
                                                                                _model.workOrderQueryOnPage?.firstOrNull?.workOrderId,
                                                                                '342434',
                                                                              ),
                                                                              appointmentId: valueOrDefault<String>(
                                                                                _model.workOrderQueryOnPage?.firstOrNull?.appointmentId,
                                                                                '342434',
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 8.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 16.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  Material(
                                                    color: Colors.transparent,
                                                    elevation: 1.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Visibility(
                                                        visible: _model
                                                                .applianceRequested ==
                                                            true,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          16.0),
                                                              child: Text(
                                                                'Appliances Detail',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      fontSize:
                                                                          22.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          16.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 600.0,
                                                                child: custom_widgets
                                                                    .ListOfItems(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 600.0,
                                                                  items: _model
                                                                      .workOrderQueryOnPage
                                                                      ?.firstOrNull
                                                                      ?.items,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Material(
                                                    color: Colors.transparent,
                                                    elevation: 1.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    16.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Flexible(
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          16.0,
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Status',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          fontSize:
                                                                              22.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                  Expanded(
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Flexible(
                                                                          child:
                                                                              LinearPercentIndicator(
                                                                            percent:
                                                                                valueOrDefault<double>(
                                                                              _model.workOrderQueryOnPage?.firstOrNull?.workOrderBarValue,
                                                                              0.0,
                                                                            ),
                                                                            lineHeight:
                                                                                40.0,
                                                                            animation:
                                                                                true,
                                                                            animateFromLastPercent:
                                                                                true,
                                                                            progressColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).accent4,
                                                                            center:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                _model.workOrderQueryOnPage?.firstOrNull?.workOrderStatus,
                                                                                '0',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (FFAppState().dispatch ==
                                                                            'dispatch')
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
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
                                                                                              child: WorkOrderStatusWidget(
                                                                                                workOrderString: valueOrDefault<String>(
                                                                                                  _model.workOrderQueryOnPage?.firstOrNull?.workOrderId,
                                                                                                  '00300',
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => safeSetState(() {}));
                                                                                },
                                                                                text: 'Update Status',
                                                                                options: FFButtonOptions(
                                                                                  height: 40.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Manrope',
                                                                                        color: Colors.white,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                  elevation: 0.0,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        16.0)),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 16.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Material(
                                                    color: Colors.transparent,
                                                    elevation: 1.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    16.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'View Status',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Manrope',
                                                                    fontSize:
                                                                        22.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Flexible(
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Material(
                                                                                color: Colors.transparent,
                                                                                child: SwitchListTile.adaptive(
                                                                                  value: _model.switchListTileValue1 ??= false,
                                                                                  onChanged: (newValue) async {
                                                                                    safeSetState(() => _model.switchListTileValue1 = newValue);
                                                                                    if (newValue) {
                                                                                      _model.showSchedule = true;
                                                                                      safeSetState(() {});
                                                                                    } else {
                                                                                      _model.showSchedule = false;
                                                                                      safeSetState(() {});
                                                                                    }
                                                                                  },
                                                                                  title: Text(
                                                                                    'Appointment',
                                                                                    style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          fontSize: 18.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  activeColor: FlutterFlowTheme.of(context).alternate,
                                                                                  activeTrackColor: FlutterFlowTheme.of(context).primary,
                                                                                  dense: false,
                                                                                  controlAffinity: ListTileControlAffinity.trailing,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Material(
                                                                                color: Colors.transparent,
                                                                                child: SwitchListTile.adaptive(
                                                                                  value: _model.switchListTileValue2 ??= false,
                                                                                  onChanged: (newValue) async {
                                                                                    safeSetState(() => _model.switchListTileValue2 = newValue);
                                                                                    if (newValue) {
                                                                                      _model.showDiagnosisAppliance = true;
                                                                                      safeSetState(() {});
                                                                                    } else {
                                                                                      _model.showDiagnosisAppliance = false;
                                                                                      safeSetState(() {});
                                                                                    }
                                                                                  },
                                                                                  title: Text(
                                                                                    'Diagnosis Appliance',
                                                                                    style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          fontSize: 18.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  activeColor: FlutterFlowTheme.of(context).alternate,
                                                                                  activeTrackColor: FlutterFlowTheme.of(context).primary,
                                                                                  dense: false,
                                                                                  controlAffinity: ListTileControlAffinity.trailing,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Material(
                                                                                color: Colors.transparent,
                                                                                child: SwitchListTile.adaptive(
                                                                                  value: _model.switchListTileValue3 ??= false,
                                                                                  onChanged: (newValue) async {
                                                                                    safeSetState(() => _model.switchListTileValue3 = newValue);
                                                                                    if (newValue) {
                                                                                      _model.showPartRequested = true;
                                                                                      safeSetState(() {});
                                                                                    } else {
                                                                                      _model.showPartRequested = false;
                                                                                      safeSetState(() {});
                                                                                    }
                                                                                  },
                                                                                  title: Text(
                                                                                    'Part Requested',
                                                                                    style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          fontSize: 18.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  activeColor: FlutterFlowTheme.of(context).alternate,
                                                                                  activeTrackColor: FlutterFlowTheme.of(context).primary,
                                                                                  dense: false,
                                                                                  controlAffinity: ListTileControlAffinity.trailing,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Material(
                                                                                color: Colors.transparent,
                                                                                child: SwitchListTile.adaptive(
                                                                                  value: _model.switchListTileValue4 ??= false,
                                                                                  onChanged: (newValue) async {
                                                                                    safeSetState(() => _model.switchListTileValue4 = newValue);
                                                                                    if (newValue) {
                                                                                      _model.showNotes = true;
                                                                                      safeSetState(() {});
                                                                                    } else {
                                                                                      _model.showNotes = false;
                                                                                      safeSetState(() {});
                                                                                    }
                                                                                  },
                                                                                  title: Text(
                                                                                    'Notes',
                                                                                    style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          fontSize: 18.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  activeColor: FlutterFlowTheme.of(context).alternate,
                                                                                  activeTrackColor: FlutterFlowTheme.of(context).primary,
                                                                                  dense: false,
                                                                                  controlAffinity: ListTileControlAffinity.trailing,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            if (FFAppState().dispatch ==
                                                                                'dispatch')
                                                                              Expanded(
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  child: SwitchListTile.adaptive(
                                                                                    value: _model.switchListTileValue5 ??= false,
                                                                                    onChanged: (newValue) async {
                                                                                      safeSetState(() => _model.switchListTileValue5 = newValue);
                                                                                      if (newValue) {
                                                                                        _model.showDispatchNotes = true;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        _model.showDispatchNotes = false;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    title: Text(
                                                                                      'Dispatch Notes',
                                                                                      style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            fontSize: 18.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    activeColor: FlutterFlowTheme.of(context).alternate,
                                                                                    activeTrackColor: FlutterFlowTheme.of(context).primary,
                                                                                    dense: false,
                                                                                    controlAffinity: ListTileControlAffinity.trailing,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 16.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 24.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                      ))
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.7,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 24.0, 24.0, 24.0),
                                              child: SingleChildScrollView(
                                                primary: false,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Work Order Management',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                          if (FFAppState()
                                                                  .dispatch ==
                                                              'dispatch')
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                if (_model
                                                                    .showAppointment) {
                                                                  _model.showAppointment =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  _model.showAppointment =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                              text:
                                                                  'Add Appointment',
                                                              icon: Icon(
                                                                Icons.add,
                                                                size: 15.0,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 160.0,
                                                                height: 40.0,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (_model
                                                                .showAppointment ==
                                                            false)
                                                          Expanded(
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              child: Visibility(
                                                                visible: FFAppState()
                                                                        .dispatch ==
                                                                    'dispatch',
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Select Date And Time',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Manrope',
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            16.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 260.0,
                                                                                    height: 200.0,
                                                                                    child: custom_widgets.DateTimePicker(
                                                                                      width: 260.0,
                                                                                      height: 200.0,
                                                                                      isStartTime: true,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 260.0,
                                                                                    height: 200.0,
                                                                                    child: custom_widgets.DateTimePicker(
                                                                                      width: 260.0,
                                                                                      height: 200.0,
                                                                                      isStartTime: false,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Select Technician',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Manrope',
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      if (_model
                                                                              .selectTechnician ==
                                                                          true)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              8.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                390.0,
                                                                            height:
                                                                                80.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 50.0,
                                                                                        height: 50.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                          borderRadius: BorderRadius.circular(25.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                          child: ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(25.0),
                                                                                            child: Image.network(
                                                                                              FFAppState().technicianPhoto,
                                                                                              width: 50.0,
                                                                                              height: 50.0,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              _model.technicianName,
                                                                                              'Name',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                          Text(
                                                                                            'Technical Specialist',
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 12.0)),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      if (_model.selectTechnician) {
                                                                                        _model.selectTechnician = false;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        _model.selectTechnician = true;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 12.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (_model
                                                                              .selectTechnician ==
                                                                          false)
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                8.0,
                                                                                8.0,
                                                                                8.0),
                                                                            child:
                                                                                Container(
                                                                              width: 390.0,
                                                                              height: 400.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                child: FutureBuilder<List<UsersRow>>(
                                                                                  future: UsersTable().queryRows(
                                                                                    queryFn: (q) => q.eqOrNull(
                                                                                      'technician',
                                                                                      'technician',
                                                                                    ),
                                                                                  ),
                                                                                  builder: (context, snapshot) {
                                                                                    // Customize what your widget looks like when it's loading.
                                                                                    if (!snapshot.hasData) {
                                                                                      return Center(
                                                                                        child: SizedBox(
                                                                                          width: 50.0,
                                                                                          height: 50.0,
                                                                                          child: CircularProgressIndicator(
                                                                                            valueColor: AlwaysStoppedAnimation<Color>(
                                                                                              FlutterFlowTheme.of(context).primary,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                    List<UsersRow> listViewUsersRowList = snapshot.data!;

                                                                                    return ListView.builder(
                                                                                      padding: EdgeInsets.zero,
                                                                                      shrinkWrap: true,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      itemCount: listViewUsersRowList.length,
                                                                                      itemBuilder: (context, listViewIndex) {
                                                                                        final listViewUsersRow = listViewUsersRowList[listViewIndex];
                                                                                        return Visibility(
                                                                                          visible: _model.selectTechnician == false,
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                FFAppState().technicianPhoto = listViewUsersRow.userPhoto!;
                                                                                                safeSetState(() {});
                                                                                                _model.technicianUuid = listViewUsersRow.userId;
                                                                                                _model.technicianName = listViewUsersRow.fullName!;
                                                                                                _model.technicianColor = valueOrDefault<String>(
                                                                                                  listViewUsersRow.technicianColor,
                                                                                                  '#2797FF',
                                                                                                );
                                                                                                safeSetState(() {});

                                                                                                safeSetState(() {});
                                                                                                if (_model.selectTechnician) {
                                                                                                  _model.selectTechnician = false;
                                                                                                  safeSetState(() {});
                                                                                                } else {
                                                                                                  _model.selectTechnician = true;
                                                                                                  safeSetState(() {});
                                                                                                }
                                                                                              },
                                                                                              child: Container(
                                                                                                width: 390.0,
                                                                                                height: 80.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                  border: Border.all(
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            width: 50.0,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).accent2,
                                                                                                              borderRadius: BorderRadius.circular(25.0),
                                                                                                              border: Border.all(
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                width: 2.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                                              child: ClipRRect(
                                                                                                                borderRadius: BorderRadius.circular(25.0),
                                                                                                                child: Image.network(
                                                                                                                  listViewUsersRow.userPhoto!,
                                                                                                                  width: 50.0,
                                                                                                                  height: 50.0,
                                                                                                                  fit: BoxFit.cover,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                listViewUsersRow.fullName!,
                                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                      fontFamily: 'Manrope',
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                    ),
                                                                                                              ),
                                                                                                              Text(
                                                                                                                valueOrDefault<String>(
                                                                                                                  listViewUsersRow.technician,
                                                                                                                  'Technical Specialist',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                      fontFamily: 'Manrope',
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ].divide(SizedBox(width: 12.0)),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(width: 12.0)),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Select Appliance',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Manrope',
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              64.0,
                                                                              12.0,
                                                                              64.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Flexible(
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(12.0),
                                                                                    child: FlutterFlowChoiceChips(
                                                                                      options: [
                                                                                        ChipData('Refrigerator', Icons.kitchen),
                                                                                        ChipData('Dishwasher', Icons.local_laundry_service),
                                                                                        ChipData('Washer M', Icons.local_laundry_service),
                                                                                        ChipData('Dryer', Icons.local_laundry_service),
                                                                                        ChipData('Range', Icons.microwave_sharp),
                                                                                        ChipData('Cooktop', Icons.microwave_sharp),
                                                                                        ChipData('Wall Oven', Icons.microwave_sharp),
                                                                                        ChipData('Venthood', Icons.microwave),
                                                                                        ChipData('Second Refrigerator', Icons.kitchen),
                                                                                        ChipData('Microwave', Icons.microwave_sharp)
                                                                                      ],
                                                                                      onChanged: (val) => safeSetState(() => _model.applianceValues = val),
                                                                                      selectedChipStyle: ChipStyle(
                                                                                        backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        iconColor: FlutterFlowTheme.of(context).info,
                                                                                        iconSize: 18.0,
                                                                                        labelPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        elevation: 2.0,
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                      ),
                                                                                      unselectedChipStyle: ChipStyle(
                                                                                        backgroundColor: Color(0xFFF0F0F0),
                                                                                        textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        iconColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                        iconSize: 18.0,
                                                                                        labelPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        elevation: 0.0,
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                      ),
                                                                                      chipSpacing: 12.0,
                                                                                      rowSpacing: 8.0,
                                                                                      multiselect: true,
                                                                                      initialized: _model.applianceValues != null,
                                                                                      alignment: WrapAlignment.start,
                                                                                      controller: _model.applianceValueController ??= FormFieldController<List<String>>(
                                                                                        [],
                                                                                      ),
                                                                                      wrapped: true,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 12.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Service Type',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Manrope',
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            16.0),
                                                                        child:
                                                                            FlutterFlowChoiceChips(
                                                                          options: [
                                                                            ChipData('Diagnosis',
                                                                                Icons.search),
                                                                            ChipData('Follow Up',
                                                                                Icons.repeat),
                                                                            ChipData('Recall',
                                                                                Icons.replay),
                                                                            ChipData('Return',
                                                                                Icons.assignment_return_outlined)
                                                                          ],
                                                                          onChanged: (val) =>
                                                                              safeSetState(() => _model.serviceTypeValue = val?.firstOrNull),
                                                                          selectedChipStyle:
                                                                              ChipStyle(
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            iconColor:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            iconSize:
                                                                                18.0,
                                                                            elevation:
                                                                                2.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          unselectedChipStyle:
                                                                              ChipStyle(
                                                                            backgroundColor:
                                                                                Color(0xFFF0F0F0),
                                                                            textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            iconColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            iconSize:
                                                                                18.0,
                                                                            elevation:
                                                                                0.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          chipSpacing:
                                                                              12.0,
                                                                          rowSpacing:
                                                                              8.0,
                                                                          multiselect:
                                                                              false,
                                                                          alignment:
                                                                              WrapAlignment.start,
                                                                          controller: _model.serviceTypeValueController ??=
                                                                              FormFieldController<List<String>>(
                                                                            [],
                                                                          ),
                                                                          wrapped:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                      if (_model
                                                                              .showDiagnosisAppliance ==
                                                                          true)
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                24.0),
                                                                            child:
                                                                                Material(
                                                                              color: Colors.transparent,
                                                                              elevation: 1.0,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                              ),
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (_model
                                                                              .serviceTypeValue ==
                                                                          'Follow Up')
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              16.0,
                                                                              16.0,
                                                                              16.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                'Select the appliance that needs a follow-up service.',
                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      fontSize: 22.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  final appliancesList = workOrderDiagnosesRowList.toList();

                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: List.generate(appliancesList.length, (appliancesListIndex) {
                                                                                      final appliancesListItem = appliancesList[appliancesListIndex];
                                                                                      return Visibility(
                                                                                        visible: appliancesListItem.typeService == null || appliancesListItem.typeService == '',
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 16.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                                        child: Icon(
                                                                                                          Icons.kitchen,
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          size: 40.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            appliancesListItem.item,
                                                                                                            'Appliances',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                fontSize: 20.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  if (appliancesListItem.partToPickUp == 'autorized')
                                                                                                    Icon(
                                                                                                      Icons.check_circle,
                                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                                      size: 40.0,
                                                                                                    ),
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        if (appliancesListItem.partToPickUp == 'Not autorized')
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                                            child: FFButtonWidget(
                                                                                                              onPressed: () async {
                                                                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                                                                      context: context,
                                                                                                                      builder: (alertDialogContext) {
                                                                                                                        return WebViewAware(
                                                                                                                          child: AlertDialog(
                                                                                                                            title: Text('Technician Status Confirmation'),
                                                                                                                            content: Text('Could you please confirm if the technician is a Helper or not?'),
                                                                                                                            actions: [
                                                                                                                              TextButton(
                                                                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                child: Text('Yes, they are a Helper.'),
                                                                                                                              ),
                                                                                                                              TextButton(
                                                                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                child: Text('No, they are not a Helper.'),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      },
                                                                                                                    ) ??
                                                                                                                    false;
                                                                                                                if (confirmDialogResponse) {
                                                                                                                  await DiagnosesTable().update(
                                                                                                                    data: {
                                                                                                                      'part_to_pick_up': 'Autorized',
                                                                                                                    },
                                                                                                                    matchingRows: (rows) => rows.eqOrNull(
                                                                                                                      'diagnosis_id',
                                                                                                                      valueOrDefault<String>(
                                                                                                                        appliancesListItem.diagnosisId,
                                                                                                                        '5215',
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                  _model.queryPartDiagnosis = await PartsTable().queryRows(
                                                                                                                    queryFn: (q) => q.eqOrNull(
                                                                                                                      'diagnosis_id',
                                                                                                                      valueOrDefault<String>(
                                                                                                                        appliancesListItem.diagnosisId,
                                                                                                                        '5415',
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                  _model.pa = await DiagnosesTable().insert({
                                                                                                                    'work_order_id': valueOrDefault<String>(
                                                                                                                      appliancesListItem.workOrderId,
                                                                                                                      '02025',
                                                                                                                    ),
                                                                                                                    'model_number': valueOrDefault<String>(
                                                                                                                      appliancesListItem.modelNumber,
                                                                                                                      'model',
                                                                                                                    ),
                                                                                                                    'item': valueOrDefault<String>(
                                                                                                                      appliancesListItem.item,
                                                                                                                      'Appliance',
                                                                                                                    ),
                                                                                                                    'serial_number': valueOrDefault<String>(
                                                                                                                      appliancesListItem.serialNumber,
                                                                                                                      'itens',
                                                                                                                    ),
                                                                                                                    'brand': valueOrDefault<String>(
                                                                                                                      appliancesListItem.brand,
                                                                                                                      'itens',
                                                                                                                    ),
                                                                                                                    'part_to_pick_up': 'autorized',
                                                                                                                    'type_service': 'Follow Up',
                                                                                                                    'created_at': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                                                                    'part_pick_up_list': _model.queryPartDiagnosis
                                                                                                                        ?.map((e) => valueOrDefault<String>(
                                                                                                                              e.partNumber,
                                                                                                                              'Part Number',
                                                                                                                            ))
                                                                                                                        .toList(),
                                                                                                                  });
                                                                                                                  _model.partToPickUp = 'Autorized';
                                                                                                                  safeSetState(() {});
                                                                                                                } else {
                                                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                    SnackBar(
                                                                                                                      content: Text(
                                                                                                                        'Please note that follow-up cannot be set for a Helper. ',
                                                                                                                        style: TextStyle(
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      duration: Duration(milliseconds: 4000),
                                                                                                                      backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                                                    ),
                                                                                                                  );
                                                                                                                }

                                                                                                                safeSetState(() {});
                                                                                                              },
                                                                                                              text: 'Set Follow Up',
                                                                                                              options: FFButtonOptions(
                                                                                                                height: 40.0,
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                      fontFamily: 'Manrope',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                                elevation: 0.0,
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                      ].divide(SizedBox(width: 16.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ].divide(SizedBox(height: 16.0)),
                                                                          ),
                                                                        ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              24.0,
                                                                              12.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(44.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          'Helper?',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Manrope',
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 1.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsets.all(8.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: (_model.helperTrue == false)
                                                                                                  ? null
                                                                                                  : () async {
                                                                                                      _model.helperTrue = false;
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                              text: 'No',
                                                                                              options: FFButtonOptions(
                                                                                                width: 60.0,
                                                                                                height: 48.0,
                                                                                                padding: EdgeInsets.all(0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      color: Colors.white,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                elevation: 0.0,
                                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                                                disabledColor: FlutterFlowTheme.of(context).secondary,
                                                                                                disabledTextColor: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsets.all(8.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: (_model.helperTrue == true)
                                                                                                  ? null
                                                                                                  : () async {
                                                                                                      _model.helperTrue = true;
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                              text: 'Yes',
                                                                                              options: FFButtonOptions(
                                                                                                width: 60.0,
                                                                                                height: 48.0,
                                                                                                padding: EdgeInsets.all(0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      color: Colors.white,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                elevation: 0.0,
                                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                                                disabledColor: FlutterFlowTheme.of(context).secondary,
                                                                                                disabledTextColor: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 0.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: (_model.selectTechnician == false)
                                                                                      ? null
                                                                                      : () async {
                                                                                          if (_model.helperTrue == true) {
                                                                                            _model.scheuduleId1 = await SchedulesTable().insert({
                                                                                              'work_order_id': valueOrDefault<String>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.workOrderId,
                                                                                                '00300',
                                                                                              ),
                                                                                              'technicians_uuid': valueOrDefault<String>(
                                                                                                _model.technicianUuid,
                                                                                                '12434',
                                                                                              ),
                                                                                              'technicians_name': _model.technicianName,
                                                                                              'start_time': supaSerialize<DateTime>(FFAppState().startTime),
                                                                                              'end_time': supaSerialize<DateTime>(FFAppState().endTime),
                                                                                              'helper': _model.helperTrue,
                                                                                              'customer_address': valueOrDefault<String>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.address,
                                                                                                '00300',
                                                                                              ),
                                                                                              'customer_phone': valueOrDefault<String>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.customerPhone,
                                                                                                '00300',
                                                                                              ),
                                                                                              'itens': _model.applianceValues,
                                                                                              'appointment_type': 'Helper ',
                                                                                              'technicians_photo': FFAppState().technicianPhoto,
                                                                                              'appointment_status': 'Not Confirmed',
                                                                                              'customer_name': valueOrDefault<String>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.customerName,
                                                                                                '00300',
                                                                                              ),
                                                                                              'technician_color': _model.technicianColor,
                                                                                              'appointment_date': supaSerialize<DateTime>(FFAppState().startTime),
                                                                                            });
                                                                                            await AppointmentsTable().insert({
                                                                                              'technician_id': valueOrDefault<String>(
                                                                                                _model.technicianUuid,
                                                                                                '4343',
                                                                                              ),
                                                                                              'work_order_id': valueOrDefault<String>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.workOrderId,
                                                                                                '00300',
                                                                                              ),
                                                                                              'title': valueOrDefault<String>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.workOrderId,
                                                                                                '00300',
                                                                                              ),
                                                                                              'address': valueOrDefault<String>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.address,
                                                                                                '00300',
                                                                                              ),
                                                                                              'lat': valueOrDefault<double>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.lat,
                                                                                                00300.0,
                                                                                              ),
                                                                                              'lng': valueOrDefault<double>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.lng,
                                                                                                00300.0,
                                                                                              ),
                                                                                              'scheduled_start': supaSerialize<DateTime>(FFAppState().startTime),
                                                                                              'scheduled_end': supaSerialize<DateTime>(FFAppState().endTime),
                                                                                              'status': valueOrDefault<String>(
                                                                                                _model.serviceTypeValue,
                                                                                                'Diagnosis',
                                                                                              ),
                                                                                              'items_count': valueOrDefault<int>(
                                                                                                _model.appointmeAppliancesList.length,
                                                                                                0,
                                                                                              ),
                                                                                              'technician_name': _model.technicianName,
                                                                                              'technician_color': _model.technicianColor,
                                                                                              'stop_number': 0,
                                                                                              'technician_photo': 'https://api.wmappliances.cloud/storage/v1/object/public/photos/users/wmlogoSupabase.png',
                                                                                              'client_name': valueOrDefault<String>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.customerName,
                                                                                                '00300',
                                                                                              ),
                                                                                              'items': _model.workOrderQueryOnPage?.firstOrNull?.items,
                                                                                              'appointment_date': supaSerialize<DateTime>(FFAppState().startTime),
                                                                                              'schedule_id': valueOrDefault<String>(
                                                                                                _model.scheuduleId1?.scheduleId,
                                                                                                '4342',
                                                                                              ),
                                                                                              'apt': _model.workOrderQueryOnPage?.firstOrNull?.apartmentNumber,
                                                                                              'appointment_status': 'Not Started',
                                                                                              'client_phone': valueOrDefault<String>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.customerPhone,
                                                                                                '00300',
                                                                                              ),
                                                                                              'manager_review': false,
                                                                                              'helper': _model.helperTrue,
                                                                                              'items_view': _model.workOrderQueryOnPage?.firstOrNull?.items,
                                                                                            });
                                                                                            unawaited(
                                                                                              () async {
                                                                                                await TechniciansSchedulesTable().insert({
                                                                                                  'technician_uuid': _model.technicianUuid,
                                                                                                  'appointment_date': supaSerialize<DateTime>(FFAppState().startTime),
                                                                                                  'technician_color': valueOrDefault<String>(
                                                                                                    _model.technicianColor,
                                                                                                    '#143433',
                                                                                                  ),
                                                                                                  'technicians_name': _model.technicianName,
                                                                                                  'technicians_photo': FFAppState().technicianPhoto,
                                                                                                });
                                                                                              }(),
                                                                                            );
                                                                                            _model.appointmeAppliancesList = _model.applianceValues!.toList().cast<String>();
                                                                                            safeSetState(() {});
                                                                                            if (_model.showAppointment) {
                                                                                              _model.showAppointment = false;
                                                                                              safeSetState(() {});
                                                                                            } else {
                                                                                              _model.showAppointment = true;
                                                                                              safeSetState(() {});
                                                                                            }
                                                                                          } else {
                                                                                            await WorkOrdersTable().update(
                                                                                              data: {
                                                                                                'scheduled_date': supaSerialize<DateTime>(FFAppState().startTime),
                                                                                                'start_time': supaSerialize<PostgresTime>(PostgresTime(FFAppState().startTime)),
                                                                                                'end_time': supaSerialize<PostgresTime>(PostgresTime(FFAppState().endTime)),
                                                                                                'technician': _model.technicianName,
                                                                                              },
                                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                                'work_order_id',
                                                                                                valueOrDefault<String>(
                                                                                                  _model.workOrderQueryOnPage?.firstOrNull?.workOrderId,
                                                                                                  '00300',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                            _model.scheduleID = await SchedulesTable().insert({
                                                                                              'work_order_id': valueOrDefault<String>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.workOrderId,
                                                                                                '00300',
                                                                                              ),
                                                                                              'technicians_uuid': _model.technicianUuid,
                                                                                              'technicians_name': _model.technicianName,
                                                                                              'start_time': supaSerialize<DateTime>(FFAppState().startTime),
                                                                                              'end_time': supaSerialize<DateTime>(FFAppState().endTime),
                                                                                              'helper': _model.helperTrue,
                                                                                              'customer_address': valueOrDefault<String>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.address,
                                                                                                '00300',
                                                                                              ),
                                                                                              'customer_phone': valueOrDefault<String>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.customerPhone,
                                                                                                '00300',
                                                                                              ),
                                                                                              'itens': _model.applianceValues,
                                                                                              'appointment_type': _model.serviceTypeValue,
                                                                                              'technicians_photo': FFAppState().technicianPhoto,
                                                                                              'appointment_status': 'Not Confirmed',
                                                                                              'customer_name': valueOrDefault<String>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.customerName,
                                                                                                '00300',
                                                                                              ),
                                                                                              'appointment_date': supaSerialize<DateTime>(FFAppState().startTime),
                                                                                              'technician_color': _model.technicianColor,
                                                                                            });
                                                                                            await AppointmentsTable().insert({
                                                                                              'technician_id': valueOrDefault<String>(
                                                                                                _model.technicianUuid,
                                                                                                '4343',
                                                                                              ),
                                                                                              'work_order_id': valueOrDefault<String>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.workOrderId,
                                                                                                '00300',
                                                                                              ),
                                                                                              'title': valueOrDefault<String>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.workOrderId,
                                                                                                '00300',
                                                                                              ),
                                                                                              'address': valueOrDefault<String>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.address,
                                                                                                '00300',
                                                                                              ),
                                                                                              'lat': valueOrDefault<double>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.lat,
                                                                                                00300.0,
                                                                                              ),
                                                                                              'lng': valueOrDefault<double>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.lng,
                                                                                                00300.0,
                                                                                              ),
                                                                                              'scheduled_start': supaSerialize<DateTime>(FFAppState().startTime),
                                                                                              'scheduled_end': supaSerialize<DateTime>(FFAppState().endTime),
                                                                                              'status': valueOrDefault<String>(
                                                                                                _model.serviceTypeValue,
                                                                                                'Diagnosis',
                                                                                              ),
                                                                                              'items_count': valueOrDefault<int>(
                                                                                                _model.appointmeAppliancesList.length,
                                                                                                0,
                                                                                              ),
                                                                                              'technician_name': _model.technicianName,
                                                                                              'technician_color': _model.technicianColor,
                                                                                              'stop_number': 0,
                                                                                              'technician_photo': 'https://api.wmappliances.cloud/storage/v1/object/public/photos/users/wmlogoSupabase.png',
                                                                                              'client_name': valueOrDefault<String>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.customerName,
                                                                                                '00300',
                                                                                              ),
                                                                                              'items': _model.workOrderQueryOnPage?.firstOrNull?.items,
                                                                                              'appointment_date': supaSerialize<DateTime>(FFAppState().startTime),
                                                                                              'schedule_id': valueOrDefault<String>(
                                                                                                _model.scheduleID?.scheduleId,
                                                                                                '13412',
                                                                                              ),
                                                                                              'apt': _model.workOrderQueryOnPage?.firstOrNull?.apartmentNumber,
                                                                                              'appointment_status': 'Not Started',
                                                                                              'client_phone': valueOrDefault<String>(
                                                                                                _model.workOrderQueryOnPage?.firstOrNull?.customerPhone,
                                                                                                '00300',
                                                                                              ),
                                                                                              'manager_review': false,
                                                                                              'helper': _model.helperTrue,
                                                                                              'items_view': _model.workOrderQueryOnPage?.firstOrNull?.items,
                                                                                            });
                                                                                            unawaited(
                                                                                              () async {
                                                                                                await TechniciansSchedulesTable().insert({
                                                                                                  'technician_uuid': _model.technicianUuid,
                                                                                                  'appointment_date': supaSerialize<DateTime>(FFAppState().startTime),
                                                                                                  'technician_color': valueOrDefault<String>(
                                                                                                    _model.technicianColor,
                                                                                                    '#143433',
                                                                                                  ),
                                                                                                  'technicians_name': _model.technicianName,
                                                                                                  'technicians_photo': FFAppState().technicianPhoto,
                                                                                                });
                                                                                              }(),
                                                                                            );
                                                                                            _model.appointmeAppliancesList = _model.applianceValues!.toList().cast<String>();
                                                                                            safeSetState(() {});
                                                                                            if (_model.showAppointment) {
                                                                                              _model.showAppointment = false;
                                                                                              safeSetState(() {});
                                                                                            } else {
                                                                                              _model.showAppointment = true;
                                                                                              safeSetState(() {});
                                                                                            }

                                                                                            await Future.delayed(const Duration(milliseconds: 10000));
                                                                                            await DiagnosesTable().update(
                                                                                              data: {
                                                                                                'created_at': supaSerialize<DateTime>(FFAppState().startTime),
                                                                                              },
                                                                                              matchingRows: (rows) => rows
                                                                                                  .eqOrNull(
                                                                                                    'work_order_id',
                                                                                                    valueOrDefault<String>(
                                                                                                      _model.workOrderQueryOnPage?.firstOrNull?.workOrderId,
                                                                                                      '00300',
                                                                                                    ),
                                                                                                  )
                                                                                                  .eqOrNull(
                                                                                                    'type_service',
                                                                                                    'Follow Up',
                                                                                                  ),
                                                                                            );
                                                                                          }

                                                                                          _model.selectTechnician = false;
                                                                                          safeSetState(() {});

                                                                                          safeSetState(() {});
                                                                                        },
                                                                                  text: 'Submit Appointment',
                                                                                  options: FFButtonOptions(
                                                                                    height: 48.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          color: Colors.white,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    elevation: 0.0,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    disabledColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                    disabledTextColor: FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 0.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    if (_model.showAppointment) {
                                                                                      _model.showAppointment = false;
                                                                                      safeSetState(() {});
                                                                                    } else {
                                                                                      _model.showAppointment = true;
                                                                                      safeSetState(() {});
                                                                                    }
                                                                                  },
                                                                                  text: 'Cancel',
                                                                                  options: FFButtonOptions(
                                                                                    height: 48.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          color: Colors.white,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    elevation: 0.0,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 16.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                      ].divide(SizedBox(
                                                          width: 24.0)),
                                                    ),
                                                    if (_model.showSchedule ==
                                                        true)
                                                      Expanded(
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 1.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          16.0,
                                                                          16.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                primary: false,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'Appointments',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Manrope',
                                                                            fontSize:
                                                                                22.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8.0),
                                                                        child: FutureBuilder<
                                                                            List<SchedulesRow>>(
                                                                          future:
                                                                              SchedulesTable().queryRows(
                                                                            queryFn: (q) => q
                                                                                .eqOrNull(
                                                                                  'work_order_id',
                                                                                  widget.workOrderId,
                                                                                )
                                                                                .order('start_time'),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  child: CircularProgressIndicator(
                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<SchedulesRow>
                                                                                listViewSchedulesRowList =
                                                                                snapshot.data!;

                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: listViewSchedulesRowList.length,
                                                                              itemBuilder: (context, listViewIndex) {
                                                                                final listViewSchedulesRow = listViewSchedulesRowList[listViewIndex];
                                                                                return Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: Colors.transparent,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            blurRadius: 4.0,
                                                                                            color: Color(0x1A000000),
                                                                                            offset: Offset(
                                                                                              0.0,
                                                                                              2.0,
                                                                                            ),
                                                                                            spreadRadius: 0.0,
                                                                                          )
                                                                                        ],
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: 60.0,
                                                                                                    height: 60.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      gradient: LinearGradient(
                                                                                                        colors: [
                                                                                                          Color(0x334B39EF),
                                                                                                          FlutterFlowTheme.of(context).primary
                                                                                                        ],
                                                                                                        stops: [0.0, 1.0],
                                                                                                        begin: AlignmentDirectional(0.0, -1.0),
                                                                                                        end: AlignmentDirectional(0, 1.0),
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(30.0),
                                                                                                    ),
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        shape: BoxShape.circle,
                                                                                                        border: Border.all(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(30.0),
                                                                                                        child: Image.network(
                                                                                                          listViewSchedulesRow.techniciansPhoto!,
                                                                                                          width: 60.0,
                                                                                                          height: 61.4,
                                                                                                          fit: BoxFit.cover,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                                  child: Container(
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsets.all(12.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                        children: [
                                                                                                                          Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                            children: [
                                                                                                                              Text(
                                                                                                                                'Date',
                                                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                      fontFamily: 'Manrope',
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                              Text(
                                                                                                                                valueOrDefault<String>(
                                                                                                                                  dateTimeFormat("MMMEd", listViewSchedulesRow.startTime),
                                                                                                                                  '2025-02-11 20:00:00',
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'Manrope',
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                          Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                            children: [
                                                                                                                              Text(
                                                                                                                                'Start Time',
                                                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                      fontFamily: 'Manrope',
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                              Text(
                                                                                                                                valueOrDefault<String>(
                                                                                                                                  dateTimeFormat("jm", listViewSchedulesRow.startTime),
                                                                                                                                  '2025-02-11 20:00:00',
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'Manrope',
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                          Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                            children: [
                                                                                                                              Text(
                                                                                                                                'End Time',
                                                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                      fontFamily: 'Manrope',
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                              Text(
                                                                                                                                valueOrDefault<String>(
                                                                                                                                  dateTimeFormat("jm", listViewSchedulesRow.endTime),
                                                                                                                                  '2025-02-11 20:00:00',
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'Manrope',
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ].divide(SizedBox(width: 16.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              if (listViewSchedulesRow.helper == true)
                                                                                                                Align(
                                                                                                                  alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 8.0),
                                                                                                                    child: Container(
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                                        borderRadius: BorderRadius.circular(16.0),
                                                                                                                      ),
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsets.all(4.0),
                                                                                                                        child: Icon(
                                                                                                                          Icons.hail,
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                          size: 30.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 8.0),
                                                                                                                  child: Container(
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).accent1,
                                                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsets.all(8.0),
                                                                                                                      child: Text(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          listViewSchedulesRow.appointmentStatus,
                                                                                                                          'Not Confirmed',
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                              fontFamily: 'Manrope',
                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                              letterSpacing: 0.0,
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
                                                                                                ].divide(SizedBox(width: 16.0)),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                    child: Builder(
                                                                                                      builder: (context) {
                                                                                                        final appliancelist = listViewSchedulesRow.itens.toList();

                                                                                                        return SingleChildScrollView(
                                                                                                          scrollDirection: Axis.horizontal,
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: List.generate(appliancelist.length, (appliancelistIndex) {
                                                                                                              final appliancelistItem = appliancelist[appliancelistIndex];
                                                                                                              return Expanded(
                                                                                                                child: SingleChildScrollView(
                                                                                                                  scrollDirection: Axis.horizontal,
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsets.all(4.0),
                                                                                                                        child: Text(
                                                                                                                          ' (  ${valueOrDefault<String>(
                                                                                                                            appliancelistItem,
                                                                                                                            'Appliances',
                                                                                                                          )}  )    ',
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ].divide(SizedBox(width: 4.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            }).divide(SizedBox(width: 8.0)),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 12.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          16.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (_model.showNotes ==
                                                        true)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    24.0),
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 1.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          16.0,
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Notes',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          fontSize:
                                                                              22.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .textController1,
                                                                    focusNode:
                                                                        _model
                                                                            .textFieldFocusNode,
                                                                    autofocus:
                                                                        false,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintText:
                                                                          'Add a note...',
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Manrope',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      suffixIcon:
                                                                          Icon(
                                                                        Icons
                                                                            .send,
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    maxLines: 6,
                                                                    minLines: 3,
                                                                    validator: _model
                                                                        .textController1Validator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'Priority Note',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Switch.adaptive(
                                                                                value: _model.switchValue5!,
                                                                                onChanged: (newValue) async {
                                                                                  safeSetState(() => _model.switchValue5 = newValue);
                                                                                  if (newValue) {
                                                                                    _model.priorityNote = true;
                                                                                  } else {
                                                                                    _model.priorityNote = false;
                                                                                  }
                                                                                },
                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                activeTrackColor: FlutterFlowTheme.of(context).primary,
                                                                                inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                                                                                inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed: (_model.textController1.text == '')
                                                                              ? null
                                                                              : () async {
                                                                                  await NotesTable().insert({
                                                                                    'work_order_id': valueOrDefault<String>(
                                                                                      _model.workOrderQueryOnPage?.firstOrNull?.workOrderId,
                                                                                      '00300',
                                                                                    ),
                                                                                    'note_content': '${_model.textController1.text}',
                                                                                    'user_name': FFAppState().userName,
                                                                                    'create_by_image': valueOrDefault<String>(
                                                                                      FFAppState().userPhoto,
                                                                                      'photo',
                                                                                    ),
                                                                                    'priority': _model.priorityNote,
                                                                                    'dispatch_note': _model.dispatchNote,
                                                                                  });
                                                                                  safeSetState(() {
                                                                                    _model.textController1?.clear();
                                                                                  });

                                                                                  safeSetState(() {});
                                                                                },
                                                                          text:
                                                                              'Save',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                40.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  color: Colors.white,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            disabledColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            disabledTextColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            24.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: FutureBuilder<
                                                                        List<
                                                                            NotesRow>>(
                                                                      future: NotesTable()
                                                                          .queryRows(
                                                                        queryFn: (q) => q
                                                                            .eqOrNull(
                                                                              'work_order_id',
                                                                              widget.workOrderId,
                                                                            )
                                                                            .order('priority')
                                                                            .order('created_at'),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: CircularProgressIndicator(
                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<NotesRow>
                                                                            listViewNotesRowList =
                                                                            snapshot.data!;

                                                                        return ListView
                                                                            .builder(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          primary:
                                                                              false,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              listViewNotesRowList.length,
                                                                          itemBuilder:
                                                                              (context, listViewIndex) {
                                                                            final listViewNotesRow =
                                                                                listViewNotesRowList[listViewIndex];
                                                                            return Stack(
                                                                              children: [
                                                                                if (listViewNotesRow.priority == false)
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                                                                                                    child: Container(
                                                                                                      width: 60.0,
                                                                                                      height: 60.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        gradient: LinearGradient(
                                                                                                          colors: [
                                                                                                            Color(0x334B39EF),
                                                                                                            FlutterFlowTheme.of(context).primary
                                                                                                          ],
                                                                                                          stops: [0.0, 1.0],
                                                                                                          begin: AlignmentDirectional(0.0, -1.0),
                                                                                                          end: AlignmentDirectional(0, 1.0),
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(30.0),
                                                                                                      ),
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(30.0),
                                                                                                        child: Image.network(
                                                                                                          valueOrDefault<String>(
                                                                                                            listViewNotesRow.createByImage,
                                                                                                            'photo',
                                                                                                          ),
                                                                                                          width: 60.0,
                                                                                                          height: 61.4,
                                                                                                          fit: BoxFit.cover,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          child: Align(
                                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsets.all(12.0),
                                                                                                              child: MarkdownBody(
                                                                                                                data: listViewNotesRow.noteContent,
                                                                                                                selectable: true,
                                                                                                                onTapLink: (_, url, __) => launchURL(url!),
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
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                              child: Text(
                                                                                                dateTimeFormat("relative", listViewNotesRow.createdAt!),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (listViewNotesRow.priority == true)
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                      child: Material(
                                                                                        color: Colors.transparent,
                                                                                        elevation: 2.0,
                                                                                        shape: RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                        ),
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                            ),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Flexible(
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                                                                                                        child: Container(
                                                                                                          width: 60.0,
                                                                                                          height: 60.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            gradient: LinearGradient(
                                                                                                              colors: [
                                                                                                                Color(0x334B39EF),
                                                                                                                FlutterFlowTheme.of(context).primary
                                                                                                              ],
                                                                                                              stops: [0.0, 1.0],
                                                                                                              begin: AlignmentDirectional(0.0, -1.0),
                                                                                                              end: AlignmentDirectional(0, 1.0),
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(30.0),
                                                                                                          ),
                                                                                                          child: ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(30.0),
                                                                                                            child: Image.network(
                                                                                                              valueOrDefault<String>(
                                                                                                                listViewNotesRow.createByImage,
                                                                                                                'photo',
                                                                                                              ),
                                                                                                              width: 60.0,
                                                                                                              height: 61.4,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Expanded(
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              child: Align(
                                                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsets.all(12.0),
                                                                                                                  child: MarkdownBody(
                                                                                                                    data: listViewNotesRow.noteContent,
                                                                                                                    selectable: true,
                                                                                                                    onTapLink: (_, url, __) => launchURL(url!),
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
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                  child: Text(
                                                                                                    dateTimeFormat("relative", listViewNotesRow.createdAt!),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Manrope',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Flexible(
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 8.0),
                                                                                                  child: Container(
                                                                                                    width: 60.0,
                                                                                                    height: 60.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      gradient: LinearGradient(
                                                                                                        colors: [
                                                                                                          Color(0x334B39EF),
                                                                                                          FlutterFlowTheme.of(context).primary
                                                                                                        ],
                                                                                                        stops: [0.0, 1.0],
                                                                                                        begin: AlignmentDirectional(0.0, -1.0),
                                                                                                        end: AlignmentDirectional(0, 1.0),
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(30.0),
                                                                                                    ),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(30.0),
                                                                                                      child: Image.network(
                                                                                                        valueOrDefault<String>(
                                                                                                          listViewNotesRow.createByImage,
                                                                                                          'photo',
                                                                                                        ),
                                                                                                        width: 60.0,
                                                                                                        height: 61.4,
                                                                                                        fit: BoxFit.cover,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsets.all(12.0),
                                                                                                            child: MarkdownBody(
                                                                                                              data: listViewNotesRow.noteContent,
                                                                                                              selectable: true,
                                                                                                              onTapLink: (_, url, __) => launchURL(url!),
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
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                            child: Text(
                                                                                              dateTimeFormat("relative", listViewNotesRow.createdAt!),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        16.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (_model
                                                            .showDispatchNotes ==
                                                        true)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    24.0),
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 1.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                width: 10.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          16.0,
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Dispatch Notes',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          fontSize:
                                                                              22.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .addNoteDispatchTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .addNoteDispatchFocusNode,
                                                                    autofocus:
                                                                        false,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintText:
                                                                          'Add a note...',
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Manrope',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      suffixIcon:
                                                                          Icon(
                                                                        Icons
                                                                            .send,
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    maxLines: 6,
                                                                    minLines: 3,
                                                                    validator: _model
                                                                        .addNoteDispatchTextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'Priority Note',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Switch.adaptive(
                                                                                value: _model.switchValue6!,
                                                                                onChanged: (newValue) async {
                                                                                  safeSetState(() => _model.switchValue6 = newValue);
                                                                                  if (newValue) {
                                                                                    _model.priorityNote = true;
                                                                                  } else {
                                                                                    _model.priorityNote = false;
                                                                                  }
                                                                                },
                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                activeTrackColor: FlutterFlowTheme.of(context).primary,
                                                                                inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                                                                                inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed: (_model.addNoteDispatchTextController.text == '')
                                                                              ? null
                                                                              : () async {
                                                                                  _model.disptchnotes = await NotesDispatchTable().insert({
                                                                                    'work_order_id': widget.workOrderId,
                                                                                    'note_content': '${_model.addNoteDispatchTextController.text}',
                                                                                    'user_name': FFAppState().userName,
                                                                                    'create_by_image': valueOrDefault<String>(
                                                                                      FFAppState().userPhoto,
                                                                                      'photo',
                                                                                    ),
                                                                                    'priority': _model.priorityNote,
                                                                                  });
                                                                                  safeSetState(() {
                                                                                    _model.addNoteDispatchTextController?.clear();
                                                                                  });

                                                                                  safeSetState(() {});

                                                                                  safeSetState(() {});
                                                                                },
                                                                          text:
                                                                              'Save',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                40.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  color: Colors.white,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            disabledColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            disabledTextColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            24.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: FutureBuilder<
                                                                        List<
                                                                            NotesDispatchRow>>(
                                                                      future: NotesDispatchTable()
                                                                          .queryRows(
                                                                        queryFn: (q) => q
                                                                            .eqOrNull(
                                                                              'work_order_id',
                                                                              widget.workOrderId,
                                                                            )
                                                                            .order('priority')
                                                                            .order('created_at'),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: CircularProgressIndicator(
                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<NotesDispatchRow>
                                                                            listViewNotesDispatchRowList =
                                                                            snapshot.data!;

                                                                        return ListView
                                                                            .builder(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          primary:
                                                                              false,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              listViewNotesDispatchRowList.length,
                                                                          itemBuilder:
                                                                              (context, listViewIndex) {
                                                                            final listViewNotesDispatchRow =
                                                                                listViewNotesDispatchRowList[listViewIndex];
                                                                            return Stack(
                                                                              children: [
                                                                                if (listViewNotesDispatchRow.priority == false)
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                                                                                                    child: Container(
                                                                                                      width: 60.0,
                                                                                                      height: 60.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        gradient: LinearGradient(
                                                                                                          colors: [
                                                                                                            Color(0x334B39EF),
                                                                                                            FlutterFlowTheme.of(context).primary
                                                                                                          ],
                                                                                                          stops: [0.0, 1.0],
                                                                                                          begin: AlignmentDirectional(0.0, -1.0),
                                                                                                          end: AlignmentDirectional(0, 1.0),
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(30.0),
                                                                                                      ),
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(30.0),
                                                                                                        child: Image.network(
                                                                                                          valueOrDefault<String>(
                                                                                                            listViewNotesDispatchRow.createByImage,
                                                                                                            'photo',
                                                                                                          ),
                                                                                                          width: 60.0,
                                                                                                          height: 61.4,
                                                                                                          fit: BoxFit.cover,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          child: Align(
                                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsets.all(12.0),
                                                                                                              child: MarkdownBody(
                                                                                                                data: listViewNotesDispatchRow.noteContent,
                                                                                                                selectable: true,
                                                                                                                onTapLink: (_, url, __) => launchURL(url!),
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
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                              child: Text(
                                                                                                dateTimeFormat("relative", listViewNotesDispatchRow.createdAt!),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (listViewNotesDispatchRow.priority == true)
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                      child: Material(
                                                                                        color: Colors.transparent,
                                                                                        elevation: 2.0,
                                                                                        shape: RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                        ),
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                            ),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Flexible(
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                                                                                                        child: Container(
                                                                                                          width: 60.0,
                                                                                                          height: 60.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            gradient: LinearGradient(
                                                                                                              colors: [
                                                                                                                Color(0x334B39EF),
                                                                                                                FlutterFlowTheme.of(context).primary
                                                                                                              ],
                                                                                                              stops: [0.0, 1.0],
                                                                                                              begin: AlignmentDirectional(0.0, -1.0),
                                                                                                              end: AlignmentDirectional(0, 1.0),
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(30.0),
                                                                                                          ),
                                                                                                          child: ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(30.0),
                                                                                                            child: Image.network(
                                                                                                              valueOrDefault<String>(
                                                                                                                listViewNotesDispatchRow.createByImage,
                                                                                                                'photo',
                                                                                                              ),
                                                                                                              width: 60.0,
                                                                                                              height: 61.4,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Expanded(
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              child: Align(
                                                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsets.all(12.0),
                                                                                                                  child: MarkdownBody(
                                                                                                                    data: listViewNotesDispatchRow.noteContent,
                                                                                                                    selectable: true,
                                                                                                                    onTapLink: (_, url, __) => launchURL(url!),
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
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                  child: Text(
                                                                                                    dateTimeFormat("relative", listViewNotesDispatchRow.createdAt!),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Manrope',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        16.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (_model
                                                            .showDiagnosisAppliance ==
                                                        true)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      24.0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 1.0,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.5,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        16.0,
                                                                        16.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'Appliances',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Manrope',
                                                                            fontSize:
                                                                                22.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final appliancesList =
                                                                            workOrderDiagnosesRowList.toList();

                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: List.generate(
                                                                              appliancesList.length,
                                                                              (appliancesListIndex) {
                                                                            final appliancesListItem =
                                                                                appliancesList[appliancesListIndex];
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 16.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
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
                                                                                                          child: AddPartBottonSheetWidget(
                                                                                                            partFromDiagnosisParameter: appliancesListItem,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ).then((value) => safeSetState(() {}));

                                                                                                FFAppState().openFab = false;
                                                                                                safeSetState(() {});
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.kitchen,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                size: 40.0,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                appliancesListItem.item,
                                                                                                'Appliances',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    fontSize: 20.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(1.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            FlutterFlowIconButton(
                                                                                              borderRadius: 8.0,
                                                                                              buttonSize: 40.0,
                                                                                              fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                              icon: Icon(
                                                                                                Icons.receipt_long_outlined,
                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              onPressed: () async {
                                                                                                await showModalBottomSheet(
                                                                                                  isScrollControlled: true,
                                                                                                  backgroundColor: Colors.transparent,
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
                                                                                                              diagnosisParameterWorkId: appliancesListItem,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ).then((value) => safeSetState(() {}));
                                                                                              },
                                                                                            ),
                                                                                            if (FFAppState().dispatch == 'dispatch')
                                                                                              FlutterFlowIconButton(
                                                                                                borderRadius: 8.0,
                                                                                                buttonSize: 40.0,
                                                                                                fillColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                disabledColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                disabledIconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                icon: Icon(
                                                                                                  Icons.done_outline,
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                onPressed: (appliancesListItem.completed == true)
                                                                                                    ? null
                                                                                                    : () async {
                                                                                                        await DiagnosesTable().update(
                                                                                                          data: {
                                                                                                            'completed': true,
                                                                                                          },
                                                                                                          matchingRows: (rows) => rows.eqOrNull(
                                                                                                            'diagnosis_id',
                                                                                                            valueOrDefault<String>(
                                                                                                              appliancesListItem.diagnosisId,
                                                                                                              '0',
                                                                                                            ),
                                                                                                          ),
                                                                                                        );

                                                                                                        safeSetState(() {});
                                                                                                      },
                                                                                              ),
                                                                                            if (appliancesListItem.helper == true)
                                                                                              FlutterFlowIconButton(
                                                                                                borderRadius: 8.0,
                                                                                                buttonSize: 40.0,
                                                                                                fillColor: FlutterFlowTheme.of(context).primary,
                                                                                                icon: Icon(
                                                                                                  Icons.hail,
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                onPressed: () {
                                                                                                  print('Arrived pressed ...');
                                                                                                },
                                                                                              ),
                                                                                          ].divide(SizedBox(width: 16.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 8.0)),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          16.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (_model
                                                            .showPartRequested ==
                                                        true)
                                                      Flexible(
                                                        child: FutureBuilder<
                                                            List<PartsRow>>(
                                                          future: PartsTable()
                                                              .queryRows(
                                                            queryFn: (q) =>
                                                                q.eqOrNull(
                                                              'work_order_id',
                                                              widget
                                                                  .workOrderId,
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<PartsRow>
                                                                containerPartsRowList =
                                                                snapshot.data!;

                                                            return Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 1.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.5,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.7,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          16.0,
                                                                          16.0),
                                                                  child: FutureBuilder<
                                                                      List<
                                                                          PartSummaryAggregatedRow>>(
                                                                    future: PartSummaryAggregatedTable()
                                                                        .querySingleRow(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eqOrNull(
                                                                        'work_order_id',
                                                                        widget
                                                                            .workOrderId,
                                                                      ),
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<PartSummaryAggregatedRow>
                                                                          columnPartSummaryAggregatedRowList =
                                                                          snapshot
                                                                              .data!;

                                                                      final columnPartSummaryAggregatedRow = columnPartSummaryAggregatedRowList
                                                                              .isNotEmpty
                                                                          ? columnPartSummaryAggregatedRowList
                                                                              .first
                                                                          : null;

                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            'Requested Parts',
                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  fontSize: 22.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final requestedPart = containerPartsRowList.toList();

                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(requestedPart.length, (requestedPartIndex) {
                                                                                  final requestedPartItem = requestedPart[requestedPartIndex];
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                        borderRadius: BorderRadius.circular(20.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 16.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    '${valueOrDefault<String>(
                                                                                                      requestedPartItem.iten,
                                                                                                      ' Appliance',
                                                                                                    )} - ${requestedPartItem.partNumber}'
                                                                                                        .maybeHandleOverflow(
                                                                                                      maxChars: 50,
                                                                                                      replacement: '…',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Manrope',
                                                                                                          fontSize: 18.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(1.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Container(
                                                                                                      width: 40.0,
                                                                                                      height: 40.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).accent2,
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                        border: Border.all(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            requestedPartItem.quantity?.toString(),
                                                                                                            '0',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 22.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  if (FFAppState().dispatch == 'dispatch')
                                                                                                    FlutterFlowIconButton(
                                                                                                      borderRadius: 8.0,
                                                                                                      buttonSize: 40.0,
                                                                                                      fillColor: FlutterFlowTheme.of(context).warning,
                                                                                                      disabledColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      disabledIconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                      icon: Icon(
                                                                                                        Icons.reset_tv,
                                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                                        size: 24.0,
                                                                                                      ),
                                                                                                      onPressed: (requestedPartItem.requested == true)
                                                                                                          ? null
                                                                                                          : () async {
                                                                                                              await PartInsertionsTable().insert({
                                                                                                                'work_order_id': widget.workOrderId,
                                                                                                                'inserted_part': 1,
                                                                                                              });
                                                                                                              await PartsTable().update(
                                                                                                                data: {
                                                                                                                  'requested': true,
                                                                                                                },
                                                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                                                  'part_id',
                                                                                                                  valueOrDefault<String>(
                                                                                                                    requestedPartItem.partId,
                                                                                                                    '0',
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );

                                                                                                              safeSetState(() {});
                                                                                                            },
                                                                                                    ),
                                                                                                  if ((requestedPartItem.arrived == true) && (FFAppState().dispatch == 'dispatch'))
                                                                                                    FlutterFlowIconButton(
                                                                                                      borderRadius: 8.0,
                                                                                                      buttonSize: 40.0,
                                                                                                      fillColor: FlutterFlowTheme.of(context).primary,
                                                                                                      icon: Icon(
                                                                                                        Icons.print,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        size: 24.0,
                                                                                                      ),
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
                                                                                                                    child: PrintPartsArrivedWidget(
                                                                                                                      partsArrived: requestedPartItem,
                                                                                                                      partAgregate: columnPartSummaryAggregatedRow!,
                                                                                                                      workOrder: _model.workOrderQueryOnPage!.firstOrNull!,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        ).then((value) => safeSetState(() {}));

                                                                                                        Navigator.pop(context);
                                                                                                      },
                                                                                                    ),
                                                                                                  if ((requestedPartItem.arrived == false) && (FFAppState().dispatch == 'dispatch'))
                                                                                                    FlutterFlowIconButton(
                                                                                                      borderRadius: 8.0,
                                                                                                      buttonSize: 40.0,
                                                                                                      fillColor: FlutterFlowTheme.of(context).primary,
                                                                                                      disabledColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      disabledIconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                      icon: Icon(
                                                                                                        Icons.warehouse_sharp,
                                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                                        size: 24.0,
                                                                                                      ),
                                                                                                      onPressed: (requestedPartItem.arrived == true)
                                                                                                          ? null
                                                                                                          : () async {
                                                                                                              await PartInsertionsTable().insert({
                                                                                                                'work_order_id': widget.workOrderId,
                                                                                                                'inserted_part_arrived': 1,
                                                                                                              });
                                                                                                              await PartsTable().update(
                                                                                                                data: {
                                                                                                                  'arrived': true,
                                                                                                                  'arrived_date': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                                                                },
                                                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                                                  'part_id',
                                                                                                                  valueOrDefault<String>(
                                                                                                                    requestedPartItem.partId,
                                                                                                                    '0',
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                              await Future.delayed(const Duration(milliseconds: 1000));

                                                                                                              safeSetState(() {});
                                                                                                            },
                                                                                                    ),
                                                                                                ].divide(SizedBox(width: 16.0)),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }),
                                                                              );
                                                                            },
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Total Parts Requested',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  columnPartSummaryAggregatedRow?.totalPartSum?.toString(),
                                                                                                  '0',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                                      fontFamily: 'Outfit',
                                                                                                      color: FlutterFlowTheme.of(context).warning,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Total Parts Arrived',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  columnPartSummaryAggregatedRow?.totalPartArrivedSum?.toString(),
                                                                                                  '0',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                                      fontFamily: 'Outfit',
                                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 16.0)),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 16.0)),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                  ].divide(
                                                      SizedBox(height: 24.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
