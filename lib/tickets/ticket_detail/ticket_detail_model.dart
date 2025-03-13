import '/backend/supabase/supabase.dart';
import '/components/side_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ticket_detail_widget.dart' show TicketDetailWidget;
import 'package:flutter/material.dart';

class TicketDetailModel extends FlutterFlowModel<TicketDetailWidget> {
  ///  Local state fields for this page.

  List<TicketsRow> inProgressVar = [];
  void addToInProgressVar(TicketsRow item) => inProgressVar.add(item);
  void removeFromInProgressVar(TicketsRow item) => inProgressVar.remove(item);
  void removeAtIndexFromInProgressVar(int index) =>
      inProgressVar.removeAt(index);
  void insertAtIndexInInProgressVar(int index, TicketsRow item) =>
      inProgressVar.insert(index, item);
  void updateInProgressVarAtIndex(int index, Function(TicketsRow) updateFn) =>
      inProgressVar[index] = updateFn(inProgressVar[index]);

  TicketsRow? completedVar;

  List<TicketsRow> newVar = [];
  void addToNewVar(TicketsRow item) => newVar.add(item);
  void removeFromNewVar(TicketsRow item) => newVar.remove(item);
  void removeAtIndexFromNewVar(int index) => newVar.removeAt(index);
  void insertAtIndexInNewVar(int index, TicketsRow item) =>
      newVar.insert(index, item);
  void updateNewVarAtIndex(int index, Function(TicketsRow) updateFn) =>
      newVar[index] = updateFn(newVar[index]);

  ///  State fields for stateful widgets in this page.

  // Model for sideMenuView component.
  late SideMenuViewModel sideMenuViewModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  NotesRow? notesTickets;

  @override
  void initState(BuildContext context) {
    sideMenuViewModel = createModel(context, () => SideMenuViewModel());
  }

  @override
  void dispose() {
    sideMenuViewModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
