import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/stock_page/qr_code_scaned/qr_code_scaned_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'part_location_photo_model.dart';
export 'part_location_photo_model.dart';

class PartLocationPhotoWidget extends StatefulWidget {
  const PartLocationPhotoWidget({super.key});

  @override
  State<PartLocationPhotoWidget> createState() =>
      _PartLocationPhotoWidgetState();
}

class _PartLocationPhotoWidgetState extends State<PartLocationPhotoWidget> {
  late PartLocationPhotoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PartLocationPhotoModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (_model.scanQrToStart == false)
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 240.0, 0.0, 12.0),
                    child: Text(
                      'Scan QR Code To Start',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              if (_model.scanQrToStart == false)
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      FFAppState().qrCodeStockParts = 'Scan QR Code';
                      safeSetState(() {});
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: QrCodeScanedWidget(),
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));

                      _model.scanQrToStart = true;
                      safeSetState(() {});
                    },
                    child: Icon(
                      Icons.qr_code_scanner_sharp,
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 120.0,
                    ),
                  ),
                ),
              if (_model.scanQrToStart == false)
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Text(
                      'Tap to Scan',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              if (_model.scanQrToStart == true)
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
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
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Part Stock',
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Stack(
                              children: [
                                if (_model.uploadedFileUrl != '')
                                  Container(
                                    width: double.infinity,
                                    height: 200.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x0A000000),
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        _model.uploadedFileUrl,
                                        width: 200.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                if (_model.uploadedFileUrl == '')
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.imagePhoto =
                                          _model.uploadedFileUrl;
                                      safeSetState(() {});
                                      final selectedMedia = await selectMedia(
                                        storageFolderPath: 'workOrderImages',
                                        maxWidth: 800.00,
                                        maxHeight: 800.00,
                                        multiImage: false,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        safeSetState(() =>
                                            _model.isDataUploading = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();

                                          downloadUrls =
                                              await uploadSupabaseStorageFiles(
                                            bucketName: 'photos',
                                            selectedFiles: selectedMedia,
                                          );
                                        } finally {
                                          _model.isDataUploading = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedMedia.length &&
                                            downloadUrls.length ==
                                                selectedMedia.length) {
                                          safeSetState(() {
                                            _model.uploadedLocalFile =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl =
                                                downloadUrls.first;
                                          });
                                        } else {
                                          safeSetState(() {});
                                          return;
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 200.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x0A000000),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Icon(
                                                Icons.camera_alt_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 48.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Text(
                                                'Take a Photo of the Part\'s Shelf Location.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 12.0,
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
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 4.0),
                                child: Text(
                                  'Stock Id',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 8.0),
                                child: Text(
                                  FFAppState().qrCodeStockParts,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 8.0, 8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Select Shelf Color',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: (_model
                                                              .colorString ==
                                                          '#ec0421f1')
                                                      ? null
                                                      : () async {
                                                          if (_model
                                                                  .colorSelected ==
                                                              null) {
                                                            _model.colorSelected =
                                                                Color(
                                                                    0xEC0421F1);
                                                            safeSetState(() {});
                                                            _model.colorString =
                                                                '#ec0421f1';
                                                            safeSetState(() {});
                                                          } else {
                                                            _model.colorSelectShelf2 =
                                                                Color(
                                                                    0xEC0421F1);
                                                            safeSetState(() {});
                                                            _model.colorSelectShelf2String =
                                                                '#ec0421f1';
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                  text: '',
                                                  options: FFButtonOptions(
                                                    width: 48.0,
                                                    height: 48.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xEC0421F1),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                    disabledColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: (_model
                                                              .colorString ==
                                                          '#ee4444')
                                                      ? null
                                                      : () async {
                                                          if (_model
                                                                  .colorSelected ==
                                                              null) {
                                                            _model.colorSelected =
                                                                Color(
                                                                    0xFFEE4444);
                                                            safeSetState(() {});
                                                            _model.colorString =
                                                                '#ee4444';
                                                            safeSetState(() {});
                                                          } else {
                                                            _model.colorSelectShelf2 =
                                                                Color(
                                                                    0xFFEE4444);
                                                            safeSetState(() {});
                                                            _model.colorSelectShelf2String =
                                                                '#ee4444';
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                  text: '',
                                                  options: FFButtonOptions(
                                                    width: 48.0,
                                                    height: 48.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFFEE4444),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                    disabledColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: (_model
                                                              .colorString ==
                                                          '#099FFD')
                                                      ? null
                                                      : () async {
                                                          if (_model
                                                                  .colorSelected ==
                                                              null) {
                                                            _model.colorSelected =
                                                                Color(
                                                                    0xFF099FFD);
                                                            safeSetState(() {});
                                                            _model.colorString =
                                                                '#099ffd';
                                                            safeSetState(() {});
                                                          } else {
                                                            _model.colorSelectShelf2 =
                                                                Color(
                                                                    0xFF099FFD);
                                                            safeSetState(() {});
                                                            _model.colorSelectShelf2String =
                                                                '#099ffd';
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                  text: '',
                                                  options: FFButtonOptions(
                                                    width: 48.0,
                                                    height: 48.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFF099FFD),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                    disabledColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: (_model
                                                              .colorString ==
                                                          '#F0F855')
                                                      ? null
                                                      : () async {
                                                          if (_model
                                                                  .colorSelected ==
                                                              null) {
                                                            _model.colorSelected =
                                                                Color(
                                                                    0xFFF0F855);
                                                            safeSetState(() {});
                                                            _model.colorString =
                                                                '#f0f855';
                                                            safeSetState(() {});
                                                          } else {
                                                            _model.colorSelectShelf2 =
                                                                Color(
                                                                    0xFFF0F855);
                                                            safeSetState(() {});
                                                            _model.colorSelectShelf2String =
                                                                '#f0f855';
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                  text: '',
                                                  options: FFButtonOptions(
                                                    width: 48.0,
                                                    height: 48.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFFF0F855),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                    disabledColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: (_model
                                                              .colorString ==
                                                          '#A6290140')
                                                      ? null
                                                      : () async {
                                                          if (_model
                                                                  .colorSelected ==
                                                              null) {
                                                            _model.colorSelected =
                                                                Color(
                                                                    0xA6290140);
                                                            safeSetState(() {});
                                                            _model.colorString =
                                                                '#a6290140';
                                                            safeSetState(() {});
                                                          } else {
                                                            _model.colorSelectShelf2 =
                                                                Color(
                                                                    0xA6290140);
                                                            safeSetState(() {});
                                                            _model.colorSelectShelf2String =
                                                                '#a6290140';
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                  text: '',
                                                  options: FFButtonOptions(
                                                    width: 48.0,
                                                    height: 48.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xA6290140),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                    disabledColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 16.0)),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: (_model
                                                            .colorString ==
                                                        '#27ae52')
                                                    ? null
                                                    : () async {
                                                        if (_model
                                                                .colorSelected ==
                                                            null) {
                                                          _model.colorSelected =
                                                              Color(0xFF50F384);
                                                          safeSetState(() {});
                                                          _model.colorString =
                                                              '#50f384';
                                                          safeSetState(() {});
                                                        } else {
                                                          _model.colorSelectShelf2 =
                                                              Color(0xFF50F384);
                                                          safeSetState(() {});
                                                          _model.colorSelectShelf2String =
                                                              '#50f384';
                                                          safeSetState(() {});
                                                        }
                                                      },
                                                text: '',
                                                options: FFButtonOptions(
                                                  width: 48.0,
                                                  height: 48.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFF50F384),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color: Colors.white,
                                                        fontSize: 1.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  disabledColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                              ),
                                              FFButtonWidget(
                                                onPressed: (_model
                                                            .colorString ==
                                                        '#fd7e14')
                                                    ? null
                                                    : () async {
                                                        if (_model
                                                                .colorSelected ==
                                                            null) {
                                                          _model.colorSelected =
                                                              Color(0xFFFD7E14);
                                                          safeSetState(() {});
                                                          _model.colorString =
                                                              '#fd7e14';
                                                          safeSetState(() {});
                                                        } else {
                                                          _model.colorSelectShelf2 =
                                                              Color(0xFFFD7E14);
                                                          safeSetState(() {});
                                                          _model.colorSelectShelf2String =
                                                              '#fd7e14';
                                                          safeSetState(() {});
                                                        }
                                                      },
                                                text: '',
                                                options: FFButtonOptions(
                                                  width: 48.0,
                                                  height: 48.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFFD7E14),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  disabledColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                              ),
                                              FFButtonWidget(
                                                onPressed: (_model
                                                            .colorString ==
                                                        '#f5f5dc')
                                                    ? null
                                                    : () async {
                                                        if (_model
                                                                .colorSelected ==
                                                            null) {
                                                          _model.colorSelected =
                                                              Color(0xFF0D752E);
                                                          safeSetState(() {});
                                                          _model.colorString =
                                                              '#0d752e';
                                                          safeSetState(() {});
                                                        } else {
                                                          _model.colorSelectShelf2 =
                                                              Color(0xFF0D752E);
                                                          safeSetState(() {});
                                                          _model.colorSelectShelf2String =
                                                              '#0d752e';
                                                          safeSetState(() {});
                                                        }
                                                      },
                                                text: '',
                                                options: FFButtonOptions(
                                                  width: 48.0,
                                                  height: 48.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFF0D752E),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  disabledColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                              ),
                                              FFButtonWidget(
                                                onPressed: (_model
                                                            .colorString ==
                                                        '#F307C7')
                                                    ? null
                                                    : () async {
                                                        if (_model
                                                                .colorSelected ==
                                                            null) {
                                                          _model.colorSelected =
                                                              Color(0xFFF307C7);
                                                          safeSetState(() {});
                                                          _model.colorString =
                                                              '#f307c7';
                                                          safeSetState(() {});
                                                        } else {
                                                          _model.colorSelectShelf2 =
                                                              Color(0xFFF307C7);
                                                          safeSetState(() {});
                                                          _model.colorSelectShelf2String =
                                                              '#f307c7';
                                                          safeSetState(() {});
                                                        }
                                                      },
                                                text: '',
                                                options: FFButtonOptions(
                                                  width: 48.0,
                                                  height: 48.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFF307C7),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  disabledColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                              ),
                                              FFButtonWidget(
                                                onPressed: (_model
                                                            .colorString ==
                                                        '#000000')
                                                    ? null
                                                    : () async {
                                                        if (_model
                                                                .colorSelected ==
                                                            null) {
                                                          _model.colorSelected =
                                                              Colors.black;
                                                          safeSetState(() {});
                                                          _model.colorString =
                                                              '#000000';
                                                          safeSetState(() {});
                                                        } else {
                                                          _model.colorSelectShelf2 =
                                                              Colors.black;
                                                          safeSetState(() {});
                                                          _model.colorSelectShelf2String =
                                                              '#000000';
                                                          safeSetState(() {});
                                                        }
                                                      },
                                                text: '',
                                                options: FFButtonOptions(
                                                  width: 48.0,
                                                  height: 48.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Colors.black,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  disabledColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                        ].divide(SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      if (_model.colorSelected != null)
                                        FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          fillColor: _model.colorSelected,
                                          icon: Icon(
                                            Icons.shelves,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      if (_model.colorSelectShelf2 != null)
                                        FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          fillColor: _model.colorSelectShelf2,
                                          icon: Icon(
                                            Icons.shelves,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                    ].divide(SizedBox(width: 4.0)),
                                  ),
                                ),
                                if (_model.colorSelected != null)
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        borderRadius: 8.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.clear,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          _model.colorSelected = null;
                                          safeSetState(() {});
                                          _model.colorSelectShelf2 = null;
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 8.0, 8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      autofocus: false,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Enter part location...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Manrope',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                      minLines: 1,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: (FFAppState().qrCodeStockParts == '')
                                  ? null
                                  : () async {
                                      await StockPartsTable().update(
                                        data: {
                                          'image_part': _model.uploadedFileUrl,
                                          'color': _model.colorString,
                                          'part_location':
                                              _model.textController.text,
                                          'create_by': FFAppState().userName,
                                          'color2':
                                              _model.colorSelectShelf2String,
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'stock_id',
                                          FFAppState().qrCodeStockParts,
                                        ),
                                      );
                                      Navigator.pop(context);
                                      FFAppState().qrCodeStockParts =
                                          'Scan QR Code';
                                      safeSetState(() {});
                                    },
                              text: 'Submit',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: EdgeInsets.all(8.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                                disabledColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                disabledTextColor:
                                    FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
