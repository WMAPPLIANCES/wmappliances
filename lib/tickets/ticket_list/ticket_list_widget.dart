import '/backend/supabase/supabase.dart';
import '/components/side_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/tickets/new_ticket_create/new_ticket_create_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'ticket_list_model.dart';
export 'ticket_list_model.dart';

class TicketListWidget extends StatefulWidget {
  const TicketListWidget({super.key});

  static String routeName = 'ticket-list';
  static String routePath = '/ticket-list';

  @override
  State<TicketListWidget> createState() => _TicketListWidgetState();
}

class _TicketListWidgetState extends State<TicketListWidget> {
  late TicketListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TicketListModel());

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

    return FutureBuilder<List<TicketsRow>>(
      future: TicketsTable().queryRows(
        queryFn: (q) => q,
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
        List<TicketsRow> ticketListTicketsRowList = snapshot.data!;

        return Title(
            title: 'ticket-list',
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
                body: Stack(
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
                                  child: Container(
                                    width: 100.0,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 24.0, 24.0, 24.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Ticket Management',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return WebViewAware(
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.6,
                                                                    child:
                                                                        NewTicketCreateWidget(),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      text: 'Create New Ticket',
                                                      options: FFButtonOptions(
                                                        width: 160.0,
                                                        height: 46.0,
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(23.0),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 16.0)),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    24.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: Container(
                                                          width: 400.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child:
                                                                SingleChildScrollView(
                                                              primary: false,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'New Tickets',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Manrope',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            8.0,
                                                                            4.0,
                                                                            8.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(8.0),
                                                                            child:
                                                                                Text(
                                                                              '1',
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            4.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.transparent,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(4.0),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final newTicketQuery = ticketListTicketsRowList.toList();

                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    children: List.generate(newTicketQuery.length, (newTicketQueryIndex) {
                                                                                      final newTicketQueryItem = newTicketQuery[newTicketQueryIndex];
                                                                                      return Visibility(
                                                                                        visible: newTicketQueryItem.status == 'New',
                                                                                        child: Expanded(
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            height: 170.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                if (newTicketQueryItem.priority == 'Standard')
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      width: 8.0,
                                                                                                      height: 100.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsets.all(8.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        if (newTicketQueryItem.priority == 'High')
                                                                                                          Container(
                                                                                                            width: 8.0,
                                                                                                            height: 100.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                        Expanded(
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Flexible(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              valueOrDefault<String>(
                                                                                                                                newTicketQueryItem.wmId,
                                                                                                                                'wmId',
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                                    fontFamily: 'Manrope',
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                              children: [
                                                                                                                                if (newTicketQueryItem.priority == 'High')
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                                                    child: Container(
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                                                                      ),
                                                                                                                                      child: Padding(
                                                                                                                                        padding: EdgeInsets.all(8.0),
                                                                                                                                        child: Text(
                                                                                                                                          'High Priority',
                                                                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                                                                letterSpacing: 0.0,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                if (newTicketQueryItem.priority == 'Standard')
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 8.0),
                                                                                                                                    child: Container(
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                                                                        border: Border.all(
                                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      child: Padding(
                                                                                                                                        padding: EdgeInsets.all(8.0),
                                                                                                                                        child: Text(
                                                                                                                                          'Standard',
                                                                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                                                                letterSpacing: 0.0,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                                        child: Text(
                                                                                                                          valueOrDefault<String>(
                                                                                                                            newTicketQueryItem.issueCategory,
                                                                                                                            'issue',
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        ),
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
                                                                                                                                      newTicketQueryItem.customerName,
                                                                                                                                      'name',
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
                                                                                                                                  dateTimeFormat("relative", newTicketQueryItem.createdAt!),
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
                                                                                                                                  if (newTicketQueryItem.status == 'New')
                                                                                                                                    Align(
                                                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                                      child: FFButtonWidget(
                                                                                                                                        onPressed: () async {
                                                                                                                                          await TicketsTable().update(
                                                                                                                                            data: {
                                                                                                                                              'status': 'In Progress',
                                                                                                                                              'dispatch_photo': FFAppState().userPhoto,
                                                                                                                                              'assigned_dispatch': FFAppState().userName,
                                                                                                                                              'updated_at': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                                                                                            },
                                                                                                                                            matchingRows: (rows) => rows.eqOrNull(
                                                                                                                                              'id',
                                                                                                                                              valueOrDefault<int>(
                                                                                                                                                newTicketQueryItem.id,
                                                                                                                                                21,
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          );

                                                                                                                                          safeSetState(() {});
                                                                                                                                        },
                                                                                                                                        text: 'Start',
                                                                                                                                        options: FFButtonOptions(
                                                                                                                                          width: 218.11,
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
                                                                                        ),
                                                                                      );
                                                                                    }).divide(
                                                                                      SizedBox(height: 12.0),
                                                                                      filterFn: (newTicketQueryIndex) {
                                                                                        final newTicketQueryItem = newTicketQuery[newTicketQueryIndex];
                                                                                        return newTicketQueryItem.status == 'New';
                                                                                      },
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 8.0)),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        4.0)),
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
                                                                    16.0,
                                                                    24.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: Container(
                                                          width: 400.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child:
                                                                SingleChildScrollView(
                                                              primary: false,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'In Progress',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Manrope',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            8.0,
                                                                            4.0,
                                                                            8.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(8.0),
                                                                            child:
                                                                                Text(
                                                                              '2',
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            4.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.transparent,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(4.0),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final inProgress = ticketListTicketsRowList.toList();

                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    children: List.generate(inProgress.length, (inProgressIndex) {
                                                                                      final inProgressItem = inProgress[inProgressIndex];
                                                                                      return Visibility(
                                                                                        visible: inProgressItem.status == 'In Progress',
                                                                                        child: Expanded(
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            height: 170.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                if (inProgressItem.priority == 'Standard')
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      width: 8.0,
                                                                                                      height: 100.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsets.all(8.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        if (inProgressItem.priority == 'High')
                                                                                                          Container(
                                                                                                            width: 8.0,
                                                                                                            height: 100.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                        Expanded(
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Flexible(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              valueOrDefault<String>(
                                                                                                                                inProgressItem.wmId,
                                                                                                                                'idWm',
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                                    fontFamily: 'Manrope',
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                              children: [
                                                                                                                                if (inProgressItem.priority == 'High')
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                                                    child: Container(
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                                                                      ),
                                                                                                                                      child: Padding(
                                                                                                                                        padding: EdgeInsets.all(8.0),
                                                                                                                                        child: Text(
                                                                                                                                          'High Priority',
                                                                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                                                                letterSpacing: 0.0,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                if (inProgressItem.priority == 'Standard')
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 8.0),
                                                                                                                                    child: Container(
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                                                                        border: Border.all(
                                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      child: Padding(
                                                                                                                                        padding: EdgeInsets.all(8.0),
                                                                                                                                        child: Text(
                                                                                                                                          'Standard',
                                                                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                                                                letterSpacing: 0.0,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                                        child: Text(
                                                                                                                          valueOrDefault<String>(
                                                                                                                            inProgressItem.issueCategory,
                                                                                                                            'issue',
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        ),
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
                                                                                                                                      inProgressItem.customerName,
                                                                                                                                      'name',
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
                                                                                                                                  dateTimeFormat("relative", inProgressItem.createdAt!),
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
                                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                            children: [
                                                                                                                              Align(
                                                                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                                child: FFButtonWidget(
                                                                                                                                  onPressed: () async {
                                                                                                                                    context.pushNamed(
                                                                                                                                      TicketDetailWidget.routeName,
                                                                                                                                      queryParameters: {
                                                                                                                                        'ticketDetailParam': serializeParam(
                                                                                                                                          inProgressItem,
                                                                                                                                          ParamType.SupabaseRow,
                                                                                                                                        ),
                                                                                                                                      }.withoutNulls,
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                  text: 'Details',
                                                                                                                                  options: FFButtonOptions(
                                                                                                                                    width: 90.0,
                                                                                                                                    height: 36.0,
                                                                                                                                    padding: EdgeInsets.all(8.0),
                                                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                          fontFamily: 'Manrope',
                                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                        ),
                                                                                                                                    elevation: 0.0,
                                                                                                                                    borderSide: BorderSide(
                                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                                      width: 1.0,
                                                                                                                                    ),
                                                                                                                                    borderRadius: BorderRadius.circular(18.0),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: [
                                                                                                                                  if (inProgressItem.status == 'In Progress')
                                                                                                                                    FFButtonWidget(
                                                                                                                                      onPressed: () async {
                                                                                                                                        await TicketsTable().update(
                                                                                                                                          data: {
                                                                                                                                            'status': 'Completed',
                                                                                                                                          },
                                                                                                                                          matchingRows: (rows) => rows.eqOrNull(
                                                                                                                                            'id',
                                                                                                                                            valueOrDefault<int>(
                                                                                                                                              inProgressItem.id,
                                                                                                                                              23,
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        );

                                                                                                                                        safeSetState(() {});

                                                                                                                                        safeSetState(() {});
                                                                                                                                      },
                                                                                                                                      text: 'Complete',
                                                                                                                                      options: FFButtonOptions(
                                                                                                                                        width: 80.0,
                                                                                                                                        height: 36.0,
                                                                                                                                        padding: EdgeInsets.all(8.0),
                                                                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                        color: FlutterFlowTheme.of(context).secondary,
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
                                                                                        ),
                                                                                      );
                                                                                    }).divide(
                                                                                      SizedBox(height: 12.0),
                                                                                      filterFn: (inProgressIndex) {
                                                                                        final inProgressItem = inProgress[inProgressIndex];
                                                                                        return inProgressItem.status == 'In Progress';
                                                                                      },
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 8.0)),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        4.0)),
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
                                                                    16.0,
                                                                    24.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: Container(
                                                          width: 400.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child:
                                                                SingleChildScrollView(
                                                              primary: false,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Completed',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Manrope',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            8.0,
                                                                            4.0,
                                                                            8.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(8.0),
                                                                            child:
                                                                                Text(
                                                                              '3',
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            4.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.transparent,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(4.0),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final completed = ticketListTicketsRowList.toList();

                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    children: List.generate(completed.length, (completedIndex) {
                                                                                      final completedItem = completed[completedIndex];
                                                                                      return Visibility(
                                                                                        visible: completedItem.status == 'Completed',
                                                                                        child: Expanded(
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            height: 170.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                if (completedItem.priority == 'Standard')
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      width: 8.0,
                                                                                                      height: 100.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsets.all(8.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        if (completedItem.priority == 'High')
                                                                                                          Container(
                                                                                                            width: 8.0,
                                                                                                            height: 100.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                        Expanded(
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Flexible(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              valueOrDefault<String>(
                                                                                                                                completedItem.wmId,
                                                                                                                                'wmid',
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                                    fontFamily: 'Manrope',
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                              children: [
                                                                                                                                if (completedItem.priority == 'High')
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                                                    child: Container(
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                                                                      ),
                                                                                                                                      child: Padding(
                                                                                                                                        padding: EdgeInsets.all(8.0),
                                                                                                                                        child: Text(
                                                                                                                                          'High Priority',
                                                                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                                                                letterSpacing: 0.0,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                if (completedItem.priority == 'Standard')
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 8.0),
                                                                                                                                    child: Container(
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                                                                        border: Border.all(
                                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      child: Padding(
                                                                                                                                        padding: EdgeInsets.all(8.0),
                                                                                                                                        child: Text(
                                                                                                                                          'Standard',
                                                                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                                                                letterSpacing: 0.0,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                                        child: Text(
                                                                                                                          valueOrDefault<String>(
                                                                                                                            completedItem.issueCategory,
                                                                                                                            'issue',
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        ),
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
                                                                                                                                      completedItem.customerName,
                                                                                                                                      'name',
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
                                                                                                                                  dateTimeFormat("relative", completedItem.createdAt!),
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
                                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                            children: [
                                                                                                                              Align(
                                                                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                                child: FFButtonWidget(
                                                                                                                                  onPressed: () async {
                                                                                                                                    context.pushNamed(
                                                                                                                                      TicketDetailWidget.routeName,
                                                                                                                                      queryParameters: {
                                                                                                                                        'ticketDetailParam': serializeParam(
                                                                                                                                          completedItem,
                                                                                                                                          ParamType.SupabaseRow,
                                                                                                                                        ),
                                                                                                                                      }.withoutNulls,
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                  text: 'Details',
                                                                                                                                  options: FFButtonOptions(
                                                                                                                                    width: 90.0,
                                                                                                                                    height: 36.0,
                                                                                                                                    padding: EdgeInsets.all(8.0),
                                                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                          fontFamily: 'Manrope',
                                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                        ),
                                                                                                                                    elevation: 0.0,
                                                                                                                                    borderSide: BorderSide(
                                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                                      width: 1.0,
                                                                                                                                    ),
                                                                                                                                    borderRadius: BorderRadius.circular(18.0),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: [
                                                                                                                                  if (completedItem.status == 'Completed')
                                                                                                                                    FFButtonWidget(
                                                                                                                                      onPressed: () async {
                                                                                                                                        await TicketsTable().update(
                                                                                                                                          data: {
                                                                                                                                            'status': 'Done',
                                                                                                                                          },
                                                                                                                                          matchingRows: (rows) => rows.eqOrNull(
                                                                                                                                            'id',
                                                                                                                                            valueOrDefault<int>(
                                                                                                                                              completedItem.id,
                                                                                                                                              30,
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        );

                                                                                                                                        safeSetState(() {});

                                                                                                                                        safeSetState(() {});
                                                                                                                                      },
                                                                                                                                      text: 'Done',
                                                                                                                                      options: FFButtonOptions(
                                                                                                                                        width: 80.0,
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
                                                                                        ),
                                                                                      );
                                                                                    }).divide(
                                                                                      SizedBox(height: 12.0),
                                                                                      filterFn: (completedIndex) {
                                                                                        final completedItem = completed[completedIndex];
                                                                                        return completedItem.status == 'Completed';
                                                                                      },
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 8.0)),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        4.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 16.0)),
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
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
                  ],
                ),
              ),
            ));
      },
    );
  }
}
