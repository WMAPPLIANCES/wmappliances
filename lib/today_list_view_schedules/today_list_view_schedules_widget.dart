import '/appointment/pages/nav_bar1/nav_bar1_widget.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/list_appointment_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'today_list_view_schedules_model.dart';
export 'today_list_view_schedules_model.dart';

class TodayListViewSchedulesWidget extends StatefulWidget {
  const TodayListViewSchedulesWidget({super.key});

  static String routeName = 'todayListViewSchedules';
  static String routePath = '/todayListViewSchedules';

  @override
  State<TodayListViewSchedulesWidget> createState() =>
      _TodayListViewSchedulesWidgetState();
}

class _TodayListViewSchedulesWidgetState
    extends State<TodayListViewSchedulesWidget> {
  late TodayListViewSchedulesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TodayListViewSchedulesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AppointmentsRow>>(
      future: AppointmentsTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'technician_id',
              currentUserUid,
            )
            .eqOrNull(
              'appointment_date',
              supaSerialize<DateTime>(functions.today()),
            )
            .order('stop_number'),
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
        List<AppointmentsRow> todayListViewSchedulesAppointmentsRowList =
            snapshot.data!;

        return Title(
            title: 'todayListViewSchedules',
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
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0),
                                  bottomRight: Radius.circular(16.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 8.0),
                                    child: Text(
                                      'Service Calls Today',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            fontSize: 28.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 64.0),
                            child: Builder(
                              builder: (context) {
                                final appointment =
                                    todayListViewSchedulesAppointmentsRowList
                                        .toList();

                                return SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(appointment.length,
                                        (appointmentIndex) {
                                      final appointmentItem =
                                          appointment[appointmentIndex];
                                      return ListAppointmentViewWidget(
                                        key: Key(
                                            'Keyttk_${appointmentIndex}_of_${appointment.length}'),
                                        scheduleParamt: appointmentItem,
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: wrapWithModel(
                          model: _model.navBar1Model,
                          updateCallback: () => safeSetState(() {}),
                          child: NavBar1Widget(),
                        ),
                      ),
                      Container(
                        width: 1.0,
                        height: 1.0,
                        child: custom_widgets.LiveLocationTimer(
                          width: 1.0,
                          height: 1.0,
                        ),
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
