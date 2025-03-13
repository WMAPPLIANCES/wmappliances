import '/backend/supabase/supabase.dart';
import '/components/list_appointment_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/nav_bar1/nav_bar1_widget.dart';
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 64.0),
                    child: FutureBuilder<List<SchedulesRow>>(
                      future: SchedulesTable().queryRows(
                        queryFn: (q) => q.order('stop_number', ascending: true),
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
                        List<SchedulesRow> columnSchedulesRowList =
                            snapshot.data!;

                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                columnSchedulesRowList.length, (columnIndex) {
                              final columnSchedulesRow =
                                  columnSchedulesRowList[columnIndex];
                              return ListAppointmentViewWidget(
                                key: Key(
                                    'Keyttk_${columnIndex}_of_${columnSchedulesRowList.length}'),
                                scheduleParamt: columnSchedulesRow,
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.navBar1Model,
                      updateCallback: () => safeSetState(() {}),
                      child: NavBar1Widget(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
