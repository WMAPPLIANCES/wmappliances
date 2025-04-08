import '/appointment/navbar_botton/navbar_botton_widget.dart';
import '/backend/supabase/supabase.dart';
import '/components/side_menu_view_widget.dart';
import '/components/work_order_status_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/part_components/part_cost_update/part_cost_update_widget.dart';
import '/part_components/service_type_component/service_type_component_widget.dart';
import '/work_review/work_status_notes/work_status_notes_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'work_order_work_flow_model.dart';
export 'work_order_work_flow_model.dart';

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
class WorkOrderWorkFlowWidget extends StatefulWidget {
  const WorkOrderWorkFlowWidget({super.key});

  static String routeName = 'workOrderWorkFlow';
  static String routePath = '/workOrderWorkFlow';

  @override
  State<WorkOrderWorkFlowWidget> createState() =>
      _WorkOrderWorkFlowWidgetState();
}

class _WorkOrderWorkFlowWidgetState extends State<WorkOrderWorkFlowWidget> {
  late WorkOrderWorkFlowModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkOrderWorkFlowModel());

    _model.switchValue1 = false;
    _model.switchValue2 = false;
    _model.addNoteDispatchTextController ??= TextEditingController();
    _model.addNoteDispatchFocusNode ??= FocusNode();

    _model.switchValue3 = false;
    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.switchValue4 = false;
    _model.updateDiagnsosisTextController ??= TextEditingController();
    _model.updateDiagnsosisFocusNode ??= FocusNode();

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

    return FutureBuilder<List<SchedulesRow>>(
      future: SchedulesTable().queryRows(
        queryFn: (q) => q
            .lteOrNull(
              'appointment_date',
              supaSerialize<DateTime>(functions.today()),
            )
            .eqOrNull(
              'completed',
              false,
            ),
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
        List<SchedulesRow> workOrderWorkFlowSchedulesRowList = snapshot.data!;

        return Title(
            title: 'workOrderWorkFlow',
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
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
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
                                                0.18,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Appointments',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                if (FFAppState().userRole ==
                                                    'admin')
                                                  Builder(
                                                    builder: (context) {
                                                      final adminViewQuery =
                                                          workOrderWorkFlowSchedulesRowList
                                                              .toList();

                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            adminViewQuery
                                                                .length,
                                                            (adminViewQueryIndex) {
                                                          final adminViewQueryItem =
                                                              adminViewQuery[
                                                                  adminViewQueryIndex];
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Visibility(
                                                              visible:
                                                                  adminViewQueryItem
                                                                          .managerReview ==
                                                                      false,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children:
                                                                            [
                                                                          if (adminViewQueryItem.updateReview ==
                                                                              true)
                                                                            Container(
                                                                              width: 8.0,
                                                                              height: 100.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).warning,
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Flexible(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Text(
                                                                                                '${valueOrDefault<String>(
                                                                                                  adminViewQueryItem.workOrderId,
                                                                                                  '103300',
                                                                                                )} - ${valueOrDefault<String>(
                                                                                                  adminViewQueryItem.appointmentType,
                                                                                                  'Diagnosis',
                                                                                                )}',
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 16.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 8.0)),
                                                                                          ),
                                                                                        ),
                                                                                        Builder(
                                                                                          builder: (context) {
                                                                                            final listOfAppliancesAppointment = adminViewQueryItem.itens.toList();

                                                                                            return Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: List.generate(listOfAppliancesAppointment.length, (listOfAppliancesAppointmentIndex) {
                                                                                                final listOfAppliancesAppointmentItem = listOfAppliancesAppointment[listOfAppliancesAppointmentIndex];
                                                                                                return Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      listOfAppliancesAppointmentItem,
                                                                                                      'Appliances',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'Manrope',
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                );
                                                                                              }),
                                                                                            );
                                                                                          },
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
                                                                                                        adminViewQueryItem.techniciansName,
                                                                                                        'Willian Marciano',
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
                                                                                                    valueOrDefault<String>(
                                                                                                      dateTimeFormat("MMMEd", adminViewQueryItem.startTime),
                                                                                                      'today',
                                                                                                    ),
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
                                                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                                                context: context,
                                                                                                                builder: (alertDialogContext) {
                                                                                                                  return WebViewAware(
                                                                                                                    child: AlertDialog(
                                                                                                                      title: Text('🔒 Work Order Completion'),
                                                                                                                      content: Text('Are you sure you want to close this Work Order ${valueOrDefault<String>(
                                                                                                                        adminViewQueryItem.workOrderId,
                                                                                                                        '00300',
                                                                                                                      )} ? This cannot be undone.'),
                                                                                                                      actions: [
                                                                                                                        TextButton(
                                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                          child: Text('❌ Cancel'),
                                                                                                                        ),
                                                                                                                        TextButton(
                                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                          child: Text('✅ Proceed'),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              ) ??
                                                                                                              false;
                                                                                                          if (confirmDialogResponse) {
                                                                                                            await SchedulesTable().update(
                                                                                                              data: {
                                                                                                                'completed': true,
                                                                                                              },
                                                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                                                'schedule_id',
                                                                                                                valueOrDefault<String>(
                                                                                                                  adminViewQueryItem.scheduleId,
                                                                                                                  '0032022',
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
                                                                                                                        height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                                        child: WorkOrderStatusWidget(
                                                                                                                          workOrderString: valueOrDefault<String>(
                                                                                                                            adminViewQueryItem.workOrderId,
                                                                                                                            '0033200',
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ).then((value) => safeSetState(() {}));
                                                                                                          }

                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        text: 'Completed',
                                                                                                        options: FFButtonOptions(
                                                                                                          width: 100.0,
                                                                                                          height: 36.0,
                                                                                                          padding: EdgeInsets.all(8.0),
                                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                          color: FlutterFlowTheme.of(context).tertiary,
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
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: FFButtonWidget(
                                                                                                        onPressed: () async {
                                                                                                          await Future.wait([
                                                                                                            Future(() async {
                                                                                                              _model.diagnosisQuery = await DiagnosesTable().queryRows(
                                                                                                                queryFn: (q) => q
                                                                                                                    .eqOrNull(
                                                                                                                      'work_order_id',
                                                                                                                      valueOrDefault<String>(
                                                                                                                        workOrderWorkFlowSchedulesRowList.firstOrNull?.workOrderId,
                                                                                                                        '030303032',
                                                                                                                      ),
                                                                                                                    )
                                                                                                                    .order('created_at'),
                                                                                                              );
                                                                                                              _model.diagnosisQueryPage = _model.diagnosisQuery!.toList().cast<DiagnosesRow>();
                                                                                                              safeSetState(() {});
                                                                                                            }),
                                                                                                            Future(() async {
                                                                                                              _model.workOderQuery = await WorkOrdersTable().queryRows(
                                                                                                                queryFn: (q) => q.eqOrNull(
                                                                                                                  'work_order_id',
                                                                                                                  valueOrDefault<String>(
                                                                                                                    adminViewQueryItem.workOrderId,
                                                                                                                    '234145',
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                              _model.workOrderQuery = _model.workOderQuery?.firstOrNull;
                                                                                                              safeSetState(() {});
                                                                                                            }),
                                                                                                            Future(() async {
                                                                                                              _model.totalPartPrice = await PartsSummaryTable().queryRows(
                                                                                                                queryFn: (q) => q.eqOrNull(
                                                                                                                  'work_order_id',
                                                                                                                  valueOrDefault<String>(
                                                                                                                    workOrderWorkFlowSchedulesRowList.firstOrNull?.workOrderId,
                                                                                                                    '030303032',
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            }),
                                                                                                            Future(() async {
                                                                                                              _model.partsRequestedQuery = await PartSummaryAggregatedTable().queryRows(
                                                                                                                queryFn: (q) => q.eqOrNull(
                                                                                                                  'work_order_id',
                                                                                                                  valueOrDefault<String>(
                                                                                                                    workOrderWorkFlowSchedulesRowList.firstOrNull?.workOrderId,
                                                                                                                    '030303032',
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            }),
                                                                                                            Future(() async {
                                                                                                              _model.notesDispatchQueryMain = await NotesDispatchTable().queryRows(
                                                                                                                queryFn: (q) => q
                                                                                                                    .eqOrNull(
                                                                                                                      'work_order_id',
                                                                                                                      valueOrDefault<String>(
                                                                                                                        workOrderWorkFlowSchedulesRowList.firstOrNull?.workOrderId,
                                                                                                                        '030303032',
                                                                                                                      ),
                                                                                                                    )
                                                                                                                    .order('priority')
                                                                                                                    .order('created_at'),
                                                                                                              );
                                                                                                              _model.notesDispatchQuery = _model.notesDispatchQueryMain!.toList().cast<NotesDispatchRow>();
                                                                                                              safeSetState(() {});
                                                                                                            }),
                                                                                                            Future(() async {
                                                                                                              _model.notesQueryMain = await NotesTable().queryRows(
                                                                                                                queryFn: (q) => q
                                                                                                                    .eqOrNull(
                                                                                                                      'work_order_id',
                                                                                                                      valueOrDefault<String>(
                                                                                                                        workOrderWorkFlowSchedulesRowList.firstOrNull?.workOrderId,
                                                                                                                        '030303032',
                                                                                                                      ),
                                                                                                                    )
                                                                                                                    .order('priority')
                                                                                                                    .order('created_at'),
                                                                                                              );
                                                                                                              _model.notesQuery = _model.notesQueryMain!.toList().cast<NotesRow>();
                                                                                                              safeSetState(() {});
                                                                                                            }),
                                                                                                            Future(() async {
                                                                                                              _model.partsMainQuery = await PartsTable().queryRows(
                                                                                                                queryFn: (q) => q
                                                                                                                    .eqOrNull(
                                                                                                                      'work_order_id',
                                                                                                                      valueOrDefault<String>(
                                                                                                                        workOrderWorkFlowSchedulesRowList.firstOrNull?.workOrderId,
                                                                                                                        '030303032',
                                                                                                                      ),
                                                                                                                    )
                                                                                                                    .eqOrNull(
                                                                                                                      'diagnosis_id',
                                                                                                                      FFAppState().diagnosisId,
                                                                                                                    ),
                                                                                                              );
                                                                                                              _model.partQuery = _model.partsMainQuery!.toList().cast<PartsRow>();
                                                                                                              safeSetState(() {});
                                                                                                            }),
                                                                                                          ]);
                                                                                                          _model.dispatchNote = false;
                                                                                                          _model.showAppointment = true;
                                                                                                          _model.showDiagnosisAppliance = false;
                                                                                                          _model.showDetail = false;
                                                                                                          _model.showPartRequested = false;
                                                                                                          _model.showNotes = false;
                                                                                                          _model.showDispatchNotes = false;
                                                                                                          _model.viewDetail = false;
                                                                                                          _model.showSchedule = false;
                                                                                                          _model.helperTrue = false;
                                                                                                          _model.viewPreviousWorkOrder = false;
                                                                                                          _model.diagnosisViewAppliance = false;
                                                                                                          _model.scheduleID = valueOrDefault<String>(
                                                                                                            adminViewQueryItem.scheduleId,
                                                                                                            '0202',
                                                                                                          );
                                                                                                          safeSetState(() {});
                                                                                                          await SchedulesTable().update(
                                                                                                            data: {
                                                                                                              'update_review': true,
                                                                                                            },
                                                                                                            matchingRows: (rows) => rows.eqOrNull(
                                                                                                              'schedule_id',
                                                                                                              valueOrDefault<String>(
                                                                                                                adminViewQueryItem.scheduleId,
                                                                                                                '1254321',
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                          safeSetState(() {
                                                                                                            _model.switchValue1 = false;
                                                                                                            _model.switchValue2 = false;
                                                                                                            _model.switchValue3 = false;
                                                                                                            _model.switchValue4 = false;
                                                                                                          });
                                                                                                          safeSetState(() {
                                                                                                            _model.appointmentStatusValueController?.reset();
                                                                                                          });

                                                                                                          safeSetState(() {});

                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        text: 'View Claim',
                                                                                                        options: FFButtonOptions(
                                                                                                          width: 100.0,
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
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                if (FFAppState().userRole ==
                                                    'part_department')
                                                  Builder(
                                                    builder: (context) {
                                                      final dispatchViewQuery =
                                                          workOrderWorkFlowSchedulesRowList
                                                              .toList();

                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            dispatchViewQuery
                                                                .length,
                                                            (dispatchViewQueryIndex) {
                                                          final dispatchViewQueryItem =
                                                              dispatchViewQuery[
                                                                  dispatchViewQueryIndex];
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Visibility(
                                                              visible:
                                                                  dispatchViewQueryItem
                                                                          .managerReview ==
                                                                      true,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children:
                                                                            [
                                                                          if (dispatchViewQueryItem.updateReview ==
                                                                              true)
                                                                            Container(
                                                                              width: 8.0,
                                                                              height: 100.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).warning,
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Flexible(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Text(
                                                                                                '${valueOrDefault<String>(
                                                                                                  dispatchViewQueryItem.workOrderId,
                                                                                                  '2030221',
                                                                                                )} - ${valueOrDefault<String>(
                                                                                                  dispatchViewQueryItem.appointmentType,
                                                                                                  'Diagnosis',
                                                                                                )}',
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 16.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 8.0)),
                                                                                          ),
                                                                                        ),
                                                                                        Builder(
                                                                                          builder: (context) {
                                                                                            final listOfAppliancesAppointment = dispatchViewQueryItem.itens.toList();

                                                                                            return Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: List.generate(listOfAppliancesAppointment.length, (listOfAppliancesAppointmentIndex) {
                                                                                                final listOfAppliancesAppointmentItem = listOfAppliancesAppointment[listOfAppliancesAppointmentIndex];
                                                                                                return Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      listOfAppliancesAppointmentItem,
                                                                                                      'Appliances',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'Manrope',
                                                                                                          fontSize: 18.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                        ),
                                                                                                  ),
                                                                                                );
                                                                                              }),
                                                                                            );
                                                                                          },
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
                                                                                                        dispatchViewQueryItem.techniciansName,
                                                                                                        'Willian Marciano',
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
                                                                                                    valueOrDefault<String>(
                                                                                                      dateTimeFormat("MMMEd", dispatchViewQueryItem.startTime),
                                                                                                      'today',
                                                                                                    ),
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
                                                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                                                context: context,
                                                                                                                builder: (alertDialogContext) {
                                                                                                                  return WebViewAware(
                                                                                                                    child: AlertDialog(
                                                                                                                      title: Text('🔒 Work Order Completion'),
                                                                                                                      content: Text('Are you sure you want to close this Work Order ${valueOrDefault<String>(
                                                                                                                        dispatchViewQueryItem.workOrderId,
                                                                                                                        '20023012',
                                                                                                                      )} ? This cannot be undone.'),
                                                                                                                      actions: [
                                                                                                                        TextButton(
                                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                          child: Text('❌ Cancel'),
                                                                                                                        ),
                                                                                                                        TextButton(
                                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                          child: Text('✅ Proceed'),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              ) ??
                                                                                                              false;
                                                                                                          if (confirmDialogResponse) {
                                                                                                            await SchedulesTable().update(
                                                                                                              data: {
                                                                                                                'completed': true,
                                                                                                              },
                                                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                                                'schedule_id',
                                                                                                                valueOrDefault<String>(
                                                                                                                  dispatchViewQueryItem.workOrderId,
                                                                                                                  '12324',
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
                                                                                                                        height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                                        child: WorkOrderStatusWidget(
                                                                                                                          workOrderString: valueOrDefault<String>(
                                                                                                                            dispatchViewQueryItem.workOrderId,
                                                                                                                            '14314',
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ).then((value) => safeSetState(() {}));
                                                                                                          }

                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        text: 'Completed',
                                                                                                        options: FFButtonOptions(
                                                                                                          width: 100.0,
                                                                                                          height: 36.0,
                                                                                                          padding: EdgeInsets.all(8.0),
                                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                          color: FlutterFlowTheme.of(context).tertiary,
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
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: FFButtonWidget(
                                                                                                        onPressed: () async {
                                                                                                          await Future.wait([
                                                                                                            Future(() async {
                                                                                                              _model.diagnosisQueryDispa = await DiagnosesTable().queryRows(
                                                                                                                queryFn: (q) => q
                                                                                                                    .eqOrNull(
                                                                                                                      'work_order_id',
                                                                                                                      valueOrDefault<String>(
                                                                                                                        dispatchViewQueryItem.workOrderId,
                                                                                                                        '1234123',
                                                                                                                      ),
                                                                                                                    )
                                                                                                                    .order('created_at'),
                                                                                                              );
                                                                                                              _model.diagnosisQueryPage = _model.diagnosisQueryPage.toList().cast<DiagnosesRow>();
                                                                                                              safeSetState(() {});
                                                                                                            }),
                                                                                                            Future(() async {
                                                                                                              _model.workOderQuery1 = await WorkOrdersTable().queryRows(
                                                                                                                queryFn: (q) => q.eqOrNull(
                                                                                                                  'work_order_id',
                                                                                                                  valueOrDefault<String>(
                                                                                                                    dispatchViewQueryItem.workOrderId,
                                                                                                                    '1234123',
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                              _model.workOrderQuery = _model.workOderQuery1?.firstOrNull;
                                                                                                              safeSetState(() {});
                                                                                                            }),
                                                                                                            Future(() async {
                                                                                                              _model.totalPartPrice1 = await PartsSummaryTable().queryRows(
                                                                                                                queryFn: (q) => q.eqOrNull(
                                                                                                                  'work_order_id',
                                                                                                                  valueOrDefault<String>(
                                                                                                                    dispatchViewQueryItem.workOrderId,
                                                                                                                    '1234123',
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            }),
                                                                                                            Future(() async {
                                                                                                              _model.partsRequestedQuery1 = await PartSummaryAggregatedTable().queryRows(
                                                                                                                queryFn: (q) => q.eqOrNull(
                                                                                                                  'work_order_id',
                                                                                                                  valueOrDefault<String>(
                                                                                                                    dispatchViewQueryItem.workOrderId,
                                                                                                                    '1234123',
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            }),
                                                                                                            Future(() async {
                                                                                                              _model.notesDispatchQueryMain1 = await NotesDispatchTable().queryRows(
                                                                                                                queryFn: (q) => q
                                                                                                                    .eqOrNull(
                                                                                                                      'work_order_id',
                                                                                                                      valueOrDefault<String>(
                                                                                                                        dispatchViewQueryItem.workOrderId,
                                                                                                                        '1234123',
                                                                                                                      ),
                                                                                                                    )
                                                                                                                    .order('priority')
                                                                                                                    .order('created_at'),
                                                                                                              );
                                                                                                              _model.notesDispatchQuery = _model.notesDispatchQueryMain1!.toList().cast<NotesDispatchRow>();
                                                                                                              safeSetState(() {});
                                                                                                            }),
                                                                                                            Future(() async {
                                                                                                              _model.notesQueryMain1 = await NotesTable().queryRows(
                                                                                                                queryFn: (q) => q
                                                                                                                    .eqOrNull(
                                                                                                                      'work_order_id',
                                                                                                                      valueOrDefault<String>(
                                                                                                                        dispatchViewQueryItem.workOrderId,
                                                                                                                        '1234123',
                                                                                                                      ),
                                                                                                                    )
                                                                                                                    .order('priority')
                                                                                                                    .order('created_at'),
                                                                                                              );
                                                                                                              _model.notesQuery = _model.notesQueryMain1!.toList().cast<NotesRow>();
                                                                                                              safeSetState(() {});
                                                                                                            }),
                                                                                                            Future(() async {
                                                                                                              _model.partsMainQuery1 = await PartsTable().queryRows(
                                                                                                                queryFn: (q) => q
                                                                                                                    .eqOrNull(
                                                                                                                      'work_order_id',
                                                                                                                      valueOrDefault<String>(
                                                                                                                        dispatchViewQueryItem.workOrderId,
                                                                                                                        '1234123',
                                                                                                                      ),
                                                                                                                    )
                                                                                                                    .eqOrNull(
                                                                                                                      'diagnosis_id',
                                                                                                                      FFAppState().diagnosisId,
                                                                                                                    ),
                                                                                                              );
                                                                                                              _model.partQuery = _model.partsMainQuery1!.toList().cast<PartsRow>();
                                                                                                              safeSetState(() {});
                                                                                                            }),
                                                                                                          ]);
                                                                                                          _model.dispatchNote = false;
                                                                                                          _model.showAppointment = true;
                                                                                                          _model.showDiagnosisAppliance = false;
                                                                                                          _model.showDetail = false;
                                                                                                          _model.showPartRequested = false;
                                                                                                          _model.showNotes = false;
                                                                                                          _model.showDispatchNotes = false;
                                                                                                          _model.viewDetail = false;
                                                                                                          _model.showSchedule = false;
                                                                                                          _model.helperTrue = false;
                                                                                                          _model.viewPreviousWorkOrder = false;
                                                                                                          _model.diagnosisViewAppliance = false;
                                                                                                          _model.scheduleID = valueOrDefault<String>(
                                                                                                            dispatchViewQueryItem.scheduleId,
                                                                                                            '12434',
                                                                                                          );
                                                                                                          safeSetState(() {});
                                                                                                          await SchedulesTable().update(
                                                                                                            data: {
                                                                                                              'update_review': true,
                                                                                                            },
                                                                                                            matchingRows: (rows) => rows.eqOrNull(
                                                                                                              'schedule_id',
                                                                                                              valueOrDefault<String>(
                                                                                                                dispatchViewQueryItem.scheduleId,
                                                                                                                '124324',
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                          safeSetState(() {
                                                                                                            _model.switchValue1 = false;
                                                                                                            _model.switchValue2 = false;
                                                                                                            _model.switchValue3 = false;
                                                                                                            _model.switchValue4 = false;
                                                                                                          });
                                                                                                          safeSetState(() {
                                                                                                            _model.appointmentStatusValueController?.reset();
                                                                                                          });

                                                                                                          safeSetState(() {});

                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        text: 'View Claim',
                                                                                                        options: FFButtonOptions(
                                                                                                          width: 100.0,
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
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                              ].divide(SizedBox(height: 24.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 2.0,
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.35,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Visibility(
                                          visible:
                                              _model.workOrderQuery != null,
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
                                                              valueOrDefault<
                                                                  String>(
                                                                _model
                                                                    .workOrderQuery
                                                                    ?.workOrderId,
                                                                '003002121',
                                                              ),
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
                                                                              size: 24.0,
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                _model.workOrderQuery?.customerName,
                                                                                'Jorge Luz',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    fontSize: 18.0,
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
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .phone,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        _model
                                                                            .workOrderQuery
                                                                            ?.customerPhone,
                                                                        '5109006060',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Manrope',
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          8.0)),
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
                                                                              Icons.email_sharp,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 24.0,
                                                                            ),
                                                                            Expanded(
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  _model.workOrderQuery?.customerEmail,
                                                                                  'wm@wmappliances.net',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      fontSize: 18.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
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
                                                                                24.0,
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                '${valueOrDefault<String>(
                                                                                  _model.workOrderQuery?.address,
                                                                                  '15178 Discovery Rd San Leandro',
                                                                                )}  ',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      fontSize: 18.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              if (_model.workOrderQuery?.apartmentNumber != null && _model.workOrderQuery?.apartmentNumber != '')
                                                                                Text(
                                                                                  'APT: ${valueOrDefault<String>(
                                                                                    _model.workOrderQuery?.apartmentNumber,
                                                                                    '321',
                                                                                  )}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Manrope',
                                                                                        fontSize: 18.0,
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
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .calendar_month,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 24.0,
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      dateTimeFormat(
                                                                          "MMMEd",
                                                                          _model
                                                                              .workOrderQuery
                                                                              ?.createdAt),
                                                                      'Thu, Feb 20',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
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
                                                                    'View Detail',
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
                                                                            .primary,
                                                                    inactiveTrackColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    inactiveThumbColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
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
                                                                    'View Previous Job',
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
                                                                            .primary,
                                                                    inactiveTrackColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    inactiveThumbColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
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
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    if (FFAppState()
                                                                            .userRole ==
                                                                        'admin')
                                                                      Expanded(
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            await SchedulesTable().update(
                                                                              data: {
                                                                                'manager_review': true,
                                                                                'update_review': false,
                                                                              },
                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                'schedule_id',
                                                                                _model.scheduleID,
                                                                              ),
                                                                            );

                                                                            context.pushNamed(
                                                                              WorkOrderWorkFlowWidget.routeName,
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
                                                                          text:
                                                                              'Approve Submission',
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
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  color: Colors.white,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (FFAppState()
                                                                            .userRole ==
                                                                        'part_department')
                                                                      Expanded(
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            await SchedulesTable().update(
                                                                              data: {
                                                                                'manager_review': false,
                                                                                'update_review': false,
                                                                              },
                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                'schedule_id',
                                                                                _model.scheduleID,
                                                                              ),
                                                                            );

                                                                            context.pushNamed(
                                                                              WorkOrderWorkFlowWidget.routeName,
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
                                                                          text:
                                                                              'Request Manager Review',
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
                                                                                FlutterFlowTheme.of(context).warning,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  color: Colors.white,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          8.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 16.0)),
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
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                MarkdownBody(
                                                                              data: valueOrDefault<String>(
                                                                                _model.workOrderQuery?.detail,
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
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          FlutterFlowChoiceChips(
                                                                        options: [
                                                                          ChipData(
                                                                              'Confirmed',
                                                                              Icons.check_circle),
                                                                          ChipData(
                                                                              'In Progress',
                                                                              Icons.engineering),
                                                                          ChipData(
                                                                              'Completed',
                                                                              Icons.task_alt),
                                                                          ChipData(
                                                                              'Waiting on Parts',
                                                                              Icons.hourglass_empty)
                                                                        ],
                                                                        onChanged:
                                                                            (val) async {
                                                                          safeSetState(() =>
                                                                              _model.appointmentStatusValue = val?.firstOrNull);
                                                                          await WorkOrdersTable()
                                                                              .update(
                                                                            data: {
                                                                              'next_appointment_status': _model.appointmentStatusValue,
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eqOrNull(
                                                                              'work_order_id',
                                                                              valueOrDefault<String>(
                                                                                _model.workOderQuery?.firstOrNull?.workOrderId,
                                                                                '0230',
                                                                              ),
                                                                            ),
                                                                          );

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        selectedChipStyle:
                                                                            ChipStyle(
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Manrope',
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                fontSize: 20.0,
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
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Manrope',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontSize: 20.0,
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
                                                                            8.0,
                                                                        rowSpacing:
                                                                            8.0,
                                                                        multiselect:
                                                                            false,
                                                                        initialized:
                                                                            _model.appointmentStatusValue !=
                                                                                null,
                                                                        alignment:
                                                                            WrapAlignment.start,
                                                                        controller:
                                                                            _model.appointmentStatusValueController ??=
                                                                                FormFieldController<List<String>>(
                                                                          [
                                                                            valueOrDefault<String>(
                                                                              _model.workOderQuery?.firstOrNull?.nextAppointmentStatus,
                                                                              'Not Confirmed',
                                                                            )
                                                                          ],
                                                                        ),
                                                                        wrapped:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  _model
                                                                      .workOderQuery
                                                                      ?.firstOrNull
                                                                      ?.nextAppointmentStatus,
                                                                  'Not Confirmed',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          20.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
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
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
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
                                                                  'Service Cost',
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
                                                                    final diagnosisPrice =
                                                                        _model.diagnosisQuery?.toList() ??
                                                                            [];

                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: List.generate(
                                                                          diagnosisPrice
                                                                              .length,
                                                                          (diagnosisPriceIndex) {
                                                                        final diagnosisPriceItem =
                                                                            diagnosisPrice[diagnosisPriceIndex];
                                                                        return Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).accent1,
                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 16.0),
                                                                                child: FutureBuilder<List<PartsSummaryRow>>(
                                                                                  future: PartsSummaryTable().querySingleRow(
                                                                                    queryFn: (q) => q.eqOrNull(
                                                                                      'diagnosis_id',
                                                                                      valueOrDefault<String>(
                                                                                        diagnosisPriceItem.diagnosisId,
                                                                                        '432424',
                                                                                      ),
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
                                                                                    List<PartsSummaryRow> rowPartsSummaryRowList = snapshot.data!;

                                                                                    final rowPartsSummaryRow = rowPartsSummaryRowList.isNotEmpty ? rowPartsSummaryRowList.first : null;

                                                                                    return Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  diagnosisPriceItem.item,
                                                                                                  'Appliances',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      fontSize: 22.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                ' |  \$: ${valueOrDefault<String>(
                                                                                                  rowPartsSummaryRow?.totalSoldPrice.toString(),
                                                                                                  '0.00',
                                                                                                )}  | ',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      fontSize: 20.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  diagnosisPriceItem.repairCostType,
                                                                                                  'Normal',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      fontSize: 20.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
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
                                                                                              if (FFAppState().userRole == 'admin')
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                  child: FlutterFlowIconButton(
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
                                                                                                                  child: ServiceTypeComponentWidget(
                                                                                                                    serviceTypeParamenter: diagnosisPriceItem,
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
                                                                                            ].divide(SizedBox(width: 16.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 24.0)),
                                                                                    );
                                                                                  },
                                                                                ),
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 12.0),
                                                    child: Material(
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
                                                              Text(
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
                                                                            MainAxisSize.max,
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
                                                                                        _model.showDiagnosisAppliance = true;
                                                                                        safeSetState(() {});

                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        _model.showDiagnosisAppliance = false;
                                                                                        safeSetState(() {});

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
                                                                                    value: _model.switchListTileValue2 ??= false,
                                                                                    onChanged: (newValue) async {
                                                                                      safeSetState(() => _model.switchListTileValue2 = newValue);
                                                                                      if (newValue) {
                                                                                        _model.showPartRequested = true;
                                                                                        safeSetState(() {});

                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        _model.showPartRequested = false;
                                                                                        safeSetState(() {});

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
                                                                                    value: _model.switchListTileValue3 ??= false,
                                                                                    onChanged: (newValue) async {
                                                                                      safeSetState(() => _model.switchListTileValue3 = newValue);
                                                                                      if (newValue) {
                                                                                        _model.viewNotes = true;
                                                                                        safeSetState(() {});

                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        _model.viewNotes = false;
                                                                                        safeSetState(() {});

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
                                                                              Expanded(
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  child: SwitchListTile.adaptive(
                                                                                    value: _model.switchListTileValue4 ??= false,
                                                                                    onChanged: (newValue) async {
                                                                                      safeSetState(() => _model.switchListTileValue4 = newValue);
                                                                                      if (newValue) {
                                                                                        _model.showDispatchNotes = true;
                                                                                        safeSetState(() {});

                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        _model.showDispatchNotes = false;
                                                                                        safeSetState(() {});

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
                                                                      final diagnosisList = _model
                                                                          .diagnosisQueryPage
                                                                          .toList();

                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            diagnosisList.length,
                                                                            (diagnosisListIndex) {
                                                                          final diagnosisListItem =
                                                                              diagnosisList[diagnosisListIndex];
                                                                          return Expanded(
                                                                            child:
                                                                                Padding(
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
                                                                                          if (diagnosisListItem.typeService == 'Follow Up')
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                              child: FlutterFlowIconButton(
                                                                                                borderRadius: 8.0,
                                                                                                buttonSize: 40.0,
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
                                                                                          if (diagnosisListItem.typeService != 'Follow Up')
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                              child: Icon(
                                                                                                Icons.kitchen,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                size: 40.0,
                                                                                              ),
                                                                                            ),
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    diagnosisListItem.item,
                                                                                                    'Appliances',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Manrope',
                                                                                                        fontSize: 20.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    dateTimeFormat("yMMMd", diagnosisListItem.createdAt),
                                                                                                    'Mar 7, 2025',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Manrope',
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
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
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
                                                                                                  FFAppState().diagnosisId = valueOrDefault<String>(
                                                                                                    diagnosisListItem.diagnosisId,
                                                                                                    '012',
                                                                                                  );
                                                                                                  safeSetState(() {});
                                                                                                  _model.partsMainQueryOnUpdate = await PartsTable().queryRows(
                                                                                                    queryFn: (q) => q
                                                                                                        .eqOrNull(
                                                                                                          'work_order_id',
                                                                                                          valueOrDefault<String>(
                                                                                                            diagnosisListItem.workOrderId,
                                                                                                            '02',
                                                                                                          ),
                                                                                                        )
                                                                                                        .eqOrNull(
                                                                                                          'diagnosis_id',
                                                                                                          FFAppState().diagnosisId,
                                                                                                        ),
                                                                                                  );
                                                                                                  _model.partQuery = _model.partsMainQuery!.toList().cast<PartsRow>();
                                                                                                  _model.progressBarColor = colorFromCssString(
                                                                                                    valueOrDefault<String>(
                                                                                                      _model.partsMainQueryOnUpdate?.firstOrNull?.progressColor,
                                                                                                      '#0b67bc',
                                                                                                    ),
                                                                                                    defaultColor: Colors.black,
                                                                                                  );
                                                                                                  _model.progressBarValue = valueOrDefault<double>(
                                                                                                    _model.partsMainQueryOnUpdate?.firstOrNull?.progressBarValue,
                                                                                                    0.0,
                                                                                                  );
                                                                                                  _model.progressBarName = valueOrDefault<String>(
                                                                                                    _model.partsMainQueryOnUpdate?.firstOrNull?.progressBarName,
                                                                                                    'Not Started',
                                                                                                  );
                                                                                                  safeSetState(() {});
                                                                                                  _model.viewDiagnosis = diagnosisListItem;
                                                                                                  safeSetState(() {});
                                                                                                  _model.diagnosisViewAppliance = true;
                                                                                                  safeSetState(() {});

                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                              ),
                                                                                              FlutterFlowIconButton(
                                                                                                borderRadius: 8.0,
                                                                                                buttonSize: 40.0,
                                                                                                fillColor: FlutterFlowTheme.of(context).error,
                                                                                                icon: Icon(
                                                                                                  Icons.flag,
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
                                                                                                              child: WorkStatusNotesWidget(
                                                                                                                workReviewNotes: diagnosisListItem,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => safeSetState(() {}));
                                                                                                },
                                                                                              ),
                                                                                              FlutterFlowIconButton(
                                                                                                borderRadius: 8.0,
                                                                                                buttonSize: 40.0,
                                                                                                fillColor: FlutterFlowTheme.of(context).warning,
                                                                                                icon: Icon(
                                                                                                  Icons.linked_camera,
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                onPressed: () {
                                                                                                  print('Requested pressed ...');
                                                                                                },
                                                                                              ),
                                                                                              FlutterFlowIconButton(
                                                                                                borderRadius: 8.0,
                                                                                                buttonSize: 40.0,
                                                                                                fillColor: FlutterFlowTheme.of(context).primary,
                                                                                                disabledColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                disabledIconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                icon: Icon(
                                                                                                  Icons.hail,
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                onPressed: (diagnosisListItem.helper == true)
                                                                                                    ? null
                                                                                                    : () async {
                                                                                                        await DiagnosesTable().update(
                                                                                                          data: {
                                                                                                            'helper': true,
                                                                                                          },
                                                                                                          matchingRows: (rows) => rows.eqOrNull(
                                                                                                            'diagnosis_id',
                                                                                                            valueOrDefault<String>(
                                                                                                              diagnosisListItem.diagnosisId,
                                                                                                              '00030221',
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 16.0)),
                                                                                          ),
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
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    12.0),
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
                                                                  Text(
                                                                    'Requested Parts',
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
                                                                      final partQueryFinal = _model
                                                                          .partQuery
                                                                          .toList();

                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            partQueryFinal.length,
                                                                            (partQueryFinalIndex) {
                                                                          final partQueryFinalItem =
                                                                              partQueryFinal[partQueryFinalIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Container(
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
                                                                                              partQueryFinalItem.iten,
                                                                                              ' Appliance',
                                                                                            )} - ${partQueryFinalItem.partNumber}'
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
                                                                                                    partQueryFinalItem.quantity?.toString(),
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
                                                                                            onPressed: (partQueryFinalItem.requested == true)
                                                                                                ? null
                                                                                                : () {
                                                                                                    print('Requested pressed ...');
                                                                                                  },
                                                                                          ),
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
                                                                                            onPressed: (partQueryFinalItem.arrived == true)
                                                                                                ? null
                                                                                                : () {
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
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              16.0,
                                                                              16.0,
                                                                              16.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children:
                                                                                [
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
                                                                                          _model.partsRequestedQuery?.firstOrNull?.totalPartSum?.toString(),
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
                                                                                          _model.partsRequestedQuery?.firstOrNull?.totalPartArrivedSum?.toString(),
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
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 1.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
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
                                                                .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                                  controller: _model
                                                                      .addNoteDispatchTextController,
                                                                  focusNode: _model
                                                                      .addNoteDispatchFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.addNoteDispatchTextController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    () => safeSetState(
                                                                        () {}),
                                                                  ),
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
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
                                                                    if (FFAppState()
                                                                            .userRole ==
                                                                        'dispatch')
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
                                                                                value: _model.switchValue3!,
                                                                                onChanged: (newValue) async {
                                                                                  safeSetState(() => _model.switchValue3 = newValue);
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
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed: (_model.addNoteDispatchTextController.text == '')
                                                                            ? null
                                                                            : () async {
                                                                                _model.disptchnotes = await NotesDispatchTable().insert({
                                                                                  'work_order_id': valueOrDefault<String>(
                                                                                    _model.workOrderQuery?.workOrderId,
                                                                                    '0300',
                                                                                  ),
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
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
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
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final notesDispatch = _model
                                                                          .notesDispatchQuery
                                                                          .toList();

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
                                                                            notesDispatch.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                notesDispatchIndex) {
                                                                          final notesDispatchItem =
                                                                              notesDispatch[notesDispatchIndex];
                                                                          return Stack(
                                                                            children: [
                                                                              if (notesDispatchItem.priority == false)
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
                                                                                                Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
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
                                                                                                              notesDispatchItem.createByImage,
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
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                      child: Text(
                                                                                                        dateTimeFormat("relative", notesDispatchItem.createdAt!),
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
                                                                                                      Container(
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsets.all(12.0),
                                                                                                            child: MarkdownBody(
                                                                                                              data: valueOrDefault<String>(
                                                                                                                notesDispatchItem.noteContent,
                                                                                                                'Notes',
                                                                                                              ),
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
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (notesDispatchItem.priority == true)
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
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
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
                                                                                                                  notesDispatchItem.createByImage,
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
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                          child: Text(
                                                                                                            dateTimeFormat("relative", notesDispatchItem.createdAt!),
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
                                                                                                          Container(
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsets.all(12.0),
                                                                                                                child: MarkdownBody(
                                                                                                                  data: valueOrDefault<String>(
                                                                                                                    notesDispatchItem.noteContent,
                                                                                                                    'notes',
                                                                                                                  ),
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
                                                  if (_model.viewNotes == true)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  24.0),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 1.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
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
                                                                  controller: _model
                                                                      .textController2,
                                                                  focusNode: _model
                                                                      .textFieldFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.textController2',
                                                                    Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    () => safeSetState(
                                                                        () {}),
                                                                  ),
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
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
                                                                      .textController2Validator
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
                                                                      alignment:
                                                                          AlignmentDirectional(
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
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Switch.adaptive(
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
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed: (_model.textController2.text == '')
                                                                            ? null
                                                                            : () async {
                                                                                await NotesTable().insert({
                                                                                  'work_order_id': valueOrDefault<String>(
                                                                                    _model.workOrderQuery?.workOrderId,
                                                                                    'wo',
                                                                                  ),
                                                                                  'note_content': '${_model.textController2.text}',
                                                                                  'user_name': FFAppState().userName,
                                                                                  'create_by_image': valueOrDefault<String>(
                                                                                    FFAppState().userPhoto,
                                                                                    'photo',
                                                                                  ),
                                                                                  'priority': _model.priorityNote,
                                                                                });
                                                                                safeSetState(() {
                                                                                  _model.textController2?.clear();
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
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
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
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final queryNoteList = _model
                                                                          .notesQuery
                                                                          .toList();

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
                                                                            queryNoteList.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                queryNoteListIndex) {
                                                                          final queryNoteListItem =
                                                                              queryNoteList[queryNoteListIndex];
                                                                          return Stack(
                                                                            children: [
                                                                              if (queryNoteListItem.priority == false)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
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
                                                                                                          queryNoteListItem.createByImage,
                                                                                                          'Image',
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
                                                                                                              data: valueOrDefault<String>(
                                                                                                                queryNoteListItem.noteContent,
                                                                                                                'Notes',
                                                                                                              ),
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
                                                                                              dateTimeFormat("relative", queryNoteListItem.createdAt!),
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
                                                                              if (queryNoteListItem.priority == true)
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
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
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
                                                                                                                  queryNoteListItem.createByImage,
                                                                                                                  'image',
                                                                                                                ),
                                                                                                                width: 60.0,
                                                                                                                height: 61.4,
                                                                                                                fit: BoxFit.cover,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                          child: Text(
                                                                                                            dateTimeFormat("relative", queryNoteListItem.createdAt!),
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
                                                                                                          Container(
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsets.all(12.0),
                                                                                                                child: MarkdownBody(
                                                                                                                  data: valueOrDefault<String>(
                                                                                                                    queryNoteListItem.noteContent,
                                                                                                                    'Notes',
                                                                                                                  ),
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
                                                ].divide(
                                                    SizedBox(height: 24.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 2.0,
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.44,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Visibility(
                                          visible:
                                              _model.diagnosisViewAppliance ==
                                                  true,
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
                                                      'Diagnosis Details',
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
                                                              valueOrDefault<
                                                                  String>(
                                                                _model
                                                                    .viewDiagnosis
                                                                    ?.item,
                                                                'Appliance',
                                                              ),
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
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
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
                                                                              12.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          36.0,
                                                                          16.0,
                                                                          36.0,
                                                                          36.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        'Appliance Details',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Manrope',
                                                                              fontSize: 20.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
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
                                                                            await Clipboard.setData(ClipboardData(
                                                                                text: valueOrDefault<String>(
                                                                              _model.viewDiagnosis?.brand,
                                                                              'Brand',
                                                                            )));

                                                                            safeSetState(() {});
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  'copied...',
                                                                                  style: TextStyle(
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                ),
                                                                                duration: Duration(milliseconds: 4000),
                                                                                backgroundColor: FlutterFlowTheme.of(context).success,
                                                                              ),
                                                                            );
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                'Brand:',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 18.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  _model.viewDiagnosis?.brand,
                                                                                  'Brand',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      fontSize: 20.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
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
                                                                          await Clipboard.setData(ClipboardData(
                                                                              text: valueOrDefault<String>(
                                                                            _model.viewDiagnosis?.modelNumber,
                                                                            'Model Number',
                                                                          )));

                                                                          safeSetState(
                                                                              () {});
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'copied...',
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 4000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).success,
                                                                            ),
                                                                          );
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'Model Number:',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      'copied...',
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 1450),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).success,
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  _model.viewDiagnosis?.modelNumber,
                                                                                  'Model number',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      fontSize: 20.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
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
                                                                          await Clipboard.setData(ClipboardData(
                                                                              text: valueOrDefault<String>(
                                                                            _model.viewDiagnosis?.serialNumber,
                                                                            'Serial number',
                                                                          )));

                                                                          safeSetState(
                                                                              () {});
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'copied...',
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 4000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).success,
                                                                            ),
                                                                          );
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'Serial Number:',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                _model.viewDiagnosis?.serialNumber,
                                                                                'Serial Number',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    fontSize: 20.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
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
                                                                          await Clipboard.setData(ClipboardData(
                                                                              text: valueOrDefault<String>(
                                                                            _model.viewDiagnosis?.workOrderId,
                                                                            'Work Order',
                                                                          )));

                                                                          safeSetState(
                                                                              () {});
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'copied...',
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 4000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).success,
                                                                            ),
                                                                          );
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'Work Order:',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                _model.viewDiagnosis?.workOrderId,
                                                                                'Work Order Id',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    fontSize: 20.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'Diagnosis ID:',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              _model.viewDiagnosis?.diagnosisId,
                                                                              'Diagnosis Id',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  fontSize: 20.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'Technician:',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              _model.viewDiagnosis?.technicianName,
                                                                              'Willian Marciano',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  fontSize: 20.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'Created At:',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              dateTimeFormat("MMMEd", _model.viewDiagnosis?.createdAt),
                                                                              'Thu, Feb 20',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  fontSize: 20.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            12.0)),
                                                                  ),
                                                                ),
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
                                                                    4.0,
                                                                    20.0,
                                                                    4.0,
                                                                    20.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Report',
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
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
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
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            16.0,
                                                                            16.0,
                                                                            16.0),
                                                                    child:
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
                                                                        await Clipboard.setData(ClipboardData(
                                                                            text: valueOrDefault<String>(
                                                                          _model
                                                                              .viewDiagnosis
                                                                              ?.failureSymptom,
                                                                          'failure_symptom',
                                                                        )));

                                                                        safeSetState(
                                                                            () {});
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'copied...',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).success,
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                  child: Text(
                                                                                    'Problem:',
                                                                                    textAlign: TextAlign.end,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          fontSize: 20.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      _model.viewDiagnosis?.failureSymptom,
                                                                                      'failure_symptom',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 12.0)),
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
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
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
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            16.0,
                                                                            16.0,
                                                                            16.0),
                                                                    child:
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
                                                                        await Clipboard.setData(ClipboardData(
                                                                            text: valueOrDefault<String>(
                                                                          _model
                                                                              .viewDiagnosis
                                                                              ?.solutionRequest,
                                                                          'solution_request',
                                                                        )));
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'copied...',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 1450),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).success,
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                  child: Text(
                                                                                    'Solution Request:',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          fontSize: 20.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      _model.viewDiagnosis?.solutionRequest,
                                                                                      'solution_request',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 12.0)),
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
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
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
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                    child: Text(
                                                                                      'Helper Requested?',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        _model.viewDiagnosis?.helper?.toString(),
                                                                                        'FALSE',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            fontSize: 20.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        _model.viewDiagnosis?.estimateTimeToRepair?.toString(),
                                                                                        'FALSE',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            fontSize: 20.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 12.0)),
                                                                        ),
                                                                      ),
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
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                    child: Text(
                                                                                      'Estimate Time for Repair:',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        _model.viewDiagnosis?.helper?.toString(),
                                                                                        'FALSE',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            fontSize: 20.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        _model.viewDiagnosis?.estimateTimeToRepair?.toString(),
                                                                                        '1',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            fontSize: 20.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 12.0)),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .updateDiagnsosisTextController,
                                                                  focusNode: _model
                                                                      .updateDiagnsosisFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.updateDiagnsosisTextController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    () => safeSetState(
                                                                        () {}),
                                                                  ),
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintText:
                                                                        'Update Diagnosis!!!',
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
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
                                                                      .updateDiagnsosisTextControllerValidator
                                                                      .asValidator(
                                                                          context),
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
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed: (_model.updateDiagnsosisTextController.text == '')
                                                                            ? null
                                                                            : () async {
                                                                                await actions.n8nApiCallDiagnosisUpdateManager(
                                                                                  'https://webhook.wmappliances.cloud/webhook/updateDiagnosisManager',
                                                                                  valueOrDefault<String>(
                                                                                    _model.workOrderQuery?.workOrderId,
                                                                                    '003002121',
                                                                                  ),
                                                                                  valueOrDefault<String>(
                                                                                    _model.viewDiagnosis?.failureSymptom,
                                                                                    'failure_symptom',
                                                                                  ),
                                                                                  valueOrDefault<String>(
                                                                                    _model.viewDiagnosis?.solutionRequest,
                                                                                    'solution_request',
                                                                                  ),
                                                                                  _model.updateDiagnsosisTextController.text,
                                                                                  '',
                                                                                  FFAppState().diagnosisId,
                                                                                );
                                                                                safeSetState(() {
                                                                                  _model.updateDiagnsosisTextController?.clear();
                                                                                });

                                                                                safeSetState(() {});
                                                                              },
                                                                        text:
                                                                            'Update Diagnosis',
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
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
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
                                                  Expanded(
                                                    child: Material(
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
                                                              Text(
                                                                'Photos',
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
                                                                          FontWeight
                                                                              .bold,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 12.0),
                                                    child: Material(
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
                                                                      0.0,
                                                                      12.0,
                                                                      0.0,
                                                                      12.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final imagensDiagnosis = _model
                                                                      .viewDiagnosis
                                                                      ?.photoUrl
                                                                      .toList() ??
                                                                  [];

                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 240.0,
                                                                child:
                                                                    CarouselSlider
                                                                        .builder(
                                                                  itemCount:
                                                                      imagensDiagnosis
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          imagensDiagnosisIndex,
                                                                          _) {
                                                                    final imagensDiagnosisItem =
                                                                        imagensDiagnosis[
                                                                            imagensDiagnosisIndex];
                                                                    return InkWell(
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
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          PageTransition(
                                                                            type:
                                                                                PageTransitionType.fade,
                                                                            child:
                                                                                FlutterFlowExpandedImageView(
                                                                              image: Image.network(
                                                                                imagensDiagnosisItem,
                                                                                fit: BoxFit.contain,
                                                                              ),
                                                                              allowRotation: true,
                                                                              tag: imagensDiagnosisItem,
                                                                              useHeroAnimation: true,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                      onDoubleTap:
                                                                          () async {
                                                                        await downloadFile(
                                                                          filename:
                                                                              valueOrDefault<String>(
                                                                            imagensDiagnosisIndex.toString(),
                                                                            'WMAPPLIANCES',
                                                                          ),
                                                                          url: valueOrDefault<
                                                                              String>(
                                                                            imagensDiagnosisItem,
                                                                            'IMAGE',
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          Hero(
                                                                        tag:
                                                                            imagensDiagnosisItem,
                                                                        transitionOnUserGestures:
                                                                            true,
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            imagensDiagnosisItem,
                                                                            width:
                                                                                200.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  carouselController:
                                                                      _model.carouselController ??=
                                                                          CarouselSliderController(),
                                                                  options:
                                                                      CarouselOptions(
                                                                    initialPage: max(
                                                                        0,
                                                                        min(
                                                                            1,
                                                                            imagensDiagnosis.length -
                                                                                1)),
                                                                    viewportFraction:
                                                                        0.5,
                                                                    disableCenter:
                                                                        true,
                                                                    enlargeCenterPage:
                                                                        true,
                                                                    enlargeFactor:
                                                                        0.25,
                                                                    enableInfiniteScroll:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    autoPlay:
                                                                        false,
                                                                    onPageChanged: (index,
                                                                            _) =>
                                                                        _model.carouselCurrentIndex =
                                                                            index,
                                                                  ),
                                                                ),
                                                              );
                                                            },
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
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  24.0),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 1.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.5,
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
                                                                Text(
                                                                  'Part\'s Required',
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
                                                                    final partQueryFiltered =
                                                                        _model.partsMainQueryOnUpdate?.toList() ??
                                                                            [];

                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: List.generate(
                                                                          partQueryFiltered
                                                                              .length,
                                                                          (partQueryFilteredIndex) {
                                                                        final partQueryFilteredItem =
                                                                            partQueryFiltered[partQueryFilteredIndex];
                                                                        return Padding(
                                                                          padding:
                                                                              EdgeInsets.all(4.0),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(4.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                    ),
                                                                                    child: Stack(
                                                                                      children: [
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsets.all(12.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Container(
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    children: [
                                                                                                                      Align(
                                                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          valueOrDefault<String>(
                                                                                                                            partQueryFilteredItem.iten,
                                                                                                                            'Appliance',
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                                fontSize: 20.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      if (responsiveVisibility(
                                                                                                                        context: context,
                                                                                                                        phone: false,
                                                                                                                        tablet: false,
                                                                                                                        tabletLandscape: false,
                                                                                                                      ))
                                                                                                                        Align(
                                                                                                                          alignment: AlignmentDirectional(0.8, -0.89),
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                                            child: InkWell(
                                                                                                                              splashColor: Colors.transparent,
                                                                                                                              focusColor: Colors.transparent,
                                                                                                                              hoverColor: Colors.transparent,
                                                                                                                              highlightColor: Colors.transparent,
                                                                                                                              onTap: () async {
                                                                                                                                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                                                                                                              
                                                                                                                                await PartsTable().update(
                                                                                                                                  data: {
                                                                                                                                    'denied': false,
                                                                                                                                    'requested': false,
                                                                                                                                    'approved': false,
                                                                                                                                    'arrived': false,
                                                                                                                                  },
                                                                                                                                  matchingRows: (rows) => rows.eqOrNull(
                                                                                                                                    'part_id',
                                                                                                                                    valueOrDefault<String>(
                                                                                                                                      partQueryFilteredItem.partId,
                                                                                                                                      'part_id',
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                                await PartInsertionsTable().insert({
                                                                                                                                  'subtracted_part': 1,
                                                                                                                                  'subtracted_part_arrived': 1,
                                                                                                                                  'work_order_id': valueOrDefault<String>(
                                                                                                                                    partQueryFilteredItem.workOrderId,
                                                                                                                                    'workId',
                                                                                                                                  ),
                                                                                                                                });

                                                                                                                                safeSetState(() {});
                                                                                                                              },
                                                                                                                              child: Icon(
                                                                                                                                Icons.restore,
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                size: 30.0,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Expanded(
                                                                                                                child: Container(
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        child: Align(
                                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                          child: InkWell(
                                                                                                                            splashColor: Colors.transparent,
                                                                                                                            focusColor: Colors.transparent,
                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                            onTap: () async {
                                                                                                                              await Clipboard.setData(ClipboardData(
                                                                                                                                  text: valueOrDefault<String>(
                                                                                                                                partQueryFilteredItem.partNumber,
                                                                                                                                'None',
                                                                                                                              )));
                                                                                                                            },
                                                                                                                            child: Container(
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              ),
                                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsets.all(8.0),
                                                                                                                                child: Column(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                  children: [
                                                                                                                                    Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                                                                      child: InkWell(
                                                                                                                                        splashColor: Colors.transparent,
                                                                                                                                        focusColor: Colors.transparent,
                                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                                        onTap: () async {
                                                                                                                                          await Clipboard.setData(ClipboardData(
                                                                                                                                              text: valueOrDefault<String>(
                                                                                                                                            partQueryFilteredItem.partNumber,
                                                                                                                                            'part_number',
                                                                                                                                          )));
                                                                                                                                        },
                                                                                                                                        child: Text(
                                                                                                                                          'Part Number',
                                                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                fontSize: 20.0,
                                                                                                                                                letterSpacing: 0.0,
                                                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                                                                      child: Text(
                                                                                                                                        valueOrDefault<String>(
                                                                                                                                          partQueryFilteredItem.partNumber,
                                                                                                                                          'part_number',
                                                                                                                                        ),
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                              fontFamily: 'Manrope',
                                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                                              fontSize: 18.0,
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
                                                                                                                      Expanded(
                                                                                                                        child: InkWell(
                                                                                                                          splashColor: Colors.transparent,
                                                                                                                          focusColor: Colors.transparent,
                                                                                                                          hoverColor: Colors.transparent,
                                                                                                                          highlightColor: Colors.transparent,
                                                                                                                          onTap: () async {
                                                                                                                            await Clipboard.setData(ClipboardData(
                                                                                                                                text: valueOrDefault<String>(
                                                                                                                              partQueryFilteredItem.partName,
                                                                                                                              'None',
                                                                                                                            )));
                                                                                                                          },
                                                                                                                          child: Container(
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                            ),
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsets.all(8.0),
                                                                                                                              child: Column(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: [
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                                                                    child: InkWell(
                                                                                                                                      splashColor: Colors.transparent,
                                                                                                                                      focusColor: Colors.transparent,
                                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                                      onTap: () async {
                                                                                                                                        await Clipboard.setData(ClipboardData(
                                                                                                                                            text: valueOrDefault<String>(
                                                                                                                                          partQueryFilteredItem.partNumber,
                                                                                                                                          'part_number',
                                                                                                                                        )));
                                                                                                                                      },
                                                                                                                                      child: Text(
                                                                                                                                        'Part Name',
                                                                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                              fontFamily: 'Manrope',
                                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                              fontSize: 20.0,
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                              fontWeight: FontWeight.w600,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                                                                    child: Text(
                                                                                                                                      valueOrDefault<String>(
                                                                                                                                        partQueryFilteredItem.partName,
                                                                                                                                        'part_name',
                                                                                                                                      ),
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                            fontFamily: 'Manrope',
                                                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                                                            fontSize: 18.0,
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
                                                                                                                      Expanded(
                                                                                                                        child: Align(
                                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                          child: InkWell(
                                                                                                                            splashColor: Colors.transparent,
                                                                                                                            focusColor: Colors.transparent,
                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                            onTap: () async {
                                                                                                                              await Clipboard.setData(ClipboardData(
                                                                                                                                  text: valueOrDefault<String>(
                                                                                                                                partQueryFilteredItem.quantity?.toString(),
                                                                                                                                'None',
                                                                                                                              )));
                                                                                                                            },
                                                                                                                            child: Container(
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              ),
                                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsets.all(8.0),
                                                                                                                                child: Column(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                  children: [
                                                                                                                                    Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                                                                      child: InkWell(
                                                                                                                                        splashColor: Colors.transparent,
                                                                                                                                        focusColor: Colors.transparent,
                                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                                        onTap: () async {
                                                                                                                                          await Clipboard.setData(ClipboardData(
                                                                                                                                              text: valueOrDefault<String>(
                                                                                                                                            partQueryFilteredItem.partNumber,
                                                                                                                                            'part_number',
                                                                                                                                          )));
                                                                                                                                        },
                                                                                                                                        child: Text(
                                                                                                                                          'Quantity',
                                                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                fontSize: 20.0,
                                                                                                                                                letterSpacing: 0.0,
                                                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                                                                      child: Text(
                                                                                                                                        valueOrDefault<String>(
                                                                                                                                          partQueryFilteredItem.quantity?.toString(),
                                                                                                                                          'quantity',
                                                                                                                                        ),
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                              fontFamily: 'Manrope',
                                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                                              fontSize: 18.0,
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
                                                                                                                      if ((FFAppState().dispatch == 'dispatch') &&
                                                                                                                          responsiveVisibility(
                                                                                                                            context: context,
                                                                                                                            tablet: false,
                                                                                                                          ))
                                                                                                                        Expanded(
                                                                                                                          child: Container(
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                            ),
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsets.all(8.0),
                                                                                                                              child: Column(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: [
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                                                                    child: InkWell(
                                                                                                                                      splashColor: Colors.transparent,
                                                                                                                                      focusColor: Colors.transparent,
                                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                                      onTap: () async {
                                                                                                                                        await Clipboard.setData(ClipboardData(
                                                                                                                                            text: valueOrDefault<String>(
                                                                                                                                          partQueryFilteredItem.partNumber,
                                                                                                                                          'part_number',
                                                                                                                                        )));
                                                                                                                                      },
                                                                                                                                      child: Text(
                                                                                                                                        'Price',
                                                                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                              fontFamily: 'Manrope',
                                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                              fontSize: 20.0,
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                              fontWeight: FontWeight.w600,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                                                                    child: Text(
                                                                                                                                      valueOrDefault<String>(
                                                                                                                                        partQueryFilteredItem.partSoldPrice?.toString(),
                                                                                                                                        '0,00',
                                                                                                                                      ),
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                            fontFamily: 'Manrope',
                                                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                                                            fontSize: 18.0,
                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      if (FFAppState().dispatch == 'dispatch')
                                                                                                                        Expanded(
                                                                                                                          child: Align(
                                                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                            child: Container(
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              ),
                                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsets.all(8.0),
                                                                                                                                child: Column(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                  children: [
                                                                                                                                    Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                                                                      child: InkWell(
                                                                                                                                        splashColor: Colors.transparent,
                                                                                                                                        focusColor: Colors.transparent,
                                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                                        onTap: () async {
                                                                                                                                          await Clipboard.setData(ClipboardData(
                                                                                                                                              text: valueOrDefault<String>(
                                                                                                                                            partQueryFilteredItem.partNumber,
                                                                                                                                            'part_number',
                                                                                                                                          )));
                                                                                                                                        },
                                                                                                                                        child: Text(
                                                                                                                                          'Paid By',
                                                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                fontSize: 20.0,
                                                                                                                                                letterSpacing: 0.0,
                                                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                                                                      child: Text(
                                                                                                                                        valueOrDefault<String>(
                                                                                                                                          partQueryFilteredItem.partPaid,
                                                                                                                                          'AHS',
                                                                                                                                        ),
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                              fontFamily: 'Manrope',
                                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                                              fontSize: 16.0,
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
                                                                                                                    ].divide(SizedBox(width: 8.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                  children: [
                                                                                                                    Align(
                                                                                                                      alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        'Requested date #: ${valueOrDefault<String>(
                                                                                                                          dateTimeFormat("MMMEd", partQueryFilteredItem.createDate),
                                                                                                                          'part_name',
                                                                                                                        )}',
                                                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                              fontFamily: 'Manrope',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 16.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    if (partQueryFilteredItem.arrivedDate != null)
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                                                        child: Text(
                                                                                                                          'Arrived date #: ${valueOrDefault<String>(
                                                                                                                            dateTimeFormat("MMMEd", partQueryFilteredItem.arrivedDate),
                                                                                                                            'arrived date',
                                                                                                                          )}',
                                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 16.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    if (partQueryFilteredItem.partTaken != null && partQueryFilteredItem.partTaken != '')
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                                                        child: Text(
                                                                                                                          'Part Taken By #: ${valueOrDefault<String>(
                                                                                                                            partQueryFilteredItem.partTaken,
                                                                                                                            'part_taken',
                                                                                                                          )}',
                                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 16.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                              Expanded(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    children: [
                                                                                                                      Flexible(
                                                                                                                        child: Container(
                                                                                                                          decoration: BoxDecoration(
                                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                                          ),
                                                                                                                          child: LinearPercentIndicator(
                                                                                                                            percent: valueOrDefault<double>(
                                                                                                                              partQueryFilteredItem.progressBarValue,
                                                                                                                              0.0,
                                                                                                                            ),
                                                                                                                            lineHeight: 36.0,
                                                                                                                            animation: true,
                                                                                                                            animateFromLastPercent: true,
                                                                                                                            progressColor: colorFromCssString(
                                                                                                                              valueOrDefault<String>(
                                                                                                                                partQueryFilteredItem.progressColor,
                                                                                                                                '#0B67BC',
                                                                                                                              ),
                                                                                                                              defaultColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                            ),
                                                                                                                            backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                                                            center: Text(
                                                                                                                              valueOrDefault<String>(
                                                                                                                                partQueryFilteredItem.progressBarName,
                                                                                                                                'Not Started',
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                                    fontFamily: 'Outfit',
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            padding: EdgeInsets.zero,
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
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ].divide(SizedBox(height: 12.0)),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 16.0)),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  if (responsiveVisibility(
                                                                                    context: context,
                                                                                    phone: false,
                                                                                    tablet: false,
                                                                                    tabletLandscape: false,
                                                                                  ))
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 12.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              if (responsiveVisibility(
                                                                                                context: context,
                                                                                                phone: false,
                                                                                                tablet: false,
                                                                                                tabletLandscape: false,
                                                                                              ))
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
                                                                                                                  height: MediaQuery.sizeOf(context).height * 0.6,
                                                                                                                  child: PartCostUpdateWidget(
                                                                                                                    updatePricePart: partQueryFilteredItem,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      ).then((value) => safeSetState(() {}));

                                                                                                      safeSetState(() {});

                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    text: 'WM-Part',
                                                                                                    options: FFButtonOptions(
                                                                                                      width: 100.0,
                                                                                                      height: 36.0,
                                                                                                      padding: EdgeInsets.all(8.0),
                                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                      color: FlutterFlowTheme.of(context).accent1,
                                                                                                      textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                            fontFamily: 'Manrope',
                                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                      elevation: 0.0,
                                                                                                      borderRadius: BorderRadius.circular(18.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                            ].divide(SizedBox(width: 12.0)),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    await PartsTable().update(
                                                                                                      data: {
                                                                                                        'approved': true,
                                                                                                        'progress_bar_name': 'Approved',
                                                                                                        'progress_bar_value': 0.6,
                                                                                                        'progress_color': '#27AE52',
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eqOrNull(
                                                                                                        'part_id',
                                                                                                        valueOrDefault<String>(
                                                                                                          partQueryFilteredItem.partId,
                                                                                                          'part_id',
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                                      SnackBar(
                                                                                                        content: Text(
                                                                                                          'Part updated successfully',
                                                                                                          style: TextStyle(
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          ),
                                                                                                        ),
                                                                                                        duration: Duration(milliseconds: 4000),
                                                                                                        backgroundColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                      ),
                                                                                                    );
                                                                                                    await Future.delayed(const Duration(milliseconds: 5000));

                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                  text: 'Approve',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 100.0,
                                                                                                    height: 36.0,
                                                                                                    padding: EdgeInsets.all(8.0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: FlutterFlowTheme.of(context).success,
                                                                                                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: 'Manrope',
                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                    elevation: 0.0,
                                                                                                    borderRadius: BorderRadius.circular(18.0),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: (partQueryFilteredItem.denied == true)
                                                                                                      ? null
                                                                                                      : () async {
                                                                                                          await PartsTable().update(
                                                                                                            data: {
                                                                                                              'denied': true,
                                                                                                              'progress_bar_value': 1.0,
                                                                                                              'progress_bar_name': 'Denied',
                                                                                                              'progress_color': '#EE4444',
                                                                                                            },
                                                                                                            matchingRows: (rows) => rows.eqOrNull(
                                                                                                              'part_id',
                                                                                                              valueOrDefault<String>(
                                                                                                                partQueryFilteredItem.partId,
                                                                                                                'part_id',
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                                            SnackBar(
                                                                                                              content: Text(
                                                                                                                'Part updated successfully',
                                                                                                                style: TextStyle(
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                ),
                                                                                                              ),
                                                                                                              duration: Duration(milliseconds: 4000),
                                                                                                              backgroundColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                            ),
                                                                                                          );
                                                                                                          await Future.delayed(const Duration(milliseconds: 5000));

                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                  text: 'Denied',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 100.0,
                                                                                                    height: 36.0,
                                                                                                    padding: EdgeInsets.all(8.0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: 'Manrope',
                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                    elevation: 0.0,
                                                                                                    borderRadius: BorderRadius.circular(18.0),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              if (responsiveVisibility(
                                                                                                context: context,
                                                                                                phone: false,
                                                                                                tablet: false,
                                                                                                tabletLandscape: false,
                                                                                              ))
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                                    child: FFButtonWidget(
                                                                                                      onPressed: (partQueryFilteredItem.requested == true)
                                                                                                          ? null
                                                                                                          : () async {
                                                                                                              await PartsTable().update(
                                                                                                                data: {
                                                                                                                  'requested': true,
                                                                                                                  'progress_bar_name': 'Requested',
                                                                                                                  'progress_bar_value': 0.3,
                                                                                                                  'progress_color': '#FC964D',
                                                                                                                },
                                                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                                                  'part_id',
                                                                                                                  valueOrDefault<String>(
                                                                                                                    partQueryFilteredItem.partId,
                                                                                                                    'part_id',
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                              await PartInsertionsTable().insert({
                                                                                                                'inserted_part': 1,
                                                                                                                'work_order_id': valueOrDefault<String>(
                                                                                                                  partQueryFilteredItem.workOrderId,
                                                                                                                  'workId',
                                                                                                                ),
                                                                                                              });
                                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                SnackBar(
                                                                                                                  content: Text(
                                                                                                                    'Part updated successfully',
                                                                                                                    style: TextStyle(
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  duration: Duration(milliseconds: 4000),
                                                                                                                  backgroundColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                                ),
                                                                                                              );
                                                                                                              await Future.delayed(const Duration(milliseconds: 5000));

                                                                                                              safeSetState(() {});
                                                                                                            },
                                                                                                      text: 'Requested',
                                                                                                      options: FFButtonOptions(
                                                                                                        width: 100.0,
                                                                                                        height: 36.0,
                                                                                                        padding: EdgeInsets.all(8.0),
                                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        color: FlutterFlowTheme.of(context).warning,
                                                                                                        textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                              fontFamily: 'Manrope',
                                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                        elevation: 0.0,
                                                                                                        borderRadius: BorderRadius.circular(18.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              if (responsiveVisibility(
                                                                                                context: context,
                                                                                                phone: false,
                                                                                                tablet: false,
                                                                                                tabletLandscape: false,
                                                                                              ))
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                                    child: FFButtonWidget(
                                                                                                      onPressed: (partQueryFilteredItem.arrived == true)
                                                                                                          ? null
                                                                                                          : () async {
                                                                                                              await PartsTable().update(
                                                                                                                data: {
                                                                                                                  'arrived': true,
                                                                                                                  'arrived_date': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                                                                  'progress_bar_value': 1.0,
                                                                                                                  'progress_bar_name': 'Arrived',
                                                                                                                  'progress_color': '#ACC420',
                                                                                                                },
                                                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                                                  'part_id',
                                                                                                                  valueOrDefault<String>(
                                                                                                                    partQueryFilteredItem.partId,
                                                                                                                    'part_id',
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                              await PartInsertionsTable().insert({
                                                                                                                'inserted_part_arrived': 1,
                                                                                                                'work_order_id': valueOrDefault<String>(
                                                                                                                  partQueryFilteredItem.workOrderId,
                                                                                                                  'workId',
                                                                                                                ),
                                                                                                              });
                                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                SnackBar(
                                                                                                                  content: Text(
                                                                                                                    'Part updated successfully',
                                                                                                                    style: TextStyle(
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  duration: Duration(milliseconds: 4000),
                                                                                                                  backgroundColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                                ),
                                                                                                              );
                                                                                                              await Future.delayed(const Duration(milliseconds: 5000));

                                                                                                              safeSetState(() {});
                                                                                                            },
                                                                                                      text: 'Arrived',
                                                                                                      options: FFButtonOptions(
                                                                                                        width: 100.0,
                                                                                                        height: 36.0,
                                                                                                        padding: EdgeInsets.all(8.0),
                                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                              fontFamily: 'Manrope',
                                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                        elevation: 0.0,
                                                                                                        borderRadius: BorderRadius.circular(18.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                            ].divide(SizedBox(width: 12.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                ].divide(SizedBox(height: 16.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }).divide(SizedBox(
                                                                          height:
                                                                              8.0)),
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
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 1.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.5,
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
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          20.0,
                                                                          20.0,
                                                                          20.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        'Diagnosis Details',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              16.0,
                                                                              16.0,
                                                                              16.0),
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
                                                                              await Clipboard.setData(ClipboardData(
                                                                                  text: valueOrDefault<String>(
                                                                                _model.viewDiagnosis?.diagnosisTechinician,
                                                                                'ai_notes',
                                                                              )));
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    'copied...',
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                  ),
                                                                                  duration: Duration(milliseconds: 1450),
                                                                                  backgroundColor: FlutterFlowTheme.of(context).success,
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Technician Notes:',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            fontSize: 18.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          _model.viewDiagnosis?.diagnosisTechinician,
                                                                                          'No Diagnosis Added',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ].divide(SizedBox(height: 16.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              16.0,
                                                                              16.0,
                                                                              16.0),
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
                                                                              await Clipboard.setData(ClipboardData(
                                                                                  text: valueOrDefault<String>(
                                                                                _model.viewDiagnosis?.aiNotes,
                                                                                'ai_notes',
                                                                              )));
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    'copied...',
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                  ),
                                                                                  duration: Duration(milliseconds: 1450),
                                                                                  backgroundColor: FlutterFlowTheme.of(context).success,
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      'AI Notes:',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            fontSize: 18.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          _model.viewDiagnosis?.aiNotes,
                                                                                          'ai_notes',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ].divide(SizedBox(height: 16.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            16.0)),
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
                                                ].divide(
                                                    SizedBox(height: 24.0)),
                                              ),
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
                      if (responsiveVisibility(
                        context: context,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        wrapWithModel(
                          model: _model.navbarBottonModel,
                          updateCallback: () => safeSetState(() {}),
                          child: NavbarBottonWidget(),
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
