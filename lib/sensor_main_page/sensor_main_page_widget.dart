import '';
import '/backend/supabase/supabase.dart';
import '/components/side_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/nav_bar1/nav_bar1_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'sensor_main_page_model.dart';
export 'sensor_main_page_model.dart';

/// update
class SensorMainPageWidget extends StatefulWidget {
  const SensorMainPageWidget({
    super.key,
    String? workOrderIdSensor,
  }) : this.workOrderIdSensor = workOrderIdSensor ?? 'wms01';

  final String workOrderIdSensor;

  static String routeName = 'sensor-main-page';
  static String routePath = '/sensor-main-page';

  @override
  State<SensorMainPageWidget> createState() => _SensorMainPageWidgetState();
}

class _SensorMainPageWidgetState extends State<SensorMainPageWidget> {
  late SensorMainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SensorMainPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SensorDataRow>>(
      future: SensorDataTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'work_order_id',
          widget.workOrderIdSensor,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.black,
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
        List<SensorDataRow> sensorMainPageSensorDataRowList = snapshot.data!;

        return Title(
            title: 'sensor-main-page',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: Colors.black,
                body: Stack(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Stack(
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 1.0),
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(1.0, 1.0),
                                          children: [
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          height:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFF0A0909),
                                                          ),
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .sideMenuViewModel,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                SideMenuViewWidget(),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: 100.0,
                                                            height: 800.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: 800.0,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            60.0),
                                                                child: PageView(
                                                                  controller: _model
                                                                          .pageViewController ??=
                                                                      PageController(
                                                                          initialPage:
                                                                              0),
                                                                  onPageChanged:
                                                                      (_) async {
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      height:
                                                                          800.0,
                                                                      child: custom_widgets
                                                                          .TemperatureLineChart(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height:
                                                                            800.0,
                                                                        surfaceTemperatures: sensorMainPageSensorDataRowList
                                                                            .map((e) => valueOrDefault<double>(
                                                                                  e.temperatureFahrenheit,
                                                                                  35.0,
                                                                                ))
                                                                            .toList(),
                                                                        dateTime: sensorMainPageSensorDataRowList
                                                                            .map((e) =>
                                                                                e.dateTime)
                                                                            .withoutNulls
                                                                            .toList(),
                                                                        workOrderId:
                                                                            'Order #${widget.workOrderIdSensor}',
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      height:
                                                                          800.0,
                                                                      child: custom_widgets
                                                                          .HumidityLineChart(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height:
                                                                            800.0,
                                                                        humidities: sensorMainPageSensorDataRowList
                                                                            .map((e) => valueOrDefault<double>(
                                                                                  e.humidity,
                                                                                  20.0,
                                                                                ))
                                                                            .toList(),
                                                                        dateTime: sensorMainPageSensorDataRowList
                                                                            .map((e) =>
                                                                                e.dateTime)
                                                                            .withoutNulls
                                                                            .toList(),
                                                                        workOrderId:
                                                                            'Order #${widget.workOrderIdSensor}',
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      height:
                                                                          800.0,
                                                                      child: custom_widgets
                                                                          .SurfaceTemperatureLineChart(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height:
                                                                            800.0,
                                                                        surfaceTemperatures: sensorMainPageSensorDataRowList
                                                                            .map((e) => valueOrDefault<double>(
                                                                                  e.infraredTemperature,
                                                                                  55.0,
                                                                                ))
                                                                            .toList(),
                                                                        dateTime: sensorMainPageSensorDataRowList
                                                                            .map((e) =>
                                                                                e.dateTime)
                                                                            .withoutNulls
                                                                            .toList(),
                                                                        workOrderId:
                                                                            'Order #${widget.workOrderIdSensor}',
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      height:
                                                                          800.0,
                                                                      child: custom_widgets
                                                                          .AirFlowLineChart(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height:
                                                                            800.0,
                                                                        dateTime: sensorMainPageSensorDataRowList
                                                                            .map((e) =>
                                                                                e.dateTime)
                                                                            .withoutNulls
                                                                            .toList(),
                                                                        airFlows: sensorMainPageSensorDataRowList
                                                                            .map((e) => valueOrDefault<double>(
                                                                                  e.airFlow,
                                                                                  0.5,
                                                                                ))
                                                                            .toList(),
                                                                        workOrderId:
                                                                            'Order #${widget.workOrderIdSensor}',
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final audioRecord = sensorMainPageSensorDataRowList
                                                                              .map((e) => e.audioUrl)
                                                                              .withoutNulls
                                                                              .toList();

                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                List.generate(audioRecord.length, (audioRecordIndex) {
                                                                              final audioRecordItem = audioRecord[audioRecordIndex];
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 6.0),
                                                                                child: FlutterFlowAudioPlayer(
                                                                                  audio: Audio.network(
                                                                                    audioRecordItem,
                                                                                    metas: Metas(
                                                                                      title: 'Noise Detected',
                                                                                    ),
                                                                                  ),
                                                                                  titleTextStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  playbackDurationTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: 'Manrope',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  playbackButtonColor: FlutterFlowTheme.of(context).primary,
                                                                                  activeTrackColor: FlutterFlowTheme.of(context).primary,
                                                                                  inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                                                                                  elevation: 2.0,
                                                                                  playInBackground: PlayInBackground.disabledRestoreOnForeground,
                                                                                ),
                                                                              );
                                                                            }),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      height:
                                                                          800.0,
                                                                      child: custom_widgets
                                                                          .LeakDetectionLineChart(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height:
                                                                            800.0,
                                                                        workOrderId:
                                                                            'Order #${widget.workOrderIdSensor}',
                                                                        leakDetections: sensorMainPageSensorDataRowList
                                                                            .map((e) =>
                                                                                e.leak)
                                                                            .withoutNulls
                                                                            .toList(),
                                                                        dateTime: sensorMainPageSensorDataRowList
                                                                            .map((e) =>
                                                                                e.dateTime)
                                                                            .withoutNulls
                                                                            .toList(),
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
                                          ],
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (responsiveVisibility(
                      context: context,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Align(
                        alignment: AlignmentDirectional(-1.01, 0.85),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 18.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.safePop();
                            },
                            text: 'Back',
                            icon: Icon(
                              Icons.arrow_back_sharp,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              height: 20.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0x002797FF),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Manrope',
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
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
