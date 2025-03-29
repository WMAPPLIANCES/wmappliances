import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'appointment_today_view_widget.dart' show AppointmentTodayViewWidget;
import 'package:flutter/material.dart';

class AppointmentTodayViewModel
    extends FlutterFlowModel<AppointmentTodayViewWidget> {
  ///  Local state fields for this page.

  String queryTech = 'tecnico';

  DateTime? appointmentDate;

  List<AllSchedulesStruct> queryToday = [];
  void addToQueryToday(AllSchedulesStruct item) => queryToday.add(item);
  void removeFromQueryToday(AllSchedulesStruct item) => queryToday.remove(item);
  void removeAtIndexFromQueryToday(int index) => queryToday.removeAt(index);
  void insertAtIndexInQueryToday(int index, AllSchedulesStruct item) =>
      queryToday.insert(index, item);
  void updateQueryTodayAtIndex(
          int index, Function(AllSchedulesStruct) updateFn) =>
      queryToday[index] = updateFn(queryToday[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}
}
