import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'schedule_widget.dart' show ScheduleWidget;
import 'package:flutter/material.dart';

class ScheduleModel extends FlutterFlowModel<ScheduleWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for AppointmentStatus widget.
  FormFieldController<List<String>>? appointmentStatusValueController;
  String? get appointmentStatusValue =>
      appointmentStatusValueController?.value?.firstOrNull;
  set appointmentStatusValue(String? val) =>
      appointmentStatusValueController?.value = val != null ? [val] : [];
  // State field(s) for serviceType widget.
  FormFieldController<List<String>>? serviceTypeValueController;
  String? get serviceTypeValue =>
      serviceTypeValueController?.value?.firstOrNull;
  set serviceTypeValue(String? val) =>
      serviceTypeValueController?.value = val != null ? [val] : [];
  // State field(s) for appliance widget.
  FormFieldController<List<String>>? applianceValueController;
  List<String>? get applianceValues => applianceValueController?.value;
  set applianceValues(List<String>? val) =>
      applianceValueController?.value = val;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  JobTrackingRow? createAppointment;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
