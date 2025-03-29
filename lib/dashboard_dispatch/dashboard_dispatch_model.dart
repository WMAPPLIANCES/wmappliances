import '/appointment/pages/nav_bar1/nav_bar1_widget.dart';
import '/backend/supabase/supabase.dart';
import '/components/side_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dashboard_dispatch_widget.dart' show DashboardDispatchWidget;
import 'package:flutter/material.dart';

class DashboardDispatchModel extends FlutterFlowModel<DashboardDispatchWidget> {
  ///  Local state fields for this page.

  bool viewDetail = false;

  bool viewNotes = false;

  String partDeliveryImage =
      'https://api.wmappliances.cloud/storage/v1/object/public/photos/users/LOGO%20WM%20APPLIANCE%20NOVA%20casa%20alta%20reso.png';

  List<WorkOrdersRow> newJob = [];
  void addToNewJob(WorkOrdersRow item) => newJob.add(item);
  void removeFromNewJob(WorkOrdersRow item) => newJob.remove(item);
  void removeAtIndexFromNewJob(int index) => newJob.removeAt(index);
  void insertAtIndexInNewJob(int index, WorkOrdersRow item) =>
      newJob.insert(index, item);
  void updateNewJobAtIndex(int index, Function(WorkOrdersRow) updateFn) =>
      newJob[index] = updateFn(newJob[index]);

  List<WorkOrdersRow> pendingJob = [];
  void addToPendingJob(WorkOrdersRow item) => pendingJob.add(item);
  void removeFromPendingJob(WorkOrdersRow item) => pendingJob.remove(item);
  void removeAtIndexFromPendingJob(int index) => pendingJob.removeAt(index);
  void insertAtIndexInPendingJob(int index, WorkOrdersRow item) =>
      pendingJob.insert(index, item);
  void updatePendingJobAtIndex(int index, Function(WorkOrdersRow) updateFn) =>
      pendingJob[index] = updateFn(pendingJob[index]);

  List<WorkOrdersRow> partRequested = [];
  void addToPartRequested(WorkOrdersRow item) => partRequested.add(item);
  void removeFromPartRequested(WorkOrdersRow item) =>
      partRequested.remove(item);
  void removeAtIndexFromPartRequested(int index) =>
      partRequested.removeAt(index);
  void insertAtIndexInPartRequested(int index, WorkOrdersRow item) =>
      partRequested.insert(index, item);
  void updatePartRequestedAtIndex(
          int index, Function(WorkOrdersRow) updateFn) =>
      partRequested[index] = updateFn(partRequested[index]);

  List<SchedulesRow> appointmentToday = [];
  void addToAppointmentToday(SchedulesRow item) => appointmentToday.add(item);
  void removeFromAppointmentToday(SchedulesRow item) =>
      appointmentToday.remove(item);
  void removeAtIndexFromAppointmentToday(int index) =>
      appointmentToday.removeAt(index);
  void insertAtIndexInAppointmentToday(int index, SchedulesRow item) =>
      appointmentToday.insert(index, item);
  void updateAppointmentTodayAtIndex(
          int index, Function(SchedulesRow) updateFn) =>
      appointmentToday[index] = updateFn(appointmentToday[index]);

  List<WorkOrdersRow> appointmentConfirmedToday = [];
  void addToAppointmentConfirmedToday(WorkOrdersRow item) =>
      appointmentConfirmedToday.add(item);
  void removeFromAppointmentConfirmedToday(WorkOrdersRow item) =>
      appointmentConfirmedToday.remove(item);
  void removeAtIndexFromAppointmentConfirmedToday(int index) =>
      appointmentConfirmedToday.removeAt(index);
  void insertAtIndexInAppointmentConfirmedToday(
          int index, WorkOrdersRow item) =>
      appointmentConfirmedToday.insert(index, item);
  void updateAppointmentConfirmedTodayAtIndex(
          int index, Function(WorkOrdersRow) updateFn) =>
      appointmentConfirmedToday[index] =
          updateFn(appointmentConfirmedToday[index]);

  List<SchedulesRow> inProgress = [];
  void addToInProgress(SchedulesRow item) => inProgress.add(item);
  void removeFromInProgress(SchedulesRow item) => inProgress.remove(item);
  void removeAtIndexFromInProgress(int index) => inProgress.removeAt(index);
  void insertAtIndexInInProgress(int index, SchedulesRow item) =>
      inProgress.insert(index, item);
  void updateInProgressAtIndex(int index, Function(SchedulesRow) updateFn) =>
      inProgress[index] = updateFn(inProgress[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in dashboardDispatch widget.
  List<StockPartsRow>? queryStock;
  // Stores action output result for [Backend Call - Query Rows] action in dashboardDispatch widget.
  List<WorkOrdersRow>? woNew;
  // Stores action output result for [Backend Call - Query Rows] action in dashboardDispatch widget.
  List<WorkOrdersRow>? woPending;
  // Stores action output result for [Backend Call - Query Rows] action in dashboardDispatch widget.
  List<WorkOrdersRow>? woAppointConfirmed;
  // Stores action output result for [Backend Call - Query Rows] action in dashboardDispatch widget.
  List<WorkOrdersRow>? woPartRequested;
  // Stores action output result for [Backend Call - Query Rows] action in dashboardDispatch widget.
  List<WorkOrdersRow>? woUpdated;
  // Stores action output result for [Backend Call - Query Rows] action in dashboardDispatch widget.
  List<SchedulesRow>? todayAppointment;
  // Stores action output result for [Backend Call - Query Rows] action in dashboardDispatch widget.
  List<SchedulesRow>? inProgressToday;
  // Model for sideMenuView component.
  late SideMenuViewModel sideMenuViewModel;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // Stores action output result for [Gemini - Text From Image] action in Button widget.
  String? geminiTrack;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    sideMenuViewModel = createModel(context, () => SideMenuViewModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    sideMenuViewModel.dispose();
    navBar1Model.dispose();
  }
}
