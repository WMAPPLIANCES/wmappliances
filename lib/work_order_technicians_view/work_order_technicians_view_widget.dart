import '/appointment/pages/nav_bar1/nav_bar1_widget.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/check_list/check_list_dishwasher/check_list_dishwasher_widget.dart';
import '/check_list/check_list_microwave/check_list_microwave_widget.dart';
import '/check_list/check_list_range_cooktop/check_list_range_cooktop_widget.dart';
import '/check_list/check_list_refrigerator/check_list_refrigerator_widget.dart';
import '/check_list/check_list_venthood/check_list_venthood_widget.dart';
import '/check_list/check_list_washer_m/check_list_washer_m_widget.dart';
import '/components/add_part_selector_url_or_part_number_widget.dart';
import '/components/check_list_dryer_widget.dart';
import '/components/check_list_oven_widget.dart';
import '/components/diagnosis_view_b_s_widget.dart';
import '/components/is_calling_widget.dart';
import '/components/no_internet_widget.dart';
import '/components/voice_diagnosis2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/stock_page/add_part_in_stock_from_parts/add_part_in_stock_from_parts_widget.dart';
import '/work_order/botton_photos/botton_photos_widget.dart';
import '/work_order_diagnosis_pages/create_appliance/create_appliance_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'work_order_technicians_view_model.dart';
export 'work_order_technicians_view_model.dart';

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
class WorkOrderTechniciansViewWidget extends StatefulWidget {
  const WorkOrderTechniciansViewWidget({
    super.key,
    required this.workOrderRow,
  });

  final WorkOrdersRow? workOrderRow;

  static String routeName = 'workOrderTechniciansView';
  static String routePath = '/workOrderTechniciansView';

  @override
  State<WorkOrderTechniciansViewWidget> createState() =>
      _WorkOrderTechniciansViewWidgetState();
}

class _WorkOrderTechniciansViewWidgetState
    extends State<WorkOrderTechniciansViewWidget> {
  late WorkOrderTechniciansViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkOrderTechniciansViewModel());

    _model.switchValue1 = false;
    _model.switchValue2 = false;
    _model.switchValue3 = false;
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.switchValue4 = false;
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
              valueOrDefault<String>(
                widget.workOrderRow?.workOrderId,
                '003006069',
              ),
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
        List<DiagnosesRow> workOrderTechniciansViewDiagnosesRowList =
            snapshot.data!;

        return Title(
            title: 'workOrderTechniciansView',
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
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Stack(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 78.0),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: SingleChildScrollView(
                                          primary: false,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Text(
                                                  'Work Order Details',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 1.0,
                                                  shape: RoundedRectangleBorder(
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
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${valueOrDefault<String>(
                                                                widget
                                                                    .workOrderRow
                                                                    ?.workOrderId,
                                                                '003006069',
                                                              )} - ${valueOrDefault<String>(
                                                                widget
                                                                    .workOrderRow
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              widget.workOrderRow?.customerName,
                                                                              'name',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  fontSize: 14.0,
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
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
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
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          _model.mapsAddress =
                                                                              'https://www.google.com/maps/search/?api=1&query=${valueOrDefault<String>(
                                                                            widget.workOrderRow?.address,
                                                                            'address',
                                                                          )}';
                                                                          safeSetState(
                                                                              () {});
                                                                          await launchURL(
                                                                              _model.mapsAddress);
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Icon(
                                                                              Icons.navigation_sharp,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 22.0,
                                                                            ),
                                                                            Expanded(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      '${valueOrDefault<String>(
                                                                                        widget.workOrderRow?.address,
                                                                                        'address',
                                                                                      )}  ',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  if (widget.workOrderRow?.apartmentNumber != null && widget.workOrderRow?.apartmentNumber != '')
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        'APT: ${valueOrDefault<String>(
                                                                                          widget.workOrderRow?.apartmentNumber,
                                                                                          'apartment_number',
                                                                                        )}',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
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
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          _model.mapsAddress =
                                                                              'https://www.google.com/maps/search/?api=1&query=${valueOrDefault<String>(
                                                                            widget.workOrderRow?.address,
                                                                            'address',
                                                                          )}';
                                                                          safeSetState(
                                                                              () {});
                                                                          await launchURL(
                                                                              _model.mapsAddress);
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Icon(
                                                                              Icons.shield_rounded,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 22.0,
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    widget.workOrderRow?.coveragePlan,
                                                                                    'Basic',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Manrope',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
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
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            4.0,
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
                                                                              .calendar_month,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              22.0,
                                                                        ),
                                                                        Text(
                                                                          dateTimeFormat(
                                                                              "yMMMd",
                                                                              widget.workOrderRow!.createdAt!),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Manrope',
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 8.0)),
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
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Job Description               ',
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
                                                                Switch.adaptive(
                                                                  value: _model
                                                                      .switchValue1!,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    safeSetState(() =>
                                                                        _model.switchValue1 =
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
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  activeTrackColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                  inactiveTrackColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                  inactiveThumbColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
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
                                                                  'Appliances Requested',
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
                                                                Switch.adaptive(
                                                                  value: _model
                                                                      .switchValue2!,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    safeSetState(() =>
                                                                        _model.switchValue2 =
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
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  activeTrackColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                  inactiveTrackColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                  inactiveThumbColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
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
                                                                  'Previous Job                        ',
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
                                                                Switch.adaptive(
                                                                  value: _model
                                                                      .switchValue3!,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    safeSetState(() =>
                                                                        _model.switchValue3 =
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
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  activeTrackColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                  inactiveTrackColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                  inactiveThumbColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return WebViewAware(
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(context).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: Container(
                                                                                  height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                  child: CreateApplianceWidget(
                                                                                    workOrderDiagnosis: widget.workOrderRow!,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                    text:
                                                                        'Appliance',
                                                                    icon: Icon(
                                                                      Icons.add,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          46.0,
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Manrope',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      elevation:
                                                                          0.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      SensorMainPageWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'workOrderIdSensor':
                                                                            serializeParam(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            widget.workOrderRow?.workOrderId,
                                                                            '003006200',
                                                                          ),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  text:
                                                                      'Sensors',
                                                                  icon: Icon(
                                                                    Icons
                                                                        .remove_red_eye,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 24.0,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        46.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  tabletLandscape:
                                                                      false,
                                                                  desktop:
                                                                      false,
                                                                ))
                                                                  Flexible(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            enableDrag:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
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
                                                                                      child: IsCallingWidget(
                                                                                        customerNumber: valueOrDefault<String>(
                                                                                          widget.workOrderRow?.customerPhone,
                                                                                          '123',
                                                                                        ),
                                                                                        customerName: valueOrDefault<String>(
                                                                                          widget.workOrderRow?.customerName,
                                                                                          'Willian Marciano',
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            FFButtonWidget(
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
                                                                                            child: IsCallingWidget(
                                                                                              customerNumber: valueOrDefault<String>(
                                                                                                widget.workOrderRow?.customerPhone,
                                                                                                '123',
                                                                                              ),
                                                                                              customerName: valueOrDefault<String>(
                                                                                                widget.workOrderRow?.customerName,
                                                                                                'Willian Marciano',
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              },
                                                                              text: 'Call',
                                                                              icon: Icon(
                                                                                Icons.phone_in_talk,
                                                                                size: 15.0,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: 46.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 8.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.showDetail == true)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: Material(
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
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Detail',
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
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              MarkdownBody(
                                                                            data:
                                                                                valueOrDefault<String>(
                                                                              widget.workOrderRow?.detail,
                                                                              'No details found!',
                                                                            ),
                                                                            selectable:
                                                                                true,
                                                                            onTapLink: (_, url, __) =>
                                                                                launchURL(url!),
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
                                                ),
                                              if (_model.applianceRequested ==
                                                  true)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: Material(
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
                                                            EdgeInsets.all(8.0),
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
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Appliance Rested By  Client',
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
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 400.0,
                                                                child: custom_widgets
                                                                    .ListOfItems(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 400.0,
                                                                  items: widget
                                                                      .workOrderRow
                                                                      ?.items,
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 16.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (_model
                                                      .viewPreviousWorkOrder ==
                                                  true)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: Material(
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
                                                                    child: FutureBuilder<
                                                                        List<
                                                                            WorkOrdersRow>>(
                                                                      future: WorkOrdersTable()
                                                                          .queryRows(
                                                                        queryFn: (q) => q
                                                                            .eqOrNull(
                                                                              'customer_email',
                                                                              valueOrDefault<String>(
                                                                                widget.workOrderRow?.customerEmail,
                                                                                'email',
                                                                              ),
                                                                            )
                                                                            .neqOrNull(
                                                                              'work_order_id',
                                                                              valueOrDefault<String>(
                                                                                widget.workOrderRow?.workOrderId,
                                                                                '003006212',
                                                                              ),
                                                                            )
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
                                                                        List<WorkOrdersRow>
                                                                            columnWorkOrdersRowList =
                                                                            snapshot.data!;

                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: List.generate(
                                                                              columnWorkOrdersRowList.length,
                                                                              (columnIndex) {
                                                                            final columnWorkOrdersRow =
                                                                                columnWorkOrdersRowList[columnIndex];
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
                                                                                      WorkOrderTechniciansViewWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'workOrderRow': serializeParam(
                                                                                          columnWorkOrdersRow,
                                                                                          ParamType.SupabaseRow,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Flexible(
                                                                                        child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            columnWorkOrdersRow.workOrderId,
                                                                                            'This customer has not had a work order assigned previously.',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Manrope',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          context.pushNamed(
                                                                                            WorkOrderTechniciansViewWidget.routeName,
                                                                                            queryParameters: {
                                                                                              'workOrderRow': serializeParam(
                                                                                                columnWorkOrdersRow,
                                                                                                ParamType.SupabaseRow,
                                                                                              ),
                                                                                            }.withoutNulls,
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
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 1.0,
                                                  shape: RoundedRectangleBorder(
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
                                                          BorderRadius.circular(
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
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Status',
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
                                                                        valueOrDefault<
                                                                            double>(
                                                                      widget
                                                                          .workOrderRow
                                                                          ?.workOrderBarValue,
                                                                      0.0,
                                                                    ),
                                                                    lineHeight:
                                                                        40.0,
                                                                    animation:
                                                                        true,
                                                                    animateFromLastPercent:
                                                                        true,
                                                                    progressColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .accent4,
                                                                    center:
                                                                        Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        widget
                                                                            .workOrderRow
                                                                            ?.workOrderStatus,
                                                                        'Not Confirmed',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 16.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 1.0,
                                                  shape: RoundedRectangleBorder(
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
                                                          BorderRadius.circular(
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
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            85.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'View Status',
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
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          40.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    borderRadius:
                                                                        24.0,
                                                                    borderWidth:
                                                                        3.0,
                                                                    buttonSize:
                                                                        50.0,
                                                                    hoverColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .accent1,
                                                                    hoverIconColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .spatial_audio_off_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          28.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        TradutorWidget
                                                                            .routeName,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          kTransitionInfoKey:
                                                                              TransitionInfo(
                                                                            hasTransition:
                                                                                true,
                                                                            transitionType:
                                                                                PageTransitionType.fade,
                                                                            duration:
                                                                                Duration(milliseconds: 0),
                                                                          ),
                                                                        },
                                                                      );
                                                                    },
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
                                                              Flexible(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Material(
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
                                                                            child:
                                                                                Material(
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
                                                                            child:
                                                                                Material(
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
                                                                            child:
                                                                                Material(
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
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: SingleChildScrollView(
                                                    primary: false,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (_model
                                                                    .showAppointment ==
                                                                false)
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                ),
                                                              ),
                                                          ].divide(SizedBox(
                                                              width: 24.0)),
                                                        ),
                                                        if (_model
                                                                .showSchedule ==
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
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
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
                                                                child:
                                                                    SingleChildScrollView(
                                                                  primary:
                                                                      false,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        'Appointments',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Manrope',
                                                                              fontSize: 22.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                      Expanded(
                                                                        child: FutureBuilder<
                                                                            List<SchedulesRow>>(
                                                                          future:
                                                                              SchedulesTable().queryRows(
                                                                            queryFn: (q) => q
                                                                                .eqOrNull(
                                                                                  'work_order_id',
                                                                                  valueOrDefault<String>(
                                                                                    widget.workOrderRow?.workOrderId,
                                                                                    '003006069',
                                                                                  ),
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
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: listViewSchedulesRowList.length,
                                                                              itemBuilder: (context, listViewIndex) {
                                                                                final listViewSchedulesRow = listViewSchedulesRowList[listViewIndex];
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
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
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsets.all(8.0),
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
                                                                                                              Text(
                                                                                                                valueOrDefault<String>(
                                                                                                                  listViewSchedulesRow.techniciansName,
                                                                                                                  'WM Appliances',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Manrope',
                                                                                                                      fontSize: 22.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  if (listViewSchedulesRow.helper == true)
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
                                                                                                        print('IconButton pressed ...');
                                                                                                      },
                                                                                                    ),
                                                                                                ].divide(SizedBox(width: 16.0)),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Builder(
                                                                                              builder: (context) {
                                                                                                final appliancelist = listViewSchedulesRow.itens.toList();

                                                                                                return Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                  children: List.generate(appliancelist.length, (appliancelistIndex) {
                                                                                                    final appliancelistItem = appliancelist[appliancelistIndex];
                                                                                                    return Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsets.all(4.0),
                                                                                                            child: Text(
                                                                                                              '${valueOrDefault<String>(
                                                                                                                appliancelistItem,
                                                                                                                'Appliances',
                                                                                                              )}',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Manrope',
                                                                                                                    fontSize: 16.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    );
                                                                                                  }),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
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
                                                                                            ],
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 12.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
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
                                                        if (_model.showNotes ==
                                                            true)
                                                          Material(
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
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
                                                                              .textController,
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
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Manrope',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
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
                                                                            FlutterFlowTheme.of(context).primaryBackground,
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
                                                                      maxLines:
                                                                          6,
                                                                      minLines:
                                                                          3,
                                                                      validator: _model
                                                                          .textControllerValidator
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
                                                                        if (FFAppState().userRole ==
                                                                            'dispatch')
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
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
                                                                                    value: _model.switchValue4!,
                                                                                    onChanged: (newValue) async {
                                                                                      safeSetState(() => _model.switchValue4 = newValue);
                                                                                      if (newValue) {
                                                                                        _model.priorityNote = true;
                                                                                      } else {
                                                                                        _model.priorityNote = false;
                                                                                      }
                                                                                    },
                                                                                    activeColor: FlutterFlowTheme.of(context).primary,
                                                                                    activeTrackColor: FlutterFlowTheme.of(context).primary,
                                                                                    inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                                                                                    inactiveThumbColor: FlutterFlowTheme.of(context).primaryBackground,
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
                                                                            onPressed: (_model.textController.text == '')
                                                                                ? null
                                                                                : () async {
                                                                                    await NotesTable().insert({
                                                                                      'work_order_id': valueOrDefault<String>(
                                                                                        widget.workOrderRow?.workOrderId,
                                                                                        '003006069',
                                                                                      ),
                                                                                      'note_content': '${_model.textController.text}',
                                                                                      'user_name': FFAppState().userName,
                                                                                      'create_by_image': valueOrDefault<String>(
                                                                                        FFAppState().userPhoto,
                                                                                        'photo',
                                                                                      ),
                                                                                      'priority': _model.priorityNote,
                                                                                      'dispatch_note': _model.dispatchNote,
                                                                                      'create_by': currentUserUid,
                                                                                    });
                                                                                    safeSetState(() {
                                                                                      _model.textController?.clear();
                                                                                    });

                                                                                    safeSetState(() {});
                                                                                  },
                                                                            text:
                                                                                'Save',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              height: 40.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).secondary,
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
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          24.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child: FutureBuilder<
                                                                          List<
                                                                              NotesRow>>(
                                                                        future:
                                                                            NotesTable().queryRows(
                                                                          queryFn: (q) => q
                                                                              .eqOrNull(
                                                                                'work_order_id',
                                                                                valueOrDefault<String>(
                                                                                  widget.workOrderRow?.workOrderId,
                                                                                  '003006069',
                                                                                ),
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
                                                                              final listViewNotesRow = listViewNotesRowList[listViewIndex];
                                                                              return Stack(
                                                                                children: [
                                                                                  if (listViewNotesRow.priority == false)
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
                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              borderRadius: BorderRadius.circular(10.0),
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
                                                                                                        Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsets.all(8.0),
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
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsets.all(4.0),
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
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
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
                                                                                                        Expanded(
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Container(
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
                                                                                                          padding: EdgeInsets.all(8.0),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
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
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
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
                                                                                                        Expanded(
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Container(
                                                                                                                  decoration: BoxDecoration(),
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
                                                        if (_model
                                                                .showDiagnosisAppliance ==
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
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(12.0),
                                                                          child:
                                                                              Text(
                                                                            'Appliances',
                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  fontSize: 22.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final appliancesList =
                                                                              workOrderTechniciansViewDiagnosesRowList.toList();

                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                List.generate(appliancesList.length, (appliancesListIndex) {
                                                                              final appliancesListItem = appliancesList[appliancesListIndex];
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 8.0, 16.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Stack(
                                                                                                      children: [
                                                                                                        if (appliancesListItem.approvalStatus == 'Approved')
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: 20.0,
                                                                                                              height: 20.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                borderRadius: BorderRadius.circular(22.0),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        if (appliancesListItem.approvalStatus == 'Updated')
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: 20.0,
                                                                                                              height: 20.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).warning,
                                                                                                                borderRadius: BorderRadius.circular(22.0),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        if (appliancesListItem.approvalStatus == 'Pending')
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: 20.0,
                                                                                                              height: 20.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                                borderRadius: BorderRadius.circular(22.0),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
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
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 16.0, 0.0),
                                                                                                    child: Text(
                                                                                                      dateTimeFormat("yMMMd", appliancesListItem.createdAt!),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Manrope',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 4.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 8.0, 8.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            children: [
                                                                                              Flexible(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                  child: FlutterFlowIconButton(
                                                                                                    borderRadius: 8.0,
                                                                                                    buttonSize: 48.0,
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    icon: FaIcon(
                                                                                                      FontAwesomeIcons.edit,
                                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                                      size: 22.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      if (appliancesListItem.pendingPhotos == true) {
                                                                                                        await showDialog(
                                                                                                          context: context,
                                                                                                          builder: (alertDialogContext) {
                                                                                                            return WebViewAware(
                                                                                                              child: AlertDialog(
                                                                                                                title: Text('Missing Photos'),
                                                                                                                content: Text('Photos are missing. Please add the photos before proceeding with the diagnosis.'),
                                                                                                                actions: [
                                                                                                                  TextButton(
                                                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                    child: Text('Ok'),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        );
                                                                                                      } else {
                                                                                                        if (appliancesListItem.checkList == true) {
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
                                                                                                                      child: VoiceDiagnosis2Widget(
                                                                                                                        diagnosisId: appliancesListItem,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ).then((value) => safeSetState(() {}));
                                                                                                        } else {
                                                                                                          if (appliancesListItem.item == 'Refrigerator') {
                                                                                                            FFAppState().checkView1 = false;
                                                                                                            FFAppState().checkView2 = false;
                                                                                                            safeSetState(() {});
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
                                                                                                                        child: CheckListRefrigeratorWidget(
                                                                                                                          diagnosisCheckList: appliancesListItem,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ).then((value) => safeSetState(() {}));
                                                                                                          } else if (appliancesListItem.item == 'Dishwasher') {
                                                                                                            FFAppState().checkView1 = false;
                                                                                                            FFAppState().checkView2 = false;
                                                                                                            safeSetState(() {});
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
                                                                                                                        child: CheckListDishwasherWidget(
                                                                                                                          diagnosisCheckList: appliancesListItem,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ).then((value) => safeSetState(() {}));
                                                                                                          } else if (appliancesListItem.item == 'Washer M') {
                                                                                                            FFAppState().checkView1 = false;
                                                                                                            FFAppState().checkView2 = false;
                                                                                                            safeSetState(() {});
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
                                                                                                                        child: CheckListWasherMWidget(
                                                                                                                          diagnosisCheckList: appliancesListItem,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ).then((value) => safeSetState(() {}));
                                                                                                          } else if (appliancesListItem.item == 'Dryer') {
                                                                                                            FFAppState().checkView1 = false;
                                                                                                            FFAppState().checkView2 = false;
                                                                                                            safeSetState(() {});
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
                                                                                                                        child: CheckListDryerWidget(
                                                                                                                          diagnosisCheckList: appliancesListItem,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ).then((value) => safeSetState(() {}));
                                                                                                          } else if (appliancesListItem.item == 'Range Cooktop') {
                                                                                                            FFAppState().checkView1 = false;
                                                                                                            FFAppState().checkView2 = false;
                                                                                                            safeSetState(() {});
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
                                                                                                                        child: CheckListRangeCooktopWidget(
                                                                                                                          diagnosisCheckList: appliancesListItem,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ).then((value) => safeSetState(() {}));
                                                                                                          } else if (appliancesListItem.item == 'Wall Oven') {
                                                                                                            FFAppState().checkView1 = false;
                                                                                                            FFAppState().checkView2 = false;
                                                                                                            safeSetState(() {});
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
                                                                                                                        child: CheckListOvenWidget(
                                                                                                                          diagnosisCheckList: appliancesListItem,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ).then((value) => safeSetState(() {}));
                                                                                                          } else if (appliancesListItem.item == 'Rangehood') {
                                                                                                            FFAppState().checkView1 = false;
                                                                                                            FFAppState().checkView2 = false;
                                                                                                            safeSetState(() {});
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
                                                                                                                        child: CheckListVenthoodWidget(
                                                                                                                          diagnosisCheckList: appliancesListItem,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ).then((value) => safeSetState(() {}));
                                                                                                          } else if (appliancesListItem.item == 'Second Refrigerator') {
                                                                                                            FFAppState().checkView1 = false;
                                                                                                            FFAppState().checkView2 = false;
                                                                                                            safeSetState(() {});
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
                                                                                                                        child: CheckListRefrigeratorWidget(
                                                                                                                          diagnosisCheckList: appliancesListItem,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ).then((value) => safeSetState(() {}));
                                                                                                          } else {
                                                                                                            FFAppState().checkView1 = false;
                                                                                                            FFAppState().checkView2 = false;
                                                                                                            safeSetState(() {});
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
                                                                                                                        child: CheckListMicrowaveWidget(
                                                                                                                          diagnosisCheckList: appliancesListItem,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ).then((value) => safeSetState(() {}));
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Flexible(
                                                                                                child: FlutterFlowIconButton(
                                                                                                  borderRadius: 8.0,
                                                                                                  buttonSize: 48.0,
                                                                                                  fillColor: FlutterFlowTheme.of(context).accent4,
                                                                                                  icon: FaIcon(
                                                                                                    FontAwesomeIcons.tools,
                                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                                    size: 22.0,
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
                                                                                                                child: AddPartSelectorUrlOrPartNumberWidget(
                                                                                                                  partSelectoDiagnosis: appliancesListItem,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => safeSetState(() {}));
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                              Flexible(
                                                                                                child: FlutterFlowIconButton(
                                                                                                  borderRadius: 8.0,
                                                                                                  buttonSize: 48.0,
                                                                                                  fillColor: FlutterFlowTheme.of(context).accent3,
                                                                                                  icon: Icon(
                                                                                                    Icons.linked_camera,
                                                                                                    color: FlutterFlowTheme.of(context).info,
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
                                                                                                                child: BottonPhotosWidget(
                                                                                                                  workOrderPhoto: valueOrDefault<String>(
                                                                                                                    appliancesListItem.workOrderId,
                                                                                                                    '02',
                                                                                                                  ),
                                                                                                                  diagnosisParam: valueOrDefault<String>(
                                                                                                                    appliancesListItem.diagnosisId,
                                                                                                                    '01',
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => safeSetState(() {}));
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                              if (appliancesListItem.helper == true)
                                                                                                Flexible(
                                                                                                  child: FlutterFlowIconButton(
                                                                                                    borderRadius: 8.0,
                                                                                                    buttonSize: 48.0,
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
                                                                                                ),
                                                                                              if (appliancesListItem.typeService == 'Follow Up')
                                                                                                Flexible(
                                                                                                  child: FlutterFlowIconButton(
                                                                                                    borderRadius: 8.0,
                                                                                                    buttonSize: 48.0,
                                                                                                    fillColor: FlutterFlowTheme.of(context).warning,
                                                                                                    icon: Icon(
                                                                                                      Icons.shelves,
                                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    onPressed: () {
                                                                                                      print('Arrived pressed ...');
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              Flexible(
                                                                                                child: FlutterFlowIconButton(
                                                                                                  borderRadius: 8.0,
                                                                                                  buttonSize: 48.0,
                                                                                                  fillColor: FlutterFlowTheme.of(context).secondary,
                                                                                                  icon: Icon(
                                                                                                    Icons.kitchen,
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
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 8.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
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
                                                        if (_model
                                                                .showPartRequested ==
                                                            true)
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      PartsRow>>(
                                                                future:
                                                                    PartsTable()
                                                                        .queryRows(
                                                                  queryFn: (q) =>
                                                                      q.eqOrNull(
                                                                    'work_order_id',
                                                                    valueOrDefault<
                                                                        String>(
                                                                      widget
                                                                          .workOrderRow
                                                                          ?.workOrderId,
                                                                      '003006069',
                                                                    ),
                                                                  ),
                                                                ),
                                                                builder: (context,
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
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<PartsRow>
                                                                      containerPartsRowList =
                                                                      snapshot
                                                                          .data!;

                                                                  return Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        1.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8.0),
                                                                        child:
                                                                            Column(
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
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                              child: Builder(
                                                                                builder: (context) {
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
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              requestedPartItem.partNumber,
                                                                                                              ' Part Number',
                                                                                                            ).maybeHandleOverflow(
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
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              requestedPartItem.iten,
                                                                                                              '123',
                                                                                                            ).maybeHandleOverflow(
                                                                                                              maxChars: 50,
                                                                                                              replacement: '…',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Manrope',
                                                                                                                  fontSize: 16.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
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
                                                                                                        if (requestedPartItem.partTaken != null && requestedPartItem.partTaken != '')
                                                                                                          FlutterFlowIconButton(
                                                                                                            borderRadius: 8.0,
                                                                                                            buttonSize: 40.0,
                                                                                                            fillColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                            icon: Icon(
                                                                                                              Icons.shelves,
                                                                                                              color: FlutterFlowTheme.of(context).info,
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
                                                                                                                          child: AddPartInStockFromPartsWidget(
                                                                                                                            addPartInStockFromParts: requestedPartItem,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              ).then((value) => safeSetState(() {}));

                                                                                                              safeSetState(() {});
                                                                                                            },
                                                                                                          ),
                                                                                                        if (requestedPartItem.partTaken == null || requestedPartItem.partTaken == '')
                                                                                                          FlutterFlowIconButton(
                                                                                                            borderRadius: 8.0,
                                                                                                            buttonSize: 40.0,
                                                                                                            fillColor: FlutterFlowTheme.of(context).warning,
                                                                                                            icon: Icon(
                                                                                                              Icons.shelves,
                                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                                              size: 24.0,
                                                                                                            ),
                                                                                                            onPressed: () async {
                                                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                                                    context: context,
                                                                                                                    builder: (alertDialogContext) {
                                                                                                                      return WebViewAware(
                                                                                                                        child: AlertDialog(
                                                                                                                          title: Text('Parts Pick-Up Confirmation'),
                                                                                                                          content: Text('This is a confirmation request for the pick-up of the following part(s):Part Name: ${valueOrDefault<String>(
                                                                                                                            requestedPartItem.partNumber,
                                                                                                                            'Part Number',
                                                                                                                          )}  ${valueOrDefault<String>(
                                                                                                                            requestedPartItem.partName,
                                                                                                                            'At Office',
                                                                                                                          )}'),
                                                                                                                          actions: [
                                                                                                                            TextButton(
                                                                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                              child: Text('🔴 Not Confirmed'),
                                                                                                                            ),
                                                                                                                            TextButton(
                                                                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                              child: Text('🟢 Confirmedrm'),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      );
                                                                                                                    },
                                                                                                                  ) ??
                                                                                                                  false;
                                                                                                              if (confirmDialogResponse) {
                                                                                                                await PartsTable().update(
                                                                                                                  data: {
                                                                                                                    'part_taken': FFAppState().userName,
                                                                                                                  },
                                                                                                                  matchingRows: (rows) => rows.eqOrNull(
                                                                                                                    'part_id',
                                                                                                                    valueOrDefault<String>(
                                                                                                                      requestedPartItem.partId,
                                                                                                                      '0',
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                  SnackBar(
                                                                                                                    content: Text(
                                                                                                                      'Thank You for Picking Up the Part!Dear  ${FFAppState().userName}',
                                                                                                                      style: TextStyle(
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                                    backgroundColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                                  ),
                                                                                                                );

                                                                                                                safeSetState(() {});
                                                                                                              } else {
                                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                  SnackBar(
                                                                                                                    content: Text(
                                                                                                                      'Follow-Up: Parts Pick-Up Pending',
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
                                                                                                          ),
                                                                                                      ].divide(SizedBox(width: 8.0)),
                                                                                                    ),
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
                                                                            ),
                                                                          ].divide(SizedBox(height: 2.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                      ].divide(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 8.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: wrapWithModel(
                                model: _model.navBar1Model,
                                updateCallback: () => safeSetState(() {}),
                                child: NavBar1Widget(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    wrapWithModel(
                      model: _model.noInternetModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NoInternetWidget(),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
