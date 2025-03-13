import '';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'side_menu_view_model.dart';
export 'side_menu_view_model.dart';

class SideMenuViewWidget extends StatefulWidget {
  const SideMenuViewWidget({super.key});

  @override
  State<SideMenuViewWidget> createState() => _SideMenuViewWidgetState();
}

class _SideMenuViewWidgetState extends State<SideMenuViewWidget> {
  late SideMenuViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideMenuViewModel());

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

    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
      ),
      child: MouseRegion(
        opaque: false,
        cursor: MouseCursor.defer ?? MouseCursor.defer,
        child: Container(
          width: valueOrDefault<double>(
            _model.menuSize,
            74.0,
          ),
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(valueOrDefault<double>(
                    _model.paddingLayout,
                    0.0,
                  )),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onLongPress: () async {
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth(
                                LoguinWidget.routeName, context.mounted);
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _model.menuLohoHovered
                                  ? FlutterFlowTheme.of(context).alternate
                                  : Color(0x00000000),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    _model.paddingItem,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    _model.paddingItem / 2,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    _model.paddingItem,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    _model.paddingItem / 2,
                                    0.0,
                                  )),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: _model.logoSize,
                                    height: 32.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        'https://api.wmappliances.cloud/storage/v1/object/public/photos/users/LOGO%20WM%20APPLIANCE%20NOVA%20casa%20alta%20reso.png',
                                        width: 200.0,
                                        height: 200.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'WM APPLIANCES',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Manrope',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(width: _model.paddingItem)),
                              ),
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(() => _model.menuLohoHovered = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(() => _model.menuLohoHovered = false);
                        }),
                      ),
                      Divider(
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              DashboardDispatchWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _model.itenHoverHovered1
                                  ? FlutterFlowTheme.of(context).alternate
                                  : Color(0x00000000),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    _model.paddingItem,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    _model.paddingItem / 2,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    _model.paddingItem,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    _model.paddingItem / 2,
                                    0.0,
                                  )),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.dashboard,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Dashboard',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Manrope',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(width: _model.paddingItem)),
                              ),
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(() => _model.itenHoverHovered1 = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(() => _model.itenHoverHovered1 = false);
                        }),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: _model.itenHoverHovered2
                                ? FlutterFlowTheme.of(context).alternate
                                : Color(0x00000000),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                valueOrDefault<double>(
                                  _model.paddingItem,
                                  0.0,
                                ),
                                valueOrDefault<double>(
                                  _model.paddingItem / 2,
                                  0.0,
                                ),
                                valueOrDefault<double>(
                                  _model.paddingItem,
                                  0.0,
                                ),
                                valueOrDefault<double>(
                                  _model.paddingItem / 2,
                                  0.0,
                                )),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Appointment',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Manrope',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(width: _model.paddingItem)),
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(() => _model.itenHoverHovered2 = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(() => _model.itenHoverHovered2 = false);
                        }),
                      ),
                      Divider(
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              WorkOderSearchWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _model.itenHoverHovered3
                                  ? FlutterFlowTheme.of(context).alternate
                                  : Color(0x00000000),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    _model.paddingItem,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    _model.paddingItem / 2,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    _model.paddingItem,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    _model.paddingItem / 2,
                                    0.0,
                                  )),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.shopping_bag_outlined,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Work Order',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Manrope',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(width: _model.paddingItem)),
                              ),
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(() => _model.itenHoverHovered3 = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(() => _model.itenHoverHovered3 = false);
                        }),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context
                                .pushNamed(WorkOrderWorkFlowWidget.routeName);
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _model.itenHoverHovered4
                                  ? FlutterFlowTheme.of(context).alternate
                                  : Color(0x00000000),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    _model.paddingItem,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    _model.paddingItem / 2,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    _model.paddingItem,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    _model.paddingItem / 2,
                                    0.0,
                                  )),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.send_outlined,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Dispatch',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Manrope',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(width: _model.paddingItem)),
                              ),
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(() => _model.itenHoverHovered4 = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(() => _model.itenHoverHovered4 = false);
                        }),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context
                                .pushNamed(WorkOrderWorkFlowWidget.routeName);
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _model.itenHoverHovered5
                                  ? FlutterFlowTheme.of(context).alternate
                                  : Color(0x00000000),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    _model.paddingItem,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    _model.paddingItem / 2,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    _model.paddingItem,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    _model.paddingItem / 2,
                                    0.0,
                                  )),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.tasks,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Work Manager',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Manrope',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(width: _model.paddingItem)),
                              ),
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(() => _model.itenHoverHovered5 = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(() => _model.itenHoverHovered5 = false);
                        }),
                      ),
                      if ((FFAppState().userRole == 'admin') ||
                          (FFAppState().userRole == 'office_manager') ||
                          (FFAppState().userRole == 'manager'))
                        MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                PagePartStockWidget.routeName,
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
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: _model.itenHoverHovered6
                                    ? FlutterFlowTheme.of(context).alternate
                                    : Color(0x00000000),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    valueOrDefault<double>(
                                      _model.paddingItem,
                                      0.0,
                                    ),
                                    valueOrDefault<double>(
                                      _model.paddingItem / 2,
                                      0.0,
                                    ),
                                    valueOrDefault<double>(
                                      _model.paddingItem,
                                      0.0,
                                    ),
                                    valueOrDefault<double>(
                                      _model.paddingItem / 2,
                                      0.0,
                                    )),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.shelves,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Stock',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: _model.paddingItem)),
                                ),
                              ),
                            ),
                          ),
                          onEnter: ((event) async {
                            safeSetState(() => _model.itenHoverHovered6 = true);
                          }),
                          onExit: ((event) async {
                            safeSetState(
                                () => _model.itenHoverHovered6 = false);
                          }),
                        ),
                      if ((FFAppState().userRole == 'admin') ||
                          (FFAppState().userRole == 'office_manager') ||
                          (FFAppState().userRole == 'manager'))
                        MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                DeliveryPartsArrivedPageWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: _model.itenHoverHovered7
                                    ? FlutterFlowTheme.of(context).alternate
                                    : Color(0x00000000),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    valueOrDefault<double>(
                                      _model.paddingItem,
                                      0.0,
                                    ),
                                    valueOrDefault<double>(
                                      _model.paddingItem / 2,
                                      0.0,
                                    ),
                                    valueOrDefault<double>(
                                      _model.paddingItem,
                                      0.0,
                                    ),
                                    valueOrDefault<double>(
                                      _model.paddingItem / 2,
                                      0.0,
                                    )),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.warehouse_sharp,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            DeliveryPartsArrivedPageWidget
                                                .routeName,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Delivery',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: _model.paddingItem)),
                                ),
                              ),
                            ),
                          ),
                          onEnter: ((event) async {
                            safeSetState(() => _model.itenHoverHovered7 = true);
                          }),
                          onExit: ((event) async {
                            safeSetState(
                                () => _model.itenHoverHovered7 = false);
                          }),
                        ),
                      Divider(
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              QrPageOfficeWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _model.itenHoverHovered8
                                  ? FlutterFlowTheme.of(context).alternate
                                  : Color(0x00000000),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    _model.paddingItem,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    _model.paddingItem / 2,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    _model.paddingItem,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    _model.paddingItem / 2,
                                    0.0,
                                  )),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.auto_awesome,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Chat AI',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Manrope',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(width: _model.paddingItem)),
                              ),
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(() => _model.itenHoverHovered8 = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(() => _model.itenHoverHovered8 = false);
                        }),
                      ),
                      Divider(
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: FutureBuilder<List<TicketsRow>>(
                          future: TicketsTable().queryRows(
                            queryFn: (q) => q.eqOrNull(
                              'status',
                              'New',
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
                            List<TicketsRow> containerTicketsRowList =
                                snapshot.data!;

                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  TicketListWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: _model.itenHoverHovered9
                                      ? FlutterFlowTheme.of(context).alternate
                                      : Color(0x00000000),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      valueOrDefault<double>(
                                        _model.paddingItem,
                                        0.0,
                                      ),
                                      valueOrDefault<double>(
                                        _model.paddingItem / 2,
                                        0.0,
                                      ),
                                      valueOrDefault<double>(
                                        _model.paddingItem,
                                        0.0,
                                      ),
                                      valueOrDefault<double>(
                                        _model.paddingItem / 2,
                                        0.0,
                                      )),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      if (!(containerTicketsRowList.isNotEmpty))
                                        Icon(
                                          Icons.support_agent,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      if (containerTicketsRowList.isNotEmpty)
                                        Icon(
                                          Icons.support_agent,
                                          color: FlutterFlowTheme.of(context)
                                              .success,
                                          size: 24.0,
                                        ),
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Ticket',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(
                                        SizedBox(width: _model.paddingItem)),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        onEnter: ((event) async {
                          safeSetState(() => _model.itenHoverHovered9 = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(() => _model.itenHoverHovered9 = false);
                        }),
                      ),
                      Divider(
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      if (FFAppState().officeComputer == false)
                        MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                ProfileWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: _model.itenHoverHovered10
                                    ? FlutterFlowTheme.of(context).alternate
                                    : Color(0x00000000),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    valueOrDefault<double>(
                                      _model.paddingItem,
                                      0.0,
                                    ),
                                    valueOrDefault<double>(
                                      _model.paddingItem / 2,
                                      0.0,
                                    ),
                                    valueOrDefault<double>(
                                      _model.paddingItem,
                                      0.0,
                                    ),
                                    valueOrDefault<double>(
                                      _model.paddingItem / 2,
                                      0.0,
                                    )),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Profile',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: _model.paddingItem)),
                                ),
                              ),
                            ),
                          ),
                          onEnter: ((event) async {
                            safeSetState(
                                () => _model.itenHoverHovered10 = true);
                          }),
                          onExit: ((event) async {
                            safeSetState(
                                () => _model.itenHoverHovered10 = false);
                          }),
                        ),
                      Stack(
                        children: [
                          MouseRegion(
                            opaque: false,
                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                            child: Visibility(
                              visible: FFAppState().userRole == 'admin',
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    AssignUserWidget.routeName,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: _model.newUserHovered
                                        ? FlutterFlowTheme.of(context).alternate
                                        : Color(0x00000000),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        valueOrDefault<double>(
                                          _model.paddingItem,
                                          0.0,
                                        ),
                                        valueOrDefault<double>(
                                          _model.paddingItem / 2,
                                          0.0,
                                        ),
                                        valueOrDefault<double>(
                                          _model.paddingItem,
                                          0.0,
                                        ),
                                        valueOrDefault<double>(
                                          _model.paddingItem / 2,
                                          0.0,
                                        )),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.person_add,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          size: 24.0,
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Team',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(
                                          SizedBox(width: _model.paddingItem)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onEnter: ((event) async {
                              safeSetState(() => _model.newUserHovered = true);
                            }),
                            onExit: ((event) async {
                              safeSetState(() => _model.newUserHovered = false);
                            }),
                          ),
                          if ((FFAppState().userRole == 'admin') &&
                              (_model.newUser.isNotEmpty))
                            MouseRegion(
                              opaque: false,
                              cursor: MouseCursor.defer ?? MouseCursor.defer,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    AssignUserWidget.routeName,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: _model.itenHoverHovered11
                                        ? FlutterFlowTheme.of(context).alternate
                                        : Color(0x00000000),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        valueOrDefault<double>(
                                          _model.paddingItem,
                                          0.0,
                                        ),
                                        valueOrDefault<double>(
                                          _model.paddingItem / 2,
                                          0.0,
                                        ),
                                        valueOrDefault<double>(
                                          _model.paddingItem,
                                          0.0,
                                        ),
                                        valueOrDefault<double>(
                                          _model.paddingItem / 2,
                                          0.0,
                                        )),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.person_add,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Team',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(
                                          SizedBox(width: _model.paddingItem)),
                                    ),
                                  ),
                                ),
                              ),
                              onEnter: ((event) async {
                                safeSetState(
                                    () => _model.itenHoverHovered11 = true);
                              }),
                              onExit: ((event) async {
                                safeSetState(
                                    () => _model.itenHoverHovered11 = false);
                              }),
                            ),
                        ],
                      ),
                      Divider(
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      if (FFAppState().officeComputer == true)
                        MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().deleteUserPhoto();
                              FFAppState().userPhoto = '';

                              FFAppState().deleteUserName();
                              FFAppState().userName = '';

                              FFAppState().deleteUserRole();
                              FFAppState().userRole = '';

                              FFAppState().deleteUserPhone();
                              FFAppState().userPhone = '';

                              FFAppState().deleteUserEmail();
                              FFAppState().userEmail = '';

                              FFAppState().manager = 'user';
                              FFAppState().technician = 'user';
                              FFAppState().deleteDispatch();
                              FFAppState().dispatch = 'user';

                              FFAppState().officeManager = 'user';
                              safeSetState(() {});

                              context.pushNamed(
                                QrPageOfficeWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: _model.logOutHovered
                                    ? FlutterFlowTheme.of(context).alternate
                                    : Color(0x00000000),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    valueOrDefault<double>(
                                      _model.paddingItem,
                                      0.0,
                                    ),
                                    valueOrDefault<double>(
                                      _model.paddingItem / 2,
                                      0.0,
                                    ),
                                    valueOrDefault<double>(
                                      _model.paddingItem,
                                      0.0,
                                    ),
                                    valueOrDefault<double>(
                                      _model.paddingItem / 2,
                                      0.0,
                                    )),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.computer,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().deleteUserPhoto();
                                          FFAppState().userPhoto = '';

                                          FFAppState().deleteUserName();
                                          FFAppState().userName = '';

                                          FFAppState().deleteUserRole();
                                          FFAppState().userRole = '';

                                          FFAppState().deleteUserPhone();
                                          FFAppState().userPhone = '';

                                          FFAppState().deleteUserEmail();
                                          FFAppState().userEmail = '';

                                          FFAppState().manager = 'user';
                                          FFAppState().technician = 'user';
                                          FFAppState().deleteDispatch();
                                          FFAppState().dispatch = 'user';

                                          FFAppState().officeManager = 'user';
                                          safeSetState(() {});

                                          context.pushNamed(
                                            QrPageOfficeWidget.routeName,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Logout',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: _model.paddingItem)),
                                ),
                              ),
                            ),
                          ),
                          onEnter: ((event) async {
                            safeSetState(() => _model.logOutHovered = true);
                          }),
                          onExit: ((event) async {
                            safeSetState(() => _model.logOutHovered = false);
                          }),
                        ),
                      if ((Theme.of(context).brightness == Brightness.dark) ==
                          true)
                        MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setDarkModeSetting(context, ThemeMode.light);
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: _model.lightModeHovered
                                    ? FlutterFlowTheme.of(context).alternate
                                    : Color(0x00000000),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    valueOrDefault<double>(
                                      _model.paddingItem,
                                      0.0,
                                    ),
                                    valueOrDefault<double>(
                                      _model.paddingItem / 2,
                                      0.0,
                                    ),
                                    valueOrDefault<double>(
                                      _model.paddingItem,
                                      0.0,
                                    ),
                                    valueOrDefault<double>(
                                      _model.paddingItem / 2,
                                      0.0,
                                    )),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.ten_k_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Oncal',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: _model.paddingItem)),
                                ),
                              ),
                            ),
                          ),
                          onEnter: ((event) async {
                            safeSetState(() => _model.lightModeHovered = true);
                          }),
                          onExit: ((event) async {
                            safeSetState(() => _model.lightModeHovered = false);
                          }),
                        ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 100.0,
                child: VerticalDivider(
                  width: 1.0,
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
            ],
          ),
        ),
        onEnter: ((event) async {
          safeSetState(() => _model.menuHoverHovered = true);
          unawaited(
            () async {
              await _model.expand(context);
              safeSetState(() {});
            }(),
          );
        }),
        onExit: ((event) async {
          safeSetState(() => _model.menuHoverHovered = false);
          unawaited(
            () async {
              await _model.retract(context);
              safeSetState(() {});
            }(),
          );
        }),
      ),
    );
  }
}
