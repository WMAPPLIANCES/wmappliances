import '/appointment/navbar_botton/navbar_botton_widget.dart';
import '/backend/supabase/supabase.dart';
import '/components/side_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
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

  String scheduleID = '12025';

  Color diagnosisIconColor = Color(4289512480);

  String diagnosisId = '1443432';

  Color paymentColor = Color(4289512480);

  ///  State fields for stateful widgets in this page.

  // Model for sideMenuView component.
  late SideMenuViewModel sideMenuViewModel;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<DiagnosesRow>? diagnosisQuery;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<WorkOrdersRow>? workOderQuery;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PartsSummaryRow>? totalPartPrice;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PartSummaryAggregatedRow>? partsRequestedQuery;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PartsRow>? partsMainQuery;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<NotesRow>? notesQueryMain;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<NotesDispatchRow>? notesDispatchQueryMain;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<DiagnosesRow>? diagnosisQueryDispa1;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<WorkOrdersRow>? workOderQuery1;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PartsSummaryRow>? totalPartPrice1;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PartSummaryAggregatedRow>? partsRequestedQuery1;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<NotesDispatchRow>? notesDispatchQueryMain1;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<NotesRow>? notesQueryMain1;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PartsRow>? partsMainQuery1;
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
  // State field(s) for TextFieldAddNotesNotmal widget.
  FocusNode? textFieldAddNotesNotmalFocusNode;
  TextEditingController? textFieldAddNotesNotmalTextController;
  String? Function(BuildContext, String?)?
      textFieldAddNotesNotmalTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue4;
  // State field(s) for UpdateDiagnsosis widget.
  FocusNode? updateDiagnsosisFocusNode;
  TextEditingController? updateDiagnsosisTextController;
  String? Function(BuildContext, String?)?
      updateDiagnsosisTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<DiagnosesRow>? viewDiagnosisUpdateAiUpdate;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Stores action output result for [Backend Call - Query Rows] action in partPaidWM widget.
  List<PartsRow>? partQueryUpdateWmPart;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PartsRow>? partQueryUpdateApproved;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PartsRow>? partQueryUpdateDenied;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<PartsRow>? rowUpdateParts;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PartsRow>? partQueryUpdateRequested;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PartsRow>? partQueryUpdateArrived;
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

    textFieldAddNotesNotmalFocusNode?.dispose();
    textFieldAddNotesNotmalTextController?.dispose();

    updateDiagnsosisFocusNode?.dispose();
    updateDiagnsosisTextController?.dispose();

    navbarBottonModel.dispose();
  }
}
