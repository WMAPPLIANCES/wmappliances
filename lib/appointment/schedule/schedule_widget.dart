import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'schedule_model.dart';
export 'schedule_model.dart';

/// Design a modern, futuristic form tailored for an appliance repair company.
///
/// Include the following elements:
///
/// Calendar Display (Top of Form): Place a calendar at the top for easy date
/// selection.
/// Time Window Selector: Offer options for morning, afternoon, and evening.
/// Technician Selection: Provide a dropdown list displaying technicians, each
/// showing their name and photo.
/// Appointment Status: Use choice chips to display status options, including
/// "Waiting for Update," "Not Confirmed," "Confirmed," "In Progress," and
/// "Completed."
/// Service Type: Add a dropdown or choice chips for selecting the type of
/// service, with options for "Diagnosis" or "Follow Up."
/// Notes Section: Enable users to input notes specific to the appointment.
/// Required Item Selection: Add choice chips allowing multiple selections
/// from the following list of appliances:
/// Refrigerator
/// Dishwasher
/// Washer Machine
/// Dryer
/// RangeCooktop
/// Rangehood
/// Wall Oven
/// Microwave
/// The form should feature a sleek, intuitive, and user-friendly interface,
/// with bold, clean lines and a futuristic aesthetic.
///
/// add icon at choice chip to make more user friendly
class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({
    super.key,
    required this.workOrderParamSchedule,
  });

  final WorkOrdersRow? workOrderParamSchedule;

  @override
  State<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  late ScheduleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScheduleModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
      child: Container(
        width: 600.0,
        height: 900.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
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
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Schedule Repair',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Outfit',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 200.0,
                            height: 100.0,
                            child: custom_widgets.DateTimePicker(
                              width: 200.0,
                              height: 100.0,
                              isStartTime: true,
                            ),
                          ),
                          Container(
                            width: 200.0,
                            height: 100.0,
                            child: custom_widgets.DateTimePicker(
                              width: 200.0,
                              height: 100.0,
                              isStartTime: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  'Select Technician',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          12.0, 12.0, 12.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: FutureBuilder<List<UsersRow>>(
                              future: UsersTable().queryRows(
                                queryFn: (q) => q.eqOrNull(
                                  'role',
                                  'technician',
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<UsersRow> dropDownUsersRowList =
                                    snapshot.data!;

                                return FlutterFlowDropDown<String>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<String>(null),
                                  options: dropDownUsersRowList
                                      .map((e) => valueOrDefault<String>(
                                            e.fullName,
                                            'name',
                                          ))
                                      .toList(),
                                  onChanged: (val) => safeSetState(
                                      () => _model.dropDownValue = val),
                                  width: 500.0,
                                  height: 80.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  hintText: 'Select technician...',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  elevation: 2.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  'Appointment Status',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                ),
                FlutterFlowChoiceChips(
                  options: [
                    ChipData('Waiting for Update', Icons.hourglass_empty),
                    ChipData('Not Confirmed', Icons.cancel),
                    ChipData('Confirmed', Icons.check_circle),
                    ChipData('In Progress', Icons.engineering),
                    ChipData('Completed', Icons.task_alt)
                  ],
                  onChanged: (val) => safeSetState(
                      () => _model.appointmentStatusValue = val?.firstOrNull),
                  selectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                        ),
                    iconColor: FlutterFlowTheme.of(context).info,
                    iconSize: 18.0,
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor: Color(0xFFF0F0F0),
                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Manrope',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                    iconSize: 18.0,
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  chipSpacing: 12.0,
                  rowSpacing: 8.0,
                  multiselect: false,
                  alignment: WrapAlignment.start,
                  controller: _model.appointmentStatusValueController ??=
                      FormFieldController<List<String>>(
                    [],
                  ),
                  wrapped: true,
                ),
                Text(
                  'Service Type',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                ),
                FlutterFlowChoiceChips(
                  options: [
                    ChipData('Diagnosis', Icons.search),
                    ChipData('Follow Up', Icons.repeat)
                  ],
                  onChanged: (val) => safeSetState(
                      () => _model.serviceTypeValue = val?.firstOrNull),
                  selectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                        ),
                    iconColor: FlutterFlowTheme.of(context).info,
                    iconSize: 18.0,
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor: Color(0xFFF0F0F0),
                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Manrope',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                    iconSize: 18.0,
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  chipSpacing: 12.0,
                  rowSpacing: 8.0,
                  multiselect: false,
                  alignment: WrapAlignment.start,
                  controller: _model.serviceTypeValueController ??=
                      FormFieldController<List<String>>(
                    [],
                  ),
                  wrapped: true,
                ),
                Text(
                  'Select Appliances',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                ),
                FlutterFlowChoiceChips(
                  options: [
                    ChipData('Refrigerator', Icons.kitchen),
                    ChipData('Dishwasher', Icons.local_laundry_service),
                    ChipData('Washer Machine', Icons.local_laundry_service),
                    ChipData('Dryer', Icons.local_laundry_service),
                    ChipData('RangeCooktop', Icons.microwave_sharp),
                    ChipData('Rangehood', Icons.microwave_sharp),
                    ChipData('Wall Oven', Icons.microwave_sharp),
                    ChipData('Microwave', Icons.microwave)
                  ],
                  onChanged: (val) =>
                      safeSetState(() => _model.applianceValues = val),
                  selectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                        ),
                    iconColor: FlutterFlowTheme.of(context).info,
                    iconSize: 18.0,
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor: Color(0xFFF0F0F0),
                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Manrope',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                    iconSize: 18.0,
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  chipSpacing: 12.0,
                  rowSpacing: 8.0,
                  multiselect: true,
                  initialized: _model.applianceValues != null,
                  alignment: WrapAlignment.start,
                  controller: _model.applianceValueController ??=
                      FormFieldController<List<String>>(
                    [],
                  ),
                  wrapped: true,
                ),
                Text(
                  'Notes',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyLarge.override(
                                fontFamily: 'Manrope',
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                        ),
                    maxLines: 5,
                    minLines: 3,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    _model.createAppointment = await JobTrackingTable().insert({
                      'work_order_id': valueOrDefault<String>(
                        widget.workOrderParamSchedule?.workOrderId,
                        'wo',
                      ),
                      'start_time':
                          supaSerialize<DateTime>(FFAppState().startTime),
                      'end_time': supaSerialize<DateTime>(FFAppState().endTime),
                      'technician_name': _model.dropDownValue,
                      'job_status': _model.appointmentStatusValue,
                    });
                    await NotesTable().insert({
                      'work_order_id': valueOrDefault<String>(
                        widget.workOrderParamSchedule?.workOrderId,
                        'woid',
                      ),
                      'note_content': _model.textController.text,
                    });
                    Navigator.pop(context);

                    safeSetState(() {});
                  },
                  text: 'Submit',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
                              fontFamily: 'Manrope',
                              color: FlutterFlowTheme.of(context).info,
                              letterSpacing: 0.0,
                            ),
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ].divide(SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
