import '/appointment/pages/nav_bar1/nav_bar1_widget.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/stock_page/add_part_stock/add_part_stock_widget.dart';
import '/stock_page/add_part_stock_url_only/add_part_stock_url_only_widget.dart';
import '/stock_page/part_location_photo/part_location_photo_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'page_part_stock_mobile_model.dart';
export 'page_part_stock_mobile_model.dart';

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
class PagePartStockMobileWidget extends StatefulWidget {
  const PagePartStockMobileWidget({super.key});

  static String routeName = 'page_part_stock_mobile';
  static String routePath = '/page_part_stock_mobile';

  @override
  State<PagePartStockMobileWidget> createState() =>
      _PagePartStockMobileWidgetState();
}

class _PagePartStockMobileWidgetState extends State<PagePartStockMobileWidget> {
  late PagePartStockMobileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PagePartStockMobileModel());

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
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<StockPartsRow> pagePartStockMobileStockPartsRowList =
            snapshot.data!;

        return Title(
            title: 'page_part_stock_mobile',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                                                    Expanded(
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 2.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
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
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
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
                                                                    children: [
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                30.0,
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
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                30.0,
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
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                30.0,
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
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            12.0)),
                                                                  ),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            58.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final stockQueryList =
                                                                            pagePartStockMobileStockPartsRowList.toList();

                                                                        return FlutterFlowDataTable<
                                                                            StockPartsRow>(
                                                                          controller:
                                                                              _model.paginatedDataTableController,
                                                                          data:
                                                                              stockQueryList,
                                                                          columnsBuilder:
                                                                              (onSortChanged) => [
                                                                            DataColumn2(
                                                                              label: DefaultTextStyle.merge(
                                                                                softWrap: true,
                                                                                child: Text(
                                                                                  'Part Number Avalible Stock',
                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                        fontFamily: 'Manrope',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 18.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                          dataRowBuilder: (stockQueryListItem, stockQueryListIndex, selected, onSelectChanged) =>
                                                                              DataRow(
                                                                            color:
                                                                                WidgetStateProperty.all(
                                                                              stockQueryListIndex % 2 == 0 ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                            cells:
                                                                                [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 16.0, 8.0),
                                                                                        child: Container(
                                                                                          width: 80.0,
                                                                                          height: 80.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 8.0),
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
                                                                                                    width: 80.0,
                                                                                                    height: 120.0,
                                                                                                    fit: BoxFit.contain,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
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
                                                                            if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall) {
                                                                              return 480.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium) {
                                                                              return 1080.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointLarge) {
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
