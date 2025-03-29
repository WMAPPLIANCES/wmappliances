import '/appointment/pages/nav_bar1/nav_bar1_widget.dart';
import '/backend/supabase/supabase.dart';
import '/components/side_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sensor_main_page_widget.dart' show SensorMainPageWidget;
import 'package:flutter/material.dart';

class SensorMainPageModel extends FlutterFlowModel<SensorMainPageWidget> {
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

  List<SensorDataRow> temperature = [];
  void addToTemperature(SensorDataRow item) => temperature.add(item);
  void removeFromTemperature(SensorDataRow item) => temperature.remove(item);
  void removeAtIndexFromTemperature(int index) => temperature.removeAt(index);
  void insertAtIndexInTemperature(int index, SensorDataRow item) =>
      temperature.insert(index, item);
  void updateTemperatureAtIndex(int index, Function(SensorDataRow) updateFn) =>
      temperature[index] = updateFn(temperature[index]);

  ///  State fields for stateful widgets in this page.

  // Model for sideMenuView component.
  late SideMenuViewModel sideMenuViewModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
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
