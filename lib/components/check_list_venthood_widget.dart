import '';
import '/backend/supabase/supabase.dart';
import '/dashboards/voice_diagnosis/voice_diagnosis_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'check_list_venthood_model.dart';
export 'check_list_venthood_model.dart';

class CheckListVenthoodWidget extends StatefulWidget {
  const CheckListVenthoodWidget({
    super.key,
    required this.diagnosisCheckList,
  });

  final DiagnosesRow? diagnosisCheckList;

  @override
  State<CheckListVenthoodWidget> createState() =>
      _CheckListVenthoodWidgetState();
}

class _CheckListVenthoodWidgetState extends State<CheckListVenthoodWidget> {
  late CheckListVenthoodModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckListVenthoodModel());

    _model.switchValue1 = false;
    _model.switchValue2 = false;
    _model.switchValue3 = false;
    _model.switchValue4 = false;
    _model.switchValue5 = false;
    _model.switchValue6 = false;
    _model.switchValue7 = false;
    _model.switchValue8 = false;
    _model.switchValue9 = false;
    _model.switchValue10 = false;
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

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.kitchen_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 32.0,
                        ),
                        Flexible(
                          child: Text(
                            'Venthood Checklist',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.view1 = !_model.view1;
                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '1. Electrical supply is correct',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: valueOrDefault<Color>(
                                              _model.color1,
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                              if (_model.view1 == false)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Text(
                                            '(hood has power, breaker or wall switch is on).',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Switch(
                                        value: _model.switchValue1!,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.switchValue1 = newValue);
                                          if (newValue) {
                                            _model.view1 = true;
                                            _model.checkView = true;
                                            _model.color1 =
                                                FlutterFlowTheme.of(context)
                                                    .tertiary;
                                            safeSetState(() {});
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.view2 = !_model.view2;
                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        '2. Controls operate properly ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Manrope',
                                              color: valueOrDefault<Color>(
                                                _model.color2,
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                              if (_model.view2 == false)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Text(
                                            '(fan speed switches and light switches respond correctly).',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Switch(
                                        value: _model.switchValue2!,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.switchValue2 = newValue);
                                          if (newValue) {
                                            _model.view2 = true;
                                            _model.checkView = true;
                                            _model.color2 =
                                                FlutterFlowTheme.of(context)
                                                    .tertiary;
                                            safeSetState(() {});
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.view3 = !_model.view3;
                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '3. Fan motor runs at all speeds',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: valueOrDefault<Color>(
                                              _model.color3,
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                              if (_model.view3 == false)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Text(
                                            '(fan turns on low and high settings with steady operation).',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Switch(
                                        value: _model.switchValue3!,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.switchValue3 = newValue);
                                          if (newValue) {
                                            _model.checkView = true;
                                            _model.view3 = true;
                                            _model.color3 =
                                                FlutterFlowTheme.of(context)
                                                    .tertiary;
                                            safeSetState(() {});

                                            safeSetState(() {});
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.view4 = !_model.view4;
                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '4. Airflow is strong and clear',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: valueOrDefault<Color>(
                                              _model.color4,
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                              if (_model.view4 == false)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Text(
                                            '(hood pulls air; exhaust outlet has proper flow outside).',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Switch(
                                        value: _model.switchValue4!,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.switchValue4 = newValue);
                                          if (newValue) {
                                            _model.checkView = true;
                                            _model.view4 = true;
                                            _model.color4 =
                                                FlutterFlowTheme.of(context)
                                                    .tertiary;
                                            safeSetState(() {});
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.view5 = !_model.view5;
                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '5. Filters are clean',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: valueOrDefault<Color>(
                                              _model.color5,
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                              if (_model.view5 == false)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Text(
                                            '(grease filters or charcoal filters are not clogged).',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Switch(
                                        value: _model.switchValue5!,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.switchValue5 = newValue);
                                          if (newValue) {
                                            _model.checkView = true;
                                            _model.view5 = true;
                                            _model.color5 =
                                                FlutterFlowTheme.of(context)
                                                    .tertiary;
                                            safeSetState(() {});
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.view6 = !_model.view6;
                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '6. Ductwork is clear',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: _model.color6,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                              if (_model.view6 == false)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Text(
                                            '(exhaust duct to outside is free of blockages).',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Switch(
                                        value: _model.switchValue6!,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.switchValue6 = newValue);
                                          if (newValue) {
                                            _model.checkView = true;
                                            _model.view6 = true;
                                            _model.color6 =
                                                FlutterFlowTheme.of(context)
                                                    .tertiary;
                                            safeSetState(() {});
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.view7 = !_model.view7;
                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '7. Damper (flap) opens fully ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: _model.color7,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                              if (_model.view7 == false)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Text(
                                            '(vent damper opens when fan is on, not stuck closed).',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Switch(
                                        value: _model.switchValue7!,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.switchValue7 = newValue);
                                          if (newValue) {
                                            _model.checkView = true;
                                            _model.view7 = true;
                                            _model.color7 =
                                                FlutterFlowTheme.of(context)
                                                    .tertiary;
                                            safeSetState(() {});
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.view8 = !_model.view8;
                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '8. Lights function',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: _model.color8,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                              if (_model.view8 == false)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Text(
                                            '(hood light bulbs turn on and off as expected).',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Switch(
                                        value: _model.switchValue8!,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.switchValue8 = newValue);
                                          if (newValue) {
                                            _model.checkView = true;
                                            _model.view8 = true;
                                            _model.color8 =
                                                FlutterFlowTheme.of(context)
                                                    .tertiary;
                                            safeSetState(() {});
                                            FFAppState().checkView1 = true;
                                            safeSetState(() {});
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.view9 = !_model.view9;
                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '9. No excessive noise or vibration',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: _model.color9,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                              if (_model.view9 == false)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Text(
                                            '(fan operates smoothly without loud rattling).',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Switch(
                                        value: _model.switchValue9!,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.switchValue9 = newValue);
                                          if (newValue) {
                                            _model.checkView = true;
                                            _model.view9 = true;
                                            _model.color9 =
                                                FlutterFlowTheme.of(context)
                                                    .tertiary;
                                            safeSetState(() {});
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.view10 = !_model.view10;
                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '10. Unit is securely mounted',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: _model.color10,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                              if (_model.view10 == false)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Text(
                                            ' (hood is firmly attached, no loose parts during operation).',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Switch(
                                        value: _model.switchValue10!,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.switchValue10 = newValue);
                                          if (newValue) {
                                            _model.checkView = true;
                                            _model.view10 = true;
                                            _model.color10 =
                                                FlutterFlowTheme.of(context)
                                                    .tertiary;
                                            _model.checkView2 = true;
                                            safeSetState(() {});
                                            FFAppState().checkView2 = true;
                                            safeSetState(() {});
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Container(),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Container(),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Container(),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: FFButtonWidget(
                          onPressed: ((FFAppState().checkView1 == false) &&
                                  (FFAppState().checkView2 == false))
                              ? null
                              : () async {
                                  await DiagnosesTable().update(
                                    data: {
                                      'check_list': true,
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'diagnosis_id',
                                      valueOrDefault<String>(
                                        widget.diagnosisCheckList?.diagnosisId,
                                        '02302',
                                      ),
                                    ),
                                  );
                                  Navigator.pop(context);
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          child: VoiceDiagnosisWidget(
                                            diagnosisVoice:
                                                widget.diagnosisCheckList!,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                          text: 'Submit Checklist',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 56.0,
                            padding: EdgeInsets.all(8.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
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
                            borderRadius: BorderRadius.circular(28.0),
                            disabledColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            disabledTextColor:
                                FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Container(),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Container(),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                        ),
                      ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              child: Container(),
            ),
          ].divide(SizedBox(height: 24.0)),
        ),
      ),
    );
  }
}
