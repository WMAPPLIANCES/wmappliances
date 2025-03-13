import '';
import '/backend/supabase/supabase.dart';
import '/components/side_menu_view_widget.dart';
import '/delivery/tracking_detail/tracking_detail_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/nav_bar1/nav_bar1_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'delivery_parts_arrived_page_model.dart';
export 'delivery_parts_arrived_page_model.dart';

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
class DeliveryPartsArrivedPageWidget extends StatefulWidget {
  const DeliveryPartsArrivedPageWidget({super.key});

  static String routeName = 'deliveryPartsArrivedPage';
  static String routePath = '/deliveryPartsArrivedPage';

  @override
  State<DeliveryPartsArrivedPageWidget> createState() =>
      _DeliveryPartsArrivedPageWidgetState();
}

class _DeliveryPartsArrivedPageWidgetState
    extends State<DeliveryPartsArrivedPageWidget> {
  late DeliveryPartsArrivedPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeliveryPartsArrivedPageModel());

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

    return FutureBuilder<List<DeliveryRow>>(
      future: DeliveryTable().queryRows(
        queryFn: (q) => q
            .ilike(
              'tracking_number',
              '%${_model.textController.text}%',
            )
            .order('date'),
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
        List<DeliveryRow> deliveryPartsArrivedPageDeliveryRowList =
            snapshot.data!;

        return Title(
            title: 'deliveryPartsArrivedPage',
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
                                                            'Part Delivered',
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
                                                                EdgeInsets.all(
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
                                                                                            hintText: 'Search parts by name or number...',
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
                                                                                      FFAppState().dateTrackingArrive = _model.datePicked;
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
                                                                                            dateTimeFormat("yMd", FFAppState().dateTrackingArrive),
                                                                                            '3/6/2025',
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
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            if (_model.searchDate ==
                                                                                true)
                                                                              Expanded(
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    final dateSearch = deliveryPartsArrivedPageDeliveryRowList.where((e) => e.date! >= FFAppState().dateTrackingArrive!).toList();

                                                                                    return FlutterFlowDataTable<DeliveryRow>(
                                                                                      controller: _model.paginatedDataTableController1,
                                                                                      data: dateSearch,
                                                                                      columnsBuilder: (onSortChanged) => [
                                                                                        DataColumn2(
                                                                                          label: DefaultTextStyle.merge(
                                                                                            softWrap: true,
                                                                                            child: Text(
                                                                                              'Tracking Number',
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        DataColumn2(
                                                                                          label: DefaultTextStyle.merge(
                                                                                            softWrap: true,
                                                                                            child: Text(
                                                                                              'Date Arrived',
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        DataColumn2(
                                                                                          label: DefaultTextStyle.merge(
                                                                                            softWrap: true,
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(),
                                                                                              child: FFButtonWidget(
                                                                                                onPressed: () {
                                                                                                  print('Button pressed ...');
                                                                                                },
                                                                                                text: 'View Details',
                                                                                                options: FFButtonOptions(
                                                                                                  height: 40.0,
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: 'Manrope',
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                  elevation: 0.0,
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                      dataRowBuilder: (dateSearchItem, dateSearchIndex, selected, onSelectChanged) => DataRow(
                                                                                        color: WidgetStateProperty.all(
                                                                                          dateSearchIndex % 2 == 0 ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).primaryBackground,
                                                                                        ),
                                                                                        cells: [
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              dateSearchItem.trackingNumber,
                                                                                              'TrackingNumber',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                dateTimeFormat("yMMMd", dateSearchItem.date),
                                                                                                'Mar 6, 2025',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsets.all(4.0),
                                                                                                  child: FFButtonWidget(
                                                                                                    onPressed: () async {
                                                                                                      await showModalBottomSheet(
                                                                                                        isScrollControlled: true,
                                                                                                        backgroundColor: Colors.transparent,
                                                                                                        enableDrag: false,
                                                                                                        context: context,
                                                                                                        builder: (context) {
                                                                                                          return GestureDetector(
                                                                                                            onTap: () {
                                                                                                              FocusScope.of(context).unfocus();
                                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                                            },
                                                                                                            child: Padding(
                                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                                              child: Container(
                                                                                                                height: MediaQuery.sizeOf(context).height * 0.8,
                                                                                                                child: TrackingDetailWidget(
                                                                                                                  deliveryTraking: dateSearchItem,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      ).then((value) => safeSetState(() {}));
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
                                                                                                Padding(
                                                                                                  padding: EdgeInsets.all(4.0),
                                                                                                  child: FFButtonWidget(
                                                                                                    onPressed: () async {
                                                                                                      final selectedMedia = await selectMedia(
                                                                                                        storageFolderPath: 'image',
                                                                                                        maxWidth: 800.00,
                                                                                                        maxHeight: 800.00,
                                                                                                        multiImage: false,
                                                                                                      );
                                                                                                      if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                        safeSetState(() => _model.isDataUploading1 = true);
                                                                                                        var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                                        var downloadUrls = <String>[];
                                                                                                        try {
                                                                                                          selectedUploadedFiles = selectedMedia
                                                                                                              .map((m) => FFUploadedFile(
                                                                                                                    name: m.storagePath.split('/').last,
                                                                                                                    bytes: m.bytes,
                                                                                                                    height: m.dimensions?.height,
                                                                                                                    width: m.dimensions?.width,
                                                                                                                    blurHash: m.blurHash,
                                                                                                                  ))
                                                                                                              .toList();

                                                                                                          downloadUrls = await uploadSupabaseStorageFiles(
                                                                                                            bucketName: 'delivery',
                                                                                                            selectedFiles: selectedMedia,
                                                                                                          );
                                                                                                        } finally {
                                                                                                          _model.isDataUploading1 = false;
                                                                                                        }
                                                                                                        if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                                          safeSetState(() {
                                                                                                            _model.uploadedLocalFile1 = selectedUploadedFiles.first;
                                                                                                            _model.uploadedFileUrl1 = downloadUrls.first;
                                                                                                          });
                                                                                                        } else {
                                                                                                          safeSetState(() {});
                                                                                                          return;
                                                                                                        }
                                                                                                      }

                                                                                                      await DeliveryTable().update(
                                                                                                        data: {
                                                                                                          'part_receipt': _model.uploadedFileUrl1,
                                                                                                        },
                                                                                                        matchingRows: (rows) => rows.eqOrNull(
                                                                                                          'id',
                                                                                                          valueOrDefault<int>(
                                                                                                            dateSearchItem.id,
                                                                                                            12,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );

                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    text: 'Add Photo',
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
                                                                                          ),
                                                                                        ].map((c) => DataCell(c)).toList(),
                                                                                      ),
                                                                                      paginated: true,
                                                                                      selectable: false,
                                                                                      hidePaginator: false,
                                                                                      showFirstLastButtons: false,
                                                                                      headingRowHeight: 64.0,
                                                                                      dataRowHeight: 52.0,
                                                                                      columnSpacing: 10.0,
                                                                                      headingRowColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      addHorizontalDivider: true,
                                                                                      addTopAndBottomDivider: true,
                                                                                      hideDefaultHorizontalDivider: true,
                                                                                      horizontalDividerColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                      horizontalDividerThickness: 1.0,
                                                                                      addVerticalDivider: true,
                                                                                      verticalDividerColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                      verticalDividerThickness: 1.0,
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            Container(
                                                                              child: Visibility(
                                                                                visible: _model.searchDate == false,
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    final queryTracingNumber = deliveryPartsArrivedPageDeliveryRowList.toList();

                                                                                    return FlutterFlowDataTable<DeliveryRow>(
                                                                                      controller: _model.paginatedDataTableController2,
                                                                                      data: queryTracingNumber,
                                                                                      columnsBuilder: (onSortChanged) => [
                                                                                        DataColumn2(
                                                                                          label: DefaultTextStyle.merge(
                                                                                            softWrap: true,
                                                                                            child: Text(
                                                                                              'Tracking Number',
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        DataColumn2(
                                                                                          label: DefaultTextStyle.merge(
                                                                                            softWrap: true,
                                                                                            child: Text(
                                                                                              'Date Arrived',
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        DataColumn2(
                                                                                          label: DefaultTextStyle.merge(
                                                                                            softWrap: true,
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(),
                                                                                              child: FFButtonWidget(
                                                                                                onPressed: () {
                                                                                                  print('Button pressed ...');
                                                                                                },
                                                                                                text: 'View Details',
                                                                                                options: FFButtonOptions(
                                                                                                  height: 40.0,
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: 'Manrope',
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                  elevation: 0.0,
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                      dataRowBuilder: (queryTracingNumberItem, queryTracingNumberIndex, selected, onSelectChanged) => DataRow(
                                                                                        color: WidgetStateProperty.all(
                                                                                          queryTracingNumberIndex % 2 == 0 ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).primaryBackground,
                                                                                        ),
                                                                                        cells: [
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              queryTracingNumberItem.trackingNumber,
                                                                                              'TrackingNumber',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                dateTimeFormat("yMMMd", queryTracingNumberItem.date),
                                                                                                'Mar 6, 2025',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsets.all(4.0),
                                                                                                  child: FFButtonWidget(
                                                                                                    onPressed: () async {
                                                                                                      await showModalBottomSheet(
                                                                                                        isScrollControlled: true,
                                                                                                        backgroundColor: Colors.transparent,
                                                                                                        enableDrag: false,
                                                                                                        context: context,
                                                                                                        builder: (context) {
                                                                                                          return GestureDetector(
                                                                                                            onTap: () {
                                                                                                              FocusScope.of(context).unfocus();
                                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                                            },
                                                                                                            child: Padding(
                                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                                              child: Container(
                                                                                                                height: MediaQuery.sizeOf(context).height * 0.8,
                                                                                                                child: TrackingDetailWidget(
                                                                                                                  deliveryTraking: queryTracingNumberItem,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      ).then((value) => safeSetState(() {}));
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
                                                                                                Padding(
                                                                                                  padding: EdgeInsets.all(4.0),
                                                                                                  child: FFButtonWidget(
                                                                                                    onPressed: () async {
                                                                                                      final selectedMedia = await selectMedia(
                                                                                                        storageFolderPath: 'image',
                                                                                                        maxWidth: 800.00,
                                                                                                        maxHeight: 800.00,
                                                                                                        multiImage: false,
                                                                                                      );
                                                                                                      if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                        safeSetState(() => _model.isDataUploading2 = true);
                                                                                                        var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                                        var downloadUrls = <String>[];
                                                                                                        try {
                                                                                                          selectedUploadedFiles = selectedMedia
                                                                                                              .map((m) => FFUploadedFile(
                                                                                                                    name: m.storagePath.split('/').last,
                                                                                                                    bytes: m.bytes,
                                                                                                                    height: m.dimensions?.height,
                                                                                                                    width: m.dimensions?.width,
                                                                                                                    blurHash: m.blurHash,
                                                                                                                  ))
                                                                                                              .toList();

                                                                                                          downloadUrls = await uploadSupabaseStorageFiles(
                                                                                                            bucketName: 'delivery',
                                                                                                            selectedFiles: selectedMedia,
                                                                                                          );
                                                                                                        } finally {
                                                                                                          _model.isDataUploading2 = false;
                                                                                                        }
                                                                                                        if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                                          safeSetState(() {
                                                                                                            _model.uploadedLocalFile2 = selectedUploadedFiles.first;
                                                                                                            _model.uploadedFileUrl2 = downloadUrls.first;
                                                                                                          });
                                                                                                        } else {
                                                                                                          safeSetState(() {});
                                                                                                          return;
                                                                                                        }
                                                                                                      }

                                                                                                      await DeliveryTable().update(
                                                                                                        data: {
                                                                                                          'part_receipt': _model.uploadedFileUrl1,
                                                                                                        },
                                                                                                        matchingRows: (rows) => rows.eqOrNull(
                                                                                                          'id',
                                                                                                          valueOrDefault<int>(
                                                                                                            queryTracingNumberItem.id,
                                                                                                            1,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );

                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    text: 'Add Photo',
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
                                                                                          ),
                                                                                        ].map((c) => DataCell(c)).toList(),
                                                                                      ),
                                                                                      paginated: true,
                                                                                      selectable: false,
                                                                                      hidePaginator: false,
                                                                                      showFirstLastButtons: false,
                                                                                      headingRowHeight: 64.0,
                                                                                      dataRowHeight: 52.0,
                                                                                      columnSpacing: 10.0,
                                                                                      headingRowColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      addHorizontalDivider: true,
                                                                                      addTopAndBottomDivider: true,
                                                                                      hideDefaultHorizontalDivider: true,
                                                                                      horizontalDividerColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                      horizontalDividerThickness: 1.0,
                                                                                      addVerticalDivider: true,
                                                                                      verticalDividerColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                      verticalDividerThickness: 1.0,
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
