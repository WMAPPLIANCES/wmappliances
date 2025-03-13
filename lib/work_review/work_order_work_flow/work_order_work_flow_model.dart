import '/appointment/navbar_botton/navbar_botton_widget.dart';
import '/backend/supabase/supabase.dart';
import '/components/side_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'work_order_work_flow_widget.dart' show WorkOrderWorkFlowWidget;
import 'package:flutter/material.dart';

class WorkOrderWorkFlowModel extends FlutterFlowModel<WorkOrderWorkFlowWidget> {
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

  WorkOrdersRow? workOrderQuery;

  List<DiagnosesRow> diagnosisQueryPage = [];
  void addToDiagnosisQueryPage(DiagnosesRow item) =>
      diagnosisQueryPage.add(item);
  void removeFromDiagnosisQueryPage(DiagnosesRow item) =>
      diagnosisQueryPage.remove(item);
  void removeAtIndexFromDiagnosisQueryPage(int index) =>
      diagnosisQueryPage.removeAt(index);
  void insertAtIndexInDiagnosisQueryPage(int index, DiagnosesRow item) =>
      diagnosisQueryPage.insert(index, item);
  void updateDiagnosisQueryPageAtIndex(
          int index, Function(DiagnosesRow) updateFn) =>
      diagnosisQueryPage[index] = updateFn(diagnosisQueryPage[index]);

  DiagnosesRow? viewDiagnosis;

  List<NotesDispatchRow> notesDispatchQuery = [];
  void addToNotesDispatchQuery(NotesDispatchRow item) =>
      notesDispatchQuery.add(item);
  void removeFromNotesDispatchQuery(NotesDispatchRow item) =>
      notesDispatchQuery.remove(item);
  void removeAtIndexFromNotesDispatchQuery(int index) =>
      notesDispatchQuery.removeAt(index);
  void insertAtIndexInNotesDispatchQuery(int index, NotesDispatchRow item) =>
      notesDispatchQuery.insert(index, item);
  void updateNotesDispatchQueryAtIndex(
          int index, Function(NotesDispatchRow) updateFn) =>
      notesDispatchQuery[index] = updateFn(notesDispatchQuery[index]);

  List<NotesRow> notesQuery = [];
  void addToNotesQuery(NotesRow item) => notesQuery.add(item);
  void removeFromNotesQuery(NotesRow item) => notesQuery.remove(item);
  void removeAtIndexFromNotesQuery(int index) => notesQuery.removeAt(index);
  void insertAtIndexInNotesQuery(int index, NotesRow item) =>
      notesQuery.insert(index, item);
  void updateNotesQueryAtIndex(int index, Function(NotesRow) updateFn) =>
      notesQuery[index] = updateFn(notesQuery[index]);

  bool diagnosisViewAppliance = false;

  String progressBarName = 'Not Requested';

  double? progressBarValue = 0.0;

  Color progressBarColor = Color(4278937532);

  String colorString = '#0b67bc';

  ///  State fields for stateful widgets in this page.

  // Model for sideMenuView component.
  late SideMenuViewModel sideMenuViewModel;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<DiagnosesRow>? diagnosisQuery;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<WorkOrdersRow>? workOderQuery;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PartsTotalPriceRow>? totalPartPrice;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PartSummaryAggregatedRow>? partsRequestedQuery;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<NotesDispatchRow>? notesDispatchQueryMain;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<NotesRow>? notesQueryMain;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PartsRow>? partsMainQuery;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for AppointmentStatus widget.
  FormFieldController<List<String>>? appointmentStatusValueController;
  String? get appointmentStatusValue =>
      appointmentStatusValueController?.value?.firstOrNull;
  set appointmentStatusValue(String? val) =>
      appointmentStatusValueController?.value = val != null ? [val] : [];
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue3;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue4;
  // Stores action output result for [Backend Call - Query Rows] action in Diagnosis widget.
  List<PartsRow>? partsMainQueryOnUpdate;
  // State field(s) for AddNoteDispatch widget.
  FocusNode? addNoteDispatchFocusNode;
  TextEditingController? addNoteDispatchTextController;
  String? Function(BuildContext, String?)?
      addNoteDispatchTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  NotesDispatchRow? disptchnotes;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for Switch widget.
  bool? switchValue4;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for navbarBotton component.
  late NavbarBottonModel navbarBottonModel;

  @override
  void initState(BuildContext context) {
    sideMenuViewModel = createModel(context, () => SideMenuViewModel());
    navbarBottonModel = createModel(context, () => NavbarBottonModel());
  }

  @override
  void dispose() {
    sideMenuViewModel.dispose();
    addNoteDispatchFocusNode?.dispose();
    addNoteDispatchTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();

    navbarBottonModel.dispose();
  }
}
