import '';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'work_order_status_model.dart';
export 'work_order_status_model.dart';

class WorkOrderStatusWidget extends StatefulWidget {
  const WorkOrderStatusWidget({
    super.key,
    String? workOrderString,
  }) : this.workOrderString = workOrderString ?? '02320';

  final String workOrderString;

  @override
  State<WorkOrderStatusWidget> createState() => _WorkOrderStatusWidgetState();
}

class _WorkOrderStatusWidgetState extends State<WorkOrderStatusWidget> {
  late WorkOrderStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkOrderStatusModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(36.0, 64.0, 36.0, 64.0),
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
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Update Status',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0.0,
                              ),
                    ),
                    Container(
                      width: 12.0,
                      height: 12.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).primary,
                            FlutterFlowTheme.of(context).secondary
                          ],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(1.0, -1.0),
                          end: AlignmentDirectional(-1.0, 1.0),
                        ),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
                Text(
                  'Select the current status of this work order',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Update Status Confirmation'),
                                              content: Text(
                                                  'Are you sure you want to update the work order status? This action cannot be undone.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('❌ Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('✅ Confirm'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  await WorkOrdersTable().update(
                                    data: {
                                      'work_order_status':
                                          'Pending Appointment',
                                      'update_by': FFAppState().userName,
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'work_order_id',
                                      widget.workOrderString,
                                    ),
                                  );
                                  _model.statusSelected = 'Pending Appointment';
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                }
                              },
                              text: 'Pending Appointment',
                              icon: Icon(
                                Icons.pending,
                                size: 24.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Update Status Confirmation'),
                                              content: Text(
                                                  'Are you sure you want to update the work order status? This action cannot be undone.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('❌ Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('✅ Confirm'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  await WorkOrdersTable().update(
                                    data: {
                                      'work_order_status':
                                          'Appointment Confirmed',
                                      'update_by': FFAppState().userName,
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'work_order_id',
                                      widget.workOrderString,
                                    ),
                                  );
                                  _model.statusSelected =
                                      'Appointment Confirmed';
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                }
                              },
                              text: 'Appointment Confirmed',
                              icon: Icon(
                                Icons.check_circle,
                                size: 24.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Update Status Confirmation'),
                                              content: Text(
                                                  'Are you sure you want to update the work order status? This action cannot be undone.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('❌ Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('✅ Confirm'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  await WorkOrdersTable().update(
                                    data: {
                                      'work_order_status': 'Part Requested',
                                      'work_order_bar_value': 0.6,
                                      'update_by': FFAppState().userName,
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'work_order_id',
                                      widget.workOrderString,
                                    ),
                                  );
                                  _model.statusSelected = 'Part Requested';
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                }

                                safeSetState(() {});
                              },
                              text: 'Part Requested',
                              icon: Icon(
                                Icons.inventory,
                                size: 24.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Update Status Confirmation'),
                                              content: Text(
                                                  'Are you sure you want to update the work order status? This action cannot be undone.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('❌ Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('✅ Confirm'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  await WorkOrdersTable().update(
                                    data: {
                                      'work_order_status': 'Completed',
                                      'work_order_bar_value': 1.0,
                                      'update_by': FFAppState().userName,
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'work_order_id',
                                      widget.workOrderString,
                                    ),
                                  );
                                  _model.statusSelected = 'Completed';
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                }
                              },
                              text: 'Completed',
                              icon: Icon(
                                Icons.done_all_sharp,
                                size: 24.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Update Status Confirmation'),
                                              content: Text(
                                                  'Are you sure you want to update the work order status? This action cannot be undone.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('❌ Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('✅ Confirm'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  await WorkOrdersTable().update(
                                    data: {
                                      'work_order_status': 'Updated',
                                      'work_order_bar_value': 0.6,
                                      'update_by': FFAppState().userName,
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'work_order_id',
                                      widget.workOrderString,
                                    ),
                                  );
                                  _model.statusSelected = 'Updated';
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                }
                              },
                              text: 'Updated',
                              icon: Icon(
                                Icons.update,
                                size: 24.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Update Status Confirmation'),
                                              content: Text(
                                                  'Are you sure you want to update the work order status? This action cannot be undone.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('❌ Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('✅ Confirm'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  await WorkOrdersTable().update(
                                    data: {
                                      'work_order_status': 'Updated',
                                      'work_order_bar_value': 0.6,
                                      'update_by': FFAppState().userName,
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'work_order_id',
                                      widget.workOrderString,
                                    ),
                                  );
                                  _model.statusSelected = 'Updated';
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                }
                              },
                              text: 'Canceled',
                              icon: Icon(
                                Icons.cancel_sharp,
                                size: 24.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(height: 12.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        _model.workOrderCopy =
                            await WorkOrdersTable().queryRows(
                          queryFn: (q) => q.eqOrNull(
                            'work_order_id',
                            widget.workOrderString,
                          ),
                        );
                        if ((_model.workOrderCopy?.firstOrNull
                                    ?.workOrderStatus ==
                                'Pending Appointment') ||
                            (_model.workOrderCopy?.firstOrNull
                                    ?.workOrderStatus ==
                                'Appointment Confirmed') ||
                            (_model.workOrderCopy?.firstOrNull
                                    ?.workOrderStatus ==
                                'In Progress') ||
                            (_model.workOrderCopy?.firstOrNull
                                    ?.workOrderStatus ==
                                'Not Confirmed')) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('⚠ Status Not Updated'),
                                content: Text(
                                    'The work order status has not been updated. Please update the status before proceeding.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          Navigator.pop(context);
                        }

                        safeSetState(() {});
                      },
                      text: 'Cancel',
                      options: FFButtonOptions(
                        width: 120.0,
                        height: 45.0,
                        padding: EdgeInsets.all(8.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Manrope',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).secondary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        _model.workOrder = await WorkOrdersTable().queryRows(
                          queryFn: (q) => q.eqOrNull(
                            'work_order_id',
                            widget.workOrderString,
                          ),
                        );
                        if ((_model.workOrder?.firstOrNull?.workOrderStatus ==
                                'Pending Appointment') ||
                            (_model.workOrder?.firstOrNull?.workOrderStatus ==
                                'Appointment Confirmed') ||
                            (_model.workOrder?.firstOrNull?.workOrderStatus ==
                                'In Progress') ||
                            (_model.workOrder?.firstOrNull?.workOrderStatus ==
                                'Not Confirmed')) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('⚠ Status Not Updated'),
                                content: Text(
                                    'The work order status has not been updated. Please update the status before proceeding.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          Navigator.pop(context);
                        }

                        safeSetState(() {});
                      },
                      text: 'Aready Updated',
                      options: FFButtonOptions(
                        width: 120.0,
                        height: 45.0,
                        padding: EdgeInsets.all(8.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Manrope',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).secondary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
              ].divide(SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
