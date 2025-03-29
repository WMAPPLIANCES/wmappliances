import '/appointment/pages/nav_bar1/nav_bar1_widget.dart';
import '/backend/supabase/supabase.dart';
import '/components/no_internet_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'work_order_technicians_view_widget.dart'
    show WorkOrderTechniciansViewWidget;
import 'package:flutter/material.dart';

class WorkOrderTechniciansViewModel
    extends FlutterFlowModel<WorkOrderTechniciansViewWidget> {
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

  String mapsAddress = 'https://www.google.com/maps/search/?api=1&query=';

  List<String> partListRemovePickUp = [];
  void addToPartListRemovePickUp(String item) => partListRemovePickUp.add(item);
  void removeFromPartListRemovePickUp(String item) =>
      partListRemovePickUp.remove(item);
  void removeAtIndexFromPartListRemovePickUp(int index) =>
      partListRemovePickUp.removeAt(index);
  void insertAtIndexInPartListRemovePickUp(int index, String item) =>
      partListRemovePickUp.insert(index, item);
  void updatePartListRemovePickUpAtIndex(
          int index, Function(String) updateFn) =>
      partListRemovePickUp[index] = updateFn(partListRemovePickUp[index]);

  ///  State fields for stateful widgets in this page.

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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // Stores action output result for [Backend Call - Update Row(s)] action in part_taken widget.
  List<PartsRow>? partTaken;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;
  // Model for NoInternet component.
  late NoInternetModel noInternetModel;

  @override
  void initState(BuildContext context) {
    navBar1Model = createModel(context, () => NavBar1Model());
    noInternetModel = createModel(context, () => NoInternetModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    navBar1Model.dispose();
    noInternetModel.dispose();
  }
}
