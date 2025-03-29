import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'select_role_page_model.dart';
export 'select_role_page_model.dart';

class SelectRolePageWidget extends StatefulWidget {
  const SelectRolePageWidget({
    super.key,
    required this.userSelectRole,
  });

  final UsersRow? userSelectRole;

  static String routeName = 'selectRolePage';
  static String routePath = '/selectRolePage';

  @override
  State<SelectRolePageWidget> createState() => _SelectRolePageWidgetState();
}

class _SelectRolePageWidgetState extends State<SelectRolePageWidget> {
  late SelectRolePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectRolePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'selectRolePage',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsets.all(48.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 24.0, 24.0, 24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Select User Role',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            'Choose one or more roles that best describe your position',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: SwitchListTile.adaptive(
                                      value: _model.technicianValue ??= false,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.technicianValue = newValue);
                                        if (newValue) {
                                          _model.technician = 'technician';
                                          safeSetState(() {});
                                        } else {
                                          _model.technician = 'user';
                                          safeSetState(() {});
                                        }
                                      },
                                      title: Text(
                                        'Technician',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Outfit',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).primary,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: SwitchListTile.adaptive(
                                      value: _model.dispatchValue ??= false,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.dispatchValue = newValue);
                                        if (newValue) {
                                          _model.dispatch = 'dispatch';
                                          safeSetState(() {});
                                        } else {
                                          _model.dispatch = 'user';
                                          safeSetState(() {});
                                        }
                                      },
                                      title: Text(
                                        'Dispatch',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Outfit',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).primary,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: SwitchListTile.adaptive(
                                      value: _model.managerValue ??= false,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.managerValue = newValue);
                                        if (newValue) {
                                          _model.manager = 'manager';
                                          safeSetState(() {});
                                        } else {
                                          _model.manager = 'user';
                                          safeSetState(() {});
                                        }
                                      },
                                      title: Text(
                                        'Manager',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Outfit',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).primary,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: SwitchListTile.adaptive(
                                      value: _model.officemanagerValue ??=
                                          false,
                                      onChanged: (newValue) async {
                                        safeSetState(() => _model
                                            .officemanagerValue = newValue);
                                        if (newValue) {
                                          _model.officeManager =
                                              'officemanager';
                                          safeSetState(() {});
                                        } else {
                                          _model.officeManager = 'user';
                                          safeSetState(() {});
                                        }
                                      },
                                      title: Text(
                                        'Office Manager',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Outfit',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).primary,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: SwitchListTile.adaptive(
                                      value: _model.officecomputerValue ??=
                                          false,
                                      onChanged: (newValue) async {
                                        safeSetState(() => _model
                                            .officecomputerValue = newValue);
                                        if (newValue) {
                                          _model.officeComputer = true;
                                          safeSetState(() {});
                                        } else {
                                          _model.officeComputer = false;
                                          safeSetState(() {});
                                        }
                                      },
                                      title: Text(
                                        'Office Computer',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Outfit',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).primary,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  await UsersTable().update(
                                    data: {
                                      'technician': valueOrDefault<String>(
                                        _model.technician,
                                        'user',
                                      ),
                                      'dispatch': valueOrDefault<String>(
                                        _model.dispatch,
                                        'user',
                                      ),
                                      'manager': valueOrDefault<String>(
                                        _model.manager,
                                        'user',
                                      ),
                                      'office_manager': valueOrDefault<String>(
                                        _model.officeManager,
                                        'user',
                                      ),
                                      'verified': true,
                                      'office_computer': _model.officeComputer,
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'user_id',
                                      valueOrDefault<String>(
                                        widget.userSelectRole?.userId,
                                        'userId',
                                      ),
                                    ),
                                  );

                                  safeSetState(() {});
                                  context.safePop();
                                },
                                text: 'Submit',
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 50.0,
                                  padding: EdgeInsets.all(8.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Manrope',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  context.safePop();
                                },
                                text: 'Cancel',
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 50.0,
                                  padding: EdgeInsets.all(8.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0x00FFFFFF),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Manrope',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ].divide(SizedBox(height: 24.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
