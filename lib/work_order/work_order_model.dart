import '/backend/supabase/supabase.dart';
import '/components/side_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'work_order_widget.dart' show WorkOrderWidget;
import 'package:flutter/material.dart';

class WorkOrderModel extends FlutterFlowModel<WorkOrderWidget> {
  ///  Local state fields for this page.

  bool viewDetail = false;

  bool viewNotes = false;

  bool showAppointment = true;

  bool selectTechnician = false;

  String technicianName = 'technicianName';

  String technicianUuid = 'technicianUuid';

  List<String> appointmeAppliancesList = [];
  void addToAppointmeAppliancesList(String item) =>
      appointmeAppliancesList.add(item);
  void removeFromAppointmeAppliancesList(String item) =>
      appointmeAppliancesList.remove(item);
  void removeAtIndexFromAppointmeAppliancesList(int index) =>
      appointmeAppliancesList.removeAt(index);
  void insertAtIndexInAppointmeAppliancesList(int index, String item) =>
      appointmeAppliancesList.insert(index, item);
  void updateAppointmeAppliancesListAtIndex(
          int index, Function(String) updateFn) =>
      appointmeAppliancesList[index] = updateFn(appointmeAppliancesList[index]);

  bool helperTrue = false;

  bool createDiagnosis = false;

  List<PartsRow> partQuery = [];
  void addToPartQuery(PartsRow item) => partQuery.add(item);
  void removeFromPartQuery(PartsRow item) => partQuery.remove(item);
  void removeAtIndexFromPartQuery(int index) => partQuery.removeAt(index);
  void insertAtIndexInPartQuery(int index, PartsRow item) =>
      partQuery.insert(index, item);
  void updatePartQueryAtIndex(int index, Function(PartsRow) updateFn) =>
      partQuery[index] = updateFn(partQuery[index]);

  bool priorityNote = false;

  bool dispatchNote = false;

  bool showDetail = false;

  bool showDiagnosisAppliance = false;

  bool showPartRequested = false;

  bool showNotes = false;

  bool showDispatchNotes = false;

  bool showSchedule = false;

  bool viewPreviousWorkOrder = false;

  bool isFollowUp = false;

  List<String> partToPickUp = [];
  void addToPartToPickUp(String item) => partToPickUp.add(item);
  void removeFromPartToPickUp(String item) => partToPickUp.remove(item);
  void removeAtIndexFromPartToPickUp(int index) => partToPickUp.removeAt(index);
  void insertAtIndexInPartToPickUp(int index, String item) =>
      partToPickUp.insert(index, item);
  void updatePartToPickUpAtIndex(int index, Function(String) updateFn) =>
      partToPickUp[index] = updateFn(partToPickUp[index]);

  ///  State fields for stateful widgets in this page.

  // Model for sideMenuView component.
  late SideMenuViewModel sideMenuViewModel;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue3;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue4;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue5;
  // State field(s) for appliance widget.
  FormFieldController<List<String>>? applianceValueController;
  List<String>? get applianceValues => applianceValueController?.value;
  set applianceValues(List<String>? val) =>
      applianceValueController?.value = val;
  // State field(s) for serviceType widget.
  FormFieldController<List<String>>? serviceTypeValueController;
  String? get serviceTypeValue =>
      serviceTypeValueController?.value?.firstOrNull;
  set serviceTypeValue(String? val) =>
      serviceTypeValueController?.value = val != null ? [val] : [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for AddNoteDispatch widget.
  FocusNode? addNoteDispatchFocusNode;
  TextEditingController? addNoteDispatchTextController;
  String? Function(BuildContext, String?)?
      addNoteDispatchTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue4;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  NotesDispatchRow? disptchnotes;

  @override
  void initState(BuildContext context) {
    sideMenuViewModel = createModel(context, () => SideMenuViewModel());
  }

  @override
  void dispose() {
    sideMenuViewModel.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    addNoteDispatchFocusNode?.dispose();
    addNoteDispatchTextController?.dispose();
  }
}
