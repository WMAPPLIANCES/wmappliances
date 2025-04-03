import '/appointment/pages/nav_bar1/nav_bar1_widget.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/side_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/stock_page/add_part_stock/add_part_stock_widget.dart';
import '/stock_page/add_part_stock_url_only/add_part_stock_url_only_widget.dart';
import '/stock_page/edit_part_in_stock/edit_part_in_stock_widget.dart';
import '/stock_page/part_location_photo/part_location_photo_widget.dart';
import '/stock_page/print_stock_parts/print_stock_parts_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'page_part_stock_model.dart';
export 'page_part_stock_model.dart';

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
class PagePartStockWidget extends StatefulWidget {
  const PagePartStockWidget({super.key});

  static String routeName = 'page_part_stock';
  static String routePath = '/page_part_stock';

  @override
  State<PagePartStockWidget> createState() => _PagePartStockWidgetState();
}

class _PagePartStockWidgetState extends State<PagePartStockWidget> {
  late PagePartStockModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PagePartStockModel());

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

    return FutureBuilder<List<StockPartsRow>>(
      future: StockPartsTable().queryRows(
        queryFn: (q) => q
            .or("part_name.ilike.${'%${_model.textController.text}%'}, part_number.ilike.${'%${_model.textController.text}%'}, compatible_model_number.ilike.${'%${_model.textController.text}%'}, details.ilike.${'%${_model.textController.text}%'}")
            .order('created_at'),
        limit: 100,
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
        List<StockPartsRow> pagePartStockStockPartsRowList = snapshot.data!;

        return Title(
            title: 'page_part_stock',
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
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 24.0, 24.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Part In Stock',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      phone: false,
                                                      tablet: false,
                                                    ))
                                                      Expanded(
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
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
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
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(30.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                16.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                Row(
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
                                                                                      Duration(milliseconds: 200),
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
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            16.0)),
                                                                  ),
                                                                  if ((FFAppState().userRole == 'admin') &&
                                                                      (FFAppState()
                                                                              .userRole ==
                                                                          'dispatch') &&
                                                                      (FFAppState()
                                                                              .userRole ==
                                                                          'office_manager'))
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children:
                                                                          [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              FlutterFlowIconButton(
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            borderRadius:
                                                                                25.0,
                                                                            buttonSize:
                                                                                50.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.link,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 30.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
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
                                                                                          child: AddPartStockUrlOnlyWidget(),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() {}));
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              FlutterFlowIconButton(
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            borderRadius:
                                                                                25.0,
                                                                            buttonSize:
                                                                                50.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.qr_code_scanner_rounded,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 30.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
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
                                                                                          child: PartLocationPhotoWidget(),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() {}));
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              FlutterFlowIconButton(
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            borderRadius:
                                                                                25.0,
                                                                            buttonSize:
                                                                                50.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.add,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 30.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
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
                                                                                          child: AddPartStockWidget(),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() {}));
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 12.0)),
                                                                    ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          58.0),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final stockQueryList =
                                                                              pagePartStockStockPartsRowList.toList();

                                                                          return FlutterFlowDataTable<
                                                                              StockPartsRow>(
                                                                            controller:
                                                                                _model.paginatedDataTableController,
                                                                            data:
                                                                                stockQueryList,
                                                                            columnsBuilder: (onSortChanged) =>
                                                                                [
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    'Part Number',
                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          fontSize: 20.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    'Part Name',
                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          fontSize: 20.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Visibility(
                                                                                    visible: responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                      tablet: false,
                                                                                    ),
                                                                                    child: Text(
                                                                                      'Replaces',
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            fontSize: 20.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Visibility(
                                                                                    visible: responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                      tablet: false,
                                                                                    ),
                                                                                    child: Text(
                                                                                      'Compatible Model',
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            fontSize: 20.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Visibility(
                                                                                    visible: responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                      tablet: false,
                                                                                    ),
                                                                                    child: Text(
                                                                                      'Stock Location',
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            fontSize: 20.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Visibility(
                                                                                    visible: responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                      tablet: false,
                                                                                    ),
                                                                                    child: Text(
                                                                                      'Price',
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            fontSize: 20.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                            dataRowBuilder: (stockQueryListItem, stockQueryListIndex, selected, onSelectChanged) =>
                                                                                DataRow(
                                                                              color: WidgetStateProperty.all(
                                                                                stockQueryListIndex % 2 == 0 ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).primaryBackground,
                                                                              ),
                                                                              cells: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      children: [
                                                                                        if (responsiveVisibility(
                                                                                          context: context,
                                                                                          phone: false,
                                                                                          tablet: false,
                                                                                        ))
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  await Navigator.push(
                                                                                                    context,
                                                                                                    PageTransition(
                                                                                                      type: PageTransitionType.fade,
                                                                                                      child: FlutterFlowExpandedImageView(
                                                                                                        image: Image.network(
                                                                                                          valueOrDefault<String>(
                                                                                                            stockQueryListItem.imagePart,
                                                                                                            'https://api.wmappliances.cloud/storage/v1/object/public/photos/users/LOGO%20WM%20APPLIANCE%20NOVA%20casa%20alta%20reso.png',
                                                                                                          ),
                                                                                                          fit: BoxFit.contain,
                                                                                                        ),
                                                                                                        allowRotation: false,
                                                                                                        tag: valueOrDefault<String>(
                                                                                                          stockQueryListItem.imagePart,
                                                                                                          'https://api.wmappliances.cloud/storage/v1/object/public/photos/users/LOGO%20WM%20APPLIANCE%20NOVA%20casa%20alta%20reso.png' + '$stockQueryListIndex',
                                                                                                        ),
                                                                                                        useHeroAnimation: true,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                                onDoubleTap: () async {
                                                                                                  final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                                                    context: context,
                                                                                                    storageFolderPath: 'photoStockPart',
                                                                                                    maxWidth: 800.00,
                                                                                                    maxHeight: 800.00,
                                                                                                    allowPhoto: true,
                                                                                                  );
                                                                                                  if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                    safeSetState(() => _model.isDataUploading = true);
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
                                                                                                        bucketName: 'photos',
                                                                                                        selectedFiles: selectedMedia,
                                                                                                      );
                                                                                                    } finally {
                                                                                                      _model.isDataUploading = false;
                                                                                                    }
                                                                                                    if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                                      safeSetState(() {
                                                                                                        _model.uploadedLocalFile = selectedUploadedFiles.first;
                                                                                                        _model.uploadedFileUrl = downloadUrls.first;
                                                                                                      });
                                                                                                    } else {
                                                                                                      safeSetState(() {});
                                                                                                      return;
                                                                                                    }
                                                                                                  }

                                                                                                  await StockPartsTable().update(
                                                                                                    data: {
                                                                                                      'image_part': _model.uploadedFileUrl,
                                                                                                    },
                                                                                                    matchingRows: (rows) => rows.eqOrNull(
                                                                                                      'stock_id',
                                                                                                      valueOrDefault<String>(
                                                                                                        stockQueryListItem.stockId,
                                                                                                        '0212',
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                  await Future.delayed(const Duration(milliseconds: 3000));

                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                                child: Hero(
                                                                                                  tag: valueOrDefault<String>(
                                                                                                    stockQueryListItem.imagePart,
                                                                                                    'https://api.wmappliances.cloud/storage/v1/object/public/photos/users/LOGO%20WM%20APPLIANCE%20NOVA%20casa%20alta%20reso.png' + '$stockQueryListIndex',
                                                                                                  ),
                                                                                                  transitionOnUserGestures: true,
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    child: Image.network(
                                                                                                      valueOrDefault<String>(
                                                                                                        stockQueryListItem.imagePart,
                                                                                                        'https://api.wmappliances.cloud/storage/v1/object/public/photos/users/LOGO%20WM%20APPLIANCE%20NOVA%20casa%20alta%20reso.png',
                                                                                                      ),
                                                                                                      width: 120.0,
                                                                                                      height: 200.0,
                                                                                                      fit: BoxFit.contain,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                stockQueryListItem.partNumber,
                                                                                                'None',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    fontSize: 18.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          stockQueryListItem.partName,
                                                                                          'None',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                SingleChildScrollView(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                          ))
                                                                                            Expanded(
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  stockQueryListItem.details,
                                                                                                  'None',
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
                                                                                ),
                                                                                SingleChildScrollView(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                          ))
                                                                                            Expanded(
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  stockQueryListItem.compatibleModelNumber,
                                                                                                  'None',
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
                                                                                ),
                                                                                Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Visibility(
                                                                                    visible: responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                      tablet: false,
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            if (stockQueryListItem.color2 != null && stockQueryListItem.color2 != '')
                                                                                              FlutterFlowIconButton(
                                                                                                borderRadius: 8.0,
                                                                                                buttonSize: 40.0,
                                                                                                fillColor: colorFromCssString(
                                                                                                  valueOrDefault<String>(
                                                                                                    stockQueryListItem.color2,
                                                                                                    '#',
                                                                                                  ),
                                                                                                  defaultColor: Colors.black,
                                                                                                ),
                                                                                                icon: Icon(
                                                                                                  Icons.shelves,
                                                                                                  color: Color(0xFFD4D1D1),
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                onPressed: () {
                                                                                                  print('IconButton pressed ...');
                                                                                                },
                                                                                              ),
                                                                                            if (stockQueryListItem.color != null && stockQueryListItem.color != '')
                                                                                              FlutterFlowIconButton(
                                                                                                borderRadius: 8.0,
                                                                                                buttonSize: 40.0,
                                                                                                fillColor: colorFromCssString(
                                                                                                  valueOrDefault<String>(
                                                                                                    stockQueryListItem.color,
                                                                                                    '#',
                                                                                                  ),
                                                                                                  defaultColor: Colors.black,
                                                                                                ),
                                                                                                icon: Icon(
                                                                                                  Icons.shelves,
                                                                                                  color: Color(0xFFD4D1D1),
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                onPressed: () {
                                                                                                  print('IconButton pressed ...');
                                                                                                },
                                                                                              ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                          child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              stockQueryListItem.partLocation,
                                                                                              'none',
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
                                                                                Visibility(
                                                                                  visible: ((FFAppState().userRole == 'admin') && (FFAppState().userRole == 'dispatch') && (FFAppState().userRole == 'office_manager')) &&
                                                                                      responsiveVisibility(
                                                                                        context: context,
                                                                                        phone: false,
                                                                                        tablet: false,
                                                                                      ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          '\$ ${valueOrDefault<String>(
                                                                                            stockQueryListItem.partPrice?.toString(),
                                                                                            '0.00',
                                                                                          )}',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Manrope',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          child: FlutterFlowIconButton(
                                                                                            borderRadius: 8.0,
                                                                                            buttonSize: 48.0,
                                                                                            fillColor: FlutterFlowTheme.of(context).tertiary,
                                                                                            icon: Icon(
                                                                                              Icons.edit_note,
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
                                                                                                          child: EditPartInStockWidget(
                                                                                                            editStock: stockQueryListItem,
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
                                                                                            fillColor: FlutterFlowTheme.of(context).error,
                                                                                            icon: FaIcon(
                                                                                              FontAwesomeIcons.trash,
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                            onPressed: () async {
                                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                                    context: context,
                                                                                                    builder: (alertDialogContext) {
                                                                                                      return WebViewAware(
                                                                                                        child: AlertDialog(
                                                                                                          title: Text('Delete Part Number?'),
                                                                                                          content: Text('Are you sure you want to delete this Part Number? This action cannot be undone.'),
                                                                                                          actions: [
                                                                                                            TextButton(
                                                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                              child: Text('🔙 Cancel'),
                                                                                                            ),
                                                                                                            TextButton(
                                                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                              child: Text('🗑️ Confirm'),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ) ??
                                                                                                  false;
                                                                                              if (confirmDialogResponse) {
                                                                                                await StockPartsTable().delete(
                                                                                                  matchingRows: (rows) => rows.eqOrNull(
                                                                                                    'stock_id',
                                                                                                    valueOrDefault<String>(
                                                                                                      stockQueryListItem.stockId,
                                                                                                      '01',
                                                                                                    ),
                                                                                                  ),
                                                                                                );

                                                                                                safeSetState(() {});
                                                                                              } else {
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      '❌ Cancel',
                                                                                                      style: TextStyle(
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: Duration(milliseconds: 1050),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          child: FlutterFlowIconButton(
                                                                                            borderRadius: 8.0,
                                                                                            buttonSize: 48.0,
                                                                                            fillColor: FlutterFlowTheme.of(context).secondary,
                                                                                            icon: Icon(
                                                                                              Icons.print,
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
                                                                                                          child: PrintStockPartsWidget(
                                                                                                            printTockPartsParam: stockQueryListItem,
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
                                                                                            fillColor: FlutterFlowTheme.of(context).warning,
                                                                                            icon: Icon(
                                                                                              Icons.content_copy,
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                            onPressed: () async {
                                                                                              await StockPartsTable().insert({
                                                                                                'image_part': stockQueryListItem.imagePart,
                                                                                                'part_number': valueOrDefault<String>(
                                                                                                  stockQueryListItem.partNumber,
                                                                                                  'part_number',
                                                                                                ),
                                                                                                'part_name': valueOrDefault<String>(
                                                                                                  stockQueryListItem.partName,
                                                                                                  'Name',
                                                                                                ),
                                                                                                'quantity_in_stock': 1,
                                                                                                'part_price': valueOrDefault<double>(
                                                                                                  stockQueryListItem.partPrice,
                                                                                                  0.00,
                                                                                                ),
                                                                                                'compatible_model_number': valueOrDefault<String>(
                                                                                                  stockQueryListItem.compatibleModelNumber,
                                                                                                  'models',
                                                                                                ),
                                                                                                'iten': valueOrDefault<String>(
                                                                                                  stockQueryListItem.iten,
                                                                                                  'Appliance',
                                                                                                ),
                                                                                                'part_url': valueOrDefault<String>(
                                                                                                  stockQueryListItem.partUrl,
                                                                                                  'url',
                                                                                                ),
                                                                                                'user_uuid': currentUserUid,
                                                                                                'details': valueOrDefault<String>(
                                                                                                  stockQueryListItem.details,
                                                                                                  'Detail',
                                                                                                ),
                                                                                              });
                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                SnackBar(
                                                                                                  content: Text(
                                                                                                    'Part Successfully Duplicated',
                                                                                                    style: TextStyle(
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    ),
                                                                                                  ),
                                                                                                  duration: Duration(milliseconds: 4000),
                                                                                                  backgroundColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                ),
                                                                                              );

                                                                                              safeSetState(() {});
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 4.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].map((c) => DataCell(c)).toList(),
                                                                            ),
                                                                            paginated:
                                                                                true,
                                                                            selectable:
                                                                                false,
                                                                            hidePaginator:
                                                                                false,
                                                                            showFirstLastButtons:
                                                                                true,
                                                                            minWidth:
                                                                                () {
                                                                              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                return 480.0;
                                                                              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                return 1080.0;
                                                                              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                return 1080.0;
                                                                              } else {
                                                                                return 1080.0;
                                                                              }
                                                                            }(),
                                                                            headingRowHeight:
                                                                                56.0,
                                                                            dataRowHeight:
                                                                                120.0,
                                                                            columnSpacing:
                                                                                6.0,
                                                                            headingRowColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            addHorizontalDivider:
                                                                                true,
                                                                            addTopAndBottomDivider:
                                                                                false,
                                                                            hideDefaultHorizontalDivider:
                                                                                true,
                                                                            horizontalDividerColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            horizontalDividerThickness:
                                                                                1.0,
                                                                            addVerticalDivider:
                                                                                false,
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
                                                  ].divide(
                                                      SizedBox(height: 24.0)),
                                                ),
                                              ),
                                            ],
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
            ));
      },
    );
  }
}
