import '/backend/supabase/supabase.dart';
import '/components/side_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'ticket_list_widget.dart' show TicketListWidget;
import 'package:flutter/material.dart';

class TicketListModel extends FlutterFlowModel<TicketListWidget> {
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
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<TicketsRow>? startbt;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<TicketsRow>? completeBt;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<TicketsRow>? doneBt;

  @override
  void initState(BuildContext context) {
    sideMenuViewModel = createModel(context, () => SideMenuViewModel());
  }

  @override
  void dispose() {
    sideMenuViewModel.dispose();
  }
}
