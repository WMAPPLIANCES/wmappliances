import '';
import '/backend/supabase/supabase.dart';
import '/components/side_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/nav_bar1/nav_bar1_widget.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'work_oder_search_model.dart';
export 'work_oder_search_model.dart';

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
class WorkOderSearchWidget extends StatefulWidget {
  const WorkOderSearchWidget({super.key});

  static String routeName = 'workOderSearch';
  static String routePath = '/workOderSearch';

  @override
  State<WorkOderSearchWidget> createState() => _WorkOderSearchWidgetState();
}

class _WorkOderSearchWidgetState extends State<WorkOderSearchWidget> {
  late WorkOderSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkOderSearchModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return FutureBuilder<List<WorkOrdersRow>>(
      future: WorkOrdersTable().queryRows(
        queryFn: (q) => q
            .or("work_order_id.ilike.${'%${_model.textController.text}%'}, customer_name.ilike.${'%${_model.textController.text}%'}, customer_phone.ilike.${'%${_model.textController.text}%'}, customer_email.ilike.${'%${_model.textController.text}%'}, address.ilike.${'%${_model.textController.text}%'}, next_appointment_status.ilike.${'%${_model.textController.text}%'}")
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
        List<WorkOrdersRow> workOderSearchWorkOrdersRowList = snapshot.data!;

        return Title(
            title: 'workOderSearch',
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
                body: Visibility(
                  visible: responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Stack(
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
                                        updateCallback: () =>
                                            safeSetState(() {}),
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
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                24.0,
                                                                24.0,
                                                                24.0,
                                                                0.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      primary: false,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Find Work Order',
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
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        36.0,
                                                                        16.0,
                                                                        16.0),
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
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
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          16.0,
                                                                          16.0),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    primary:
                                                                        false,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  borderRadius: BorderRadius.circular(30.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 0.0, 16.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.search,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: TextFormField(
                                                                                          controller: _model.textController,
                                                                                          focusNode: _model.textFieldFocusNode,
                                                                                          onChanged: (_) => EasyDebounce.debounce(
                                                                                            '_model.textController',
                                                                                            Duration(milliseconds: 100),
                                                                                            () => safeSetState(() {}),
                                                                                          ),
                                                                                          autofocus: false,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            hintText: 'Search Work Order by Name, Phone number, Work Order Id, Address or Email ...',
                                                                                            hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            enabledBorder: InputBorder.none,
                                                                                            focusedBorder: InputBorder.none,
                                                                                            errorBorder: InputBorder.none,
                                                                                            focusedErrorBorder: InputBorder.none,
                                                                                            suffixIcon: _model.textController!.text.isNotEmpty
                                                                                                ? InkWell(
                                                                                                    onTap: () async {
                                                                                                      _model.textController?.clear();
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    child: Icon(
                                                                                                      Icons.clear,
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      size: 22.0,
                                                                                                    ),
                                                                                                  )
                                                                                                : null,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Manrope',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          minLines: 1,
                                                                                          validator: _model.textControllerValidator.asValidator(context),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 12.0)),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 16.0)),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    'Select Date ',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          fontSize: 22.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      final _datePickedDate = await showDatePicker(
                                                                                        context: context,
                                                                                        initialDate: getCurrentTimestamp,
                                                                                        firstDate: DateTime(1900),
                                                                                        lastDate: DateTime(2050),
                                                                                        builder: (context, child) {
                                                                                          return wrapInMaterialDatePickerTheme(
                                                                                            context,
                                                                                            child!,
                                                                                            headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                            headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                            headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                                  fontFamily: 'Outfit',
                                                                                                  fontSize: 32.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                            pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                            selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                            selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                            actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                            iconSize: 24.0,
                                                                                          );
                                                                                        },
                                                                                      );

                                                                                      if (_datePickedDate != null) {
                                                                                        safeSetState(() {
                                                                                          _model.datePicked = DateTime(
                                                                                            _datePickedDate.year,
                                                                                            _datePickedDate.month,
                                                                                            _datePickedDate.day,
                                                                                          );
                                                                                        });
                                                                                      } else if (_model.datePicked != null) {
                                                                                        safeSetState(() {
                                                                                          _model.datePicked = getCurrentTimestamp;
                                                                                        });
                                                                                      }
                                                                                      FFAppState().workOderSearchDate = _model.datePicked;
                                                                                      safeSetState(() {});
                                                                                      _model.searchDate = true;
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Container(
                                                                                      width: 60.0,
                                                                                      height: 60.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 12.0, 0.0),
                                                                                        child: Icon(
                                                                                          Icons.calendar_month_rounded,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 48.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                if (_model.searchDate == true)
                                                                                  Container(
                                                                                    width: 200.0,
                                                                                    height: 50.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            dateTimeFormat("MMMEd", FFAppState().workOderSearchDate),
                                                                                            'Thu, Mar 6',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Manrope',
                                                                                                fontSize: 22.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  FFAppState().dateTrackingArrive = DateTime.fromMillisecondsSinceEpoch(1741225680000);
                                                                                  safeSetState(() {});
                                                                                  safeSetState(() {
                                                                                    _model.textController?.clear();
                                                                                  });
                                                                                  _model.searchDate = false;
                                                                                  safeSetState(() {});
                                                                                },
                                                                                text: 'Clear Filters',
                                                                                icon: Icon(
                                                                                  Icons.cleaning_services_outlined,
                                                                                  size: 15.0,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  height: 48.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Visibility(
                                                                            visible:
                                                                                _model.searchDate == true,
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                final searchWorkOrderDate = workOderSearchWorkOrdersRowList.where((e) => e.scheduledDate! >= FFAppState().workOderSearchDate!).toList();

                                                                                return FlutterFlowDataTable<WorkOrdersRow>(
                                                                                  controller: _model.paginatedDataTableController1,
                                                                                  data: searchWorkOrderDate,
                                                                                  columnsBuilder: (onSortChanged) => [
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Text(
                                                                                          'Work Order Id',
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                fontFamily: 'Manrope',
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                fontSize: 22.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            'Name',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  fontSize: 22.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  'Phone',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Manrope',
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 22.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            'Address',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  fontSize: 22.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            'Appointment',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  fontSize: 22.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            'Technician',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  fontSize: 22.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            'Job Status',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  fontSize: 22.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                  dataRowBuilder: (searchWorkOrderDateItem, searchWorkOrderDateIndex, selected, onSelectChanged) => DataRow(
                                                                                    color: WidgetStateProperty.all(
                                                                                      searchWorkOrderDateIndex % 2 == 0 ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                    cells: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                '${valueOrDefault<String>(
                                                                                                  searchWorkOrderDateItem.workOrderId,
                                                                                                  '003006069',
                                                                                                )} - ${valueOrDefault<String>(
                                                                                                  searchWorkOrderDateItem.typeService,
                                                                                                  'Normal',
                                                                                                )}',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      fontSize: 22.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  searchWorkOrderDateItem.customerName,
                                                                                                  'Willian Marciano',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      fontSize: 18.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Flexible(
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    searchWorkOrderDateItem.customerPhone,
                                                                                                    '+15103939900',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Manrope',
                                                                                                        fontSize: 18.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                '${valueOrDefault<String>(
                                                                                                  searchWorkOrderDateItem.address,
                                                                                                  '15178 Discovery St San Francisco 94575',
                                                                                                )}  ${valueOrDefault<String>(
                                                                                                  searchWorkOrderDateItem.apartmentNumber,
                                                                                                  '-',
                                                                                                )}',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      fontSize: 18.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                '${valueOrDefault<String>(
                                                                                                  dateTimeFormat("MMMEd", searchWorkOrderDateItem.scheduledDate),
                                                                                                  'Thu, 3/6',
                                                                                                )} ( ${valueOrDefault<String>(
                                                                                                  dateTimeFormat("Hm", searchWorkOrderDateItem.startTime?.time),
                                                                                                  '17:11',
                                                                                                )} To ${valueOrDefault<String>(
                                                                                                  dateTimeFormat("Hm", searchWorkOrderDateItem.endTime?.time),
                                                                                                  '17:11',
                                                                                                )} )',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      fontSize: 18.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    searchWorkOrderDateItem.technician,
                                                                                                    'Not Assign',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Manrope',
                                                                                                        fontSize: 18.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  searchWorkOrderDateItem.nextAppointmentStatus,
                                                                                                  'Not Assign',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      fontSize: 18.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            FlutterFlowIconButton(
                                                                                              borderRadius: 8.0,
                                                                                              buttonSize: 48.0,
                                                                                              fillColor: FlutterFlowTheme.of(context).secondary,
                                                                                              icon: Icon(
                                                                                                Icons.work_history,
                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                size: 26.0,
                                                                                              ),
                                                                                              onPressed: () async {
                                                                                                context.pushNamed(
                                                                                                  WorkOrderWidget.routeName,
                                                                                                  queryParameters: {
                                                                                                    'workOrderRow': serializeParam(
                                                                                                      searchWorkOrderDateItem,
                                                                                                      ParamType.SupabaseRow,
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
                                                                                              },
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ].map((c) => DataCell(c)).toList(),
                                                                                  ),
                                                                                  paginated: true,
                                                                                  selectable: false,
                                                                                  hidePaginator: false,
                                                                                  showFirstLastButtons: true,
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  headingRowHeight: 64.0,
                                                                                  dataRowHeight: 78.0,
                                                                                  columnSpacing: 2.0,
                                                                                  headingRowColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  addHorizontalDivider: true,
                                                                                  addTopAndBottomDivider: true,
                                                                                  hideDefaultHorizontalDivider: true,
                                                                                  horizontalDividerColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                  horizontalDividerThickness: 1.0,
                                                                                  addVerticalDivider: false,
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          child:
                                                                              Visibility(
                                                                            visible:
                                                                                _model.searchDate == false,
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                final workOrderSearch = workOderSearchWorkOrdersRowList.toList();

                                                                                return FlutterFlowDataTable<WorkOrdersRow>(
                                                                                  controller: _model.paginatedDataTableController2,
                                                                                  data: workOrderSearch,
                                                                                  columnsBuilder: (onSortChanged) => [
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Text(
                                                                                          'Work Order Id',
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                fontFamily: 'Manrope',
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                fontSize: 22.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            'Name',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  fontSize: 22.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  'Phone',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Manrope',
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 22.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            'Address',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  fontSize: 22.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            'Appointment',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  fontSize: 22.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            'Technician',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  fontSize: 22.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            'Job Status',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  fontSize: 22.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                  dataRowBuilder: (workOrderSearchItem, workOrderSearchIndex, selected, onSelectChanged) => DataRow(
                                                                                    color: WidgetStateProperty.all(
                                                                                      workOrderSearchIndex % 2 == 0 ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                    cells: [
                                                                                      Text(
                                                                                        '${valueOrDefault<String>(
                                                                                          workOrderSearchItem.workOrderId,
                                                                                          '003006069',
                                                                                        )} - ${valueOrDefault<String>(
                                                                                          workOrderSearchItem.typeService,
                                                                                          'Normal',
                                                                                        )}',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              fontSize: 22.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  workOrderSearchItem.customerName,
                                                                                                  'Willian Marciano',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      fontSize: 18.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Flexible(
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    workOrderSearchItem.customerPhone,
                                                                                                    '+15103939900',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Manrope',
                                                                                                        fontSize: 18.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                '${valueOrDefault<String>(
                                                                                                  workOrderSearchItem.address,
                                                                                                  '15178 Discovery St San Francisco 94575',
                                                                                                )}  ${valueOrDefault<String>(
                                                                                                  _model.paginatedDataTableController1.sortColumnIndex?.toString(),
                                                                                                  '-',
                                                                                                )}',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      fontSize: 18.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                '${valueOrDefault<String>(
                                                                                                  dateTimeFormat("MMMEd", workOrderSearchItem.scheduledDate),
                                                                                                  'Thu, 3/6',
                                                                                                )} ( ${valueOrDefault<String>(
                                                                                                  dateTimeFormat("Hm", workOrderSearchItem.startTime?.time),
                                                                                                  '17:00',
                                                                                                )} To ${valueOrDefault<String>(
                                                                                                  dateTimeFormat("Hm", workOrderSearchItem.endTime?.time),
                                                                                                  '17:10',
                                                                                                )} )',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      fontSize: 18.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  workOrderSearchItem.technician,
                                                                                                  'Not Assign',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      fontSize: 18.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
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
                                                                                          Flexible(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  workOrderSearchItem.nextAppointmentStatus,
                                                                                                  'Not Assign',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      fontSize: 18.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsets.all(4.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () async {
                                                                                                context.pushNamed(
                                                                                                  WorkOrderWidget.routeName,
                                                                                                  queryParameters: {
                                                                                                    'workOrderRow': serializeParam(
                                                                                                      workOrderSearchItem,
                                                                                                      ParamType.SupabaseRow,
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
                                                                                              },
                                                                                              text: 'View Details',
                                                                                              options: FFButtonOptions(
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ].map((c) => DataCell(c)).toList(),
                                                                                  ),
                                                                                  paginated: true,
                                                                                  selectable: false,
                                                                                  hidePaginator: false,
                                                                                  showFirstLastButtons: true,
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  headingRowHeight: 64.0,
                                                                                  dataRowHeight: 78.0,
                                                                                  columnSpacing: 2.0,
                                                                                  headingRowColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  addHorizontalDivider: true,
                                                                                  addTopAndBottomDivider: true,
                                                                                  hideDefaultHorizontalDivider: true,
                                                                                  horizontalDividerColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                  horizontalDividerThickness: 1.0,
                                                                                  addVerticalDivider: false,
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(),
                                                                        Container(),
                                                                      ].divide(SizedBox(
                                                                              height: 16.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 24.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 2.0)),
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
                        if (responsiveVisibility(
                          context: context,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          wrapWithModel(
                            model: _model.navBar1Model,
                            updateCallback: () => safeSetState(() {}),
                            child: NavBar1Widget(),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
