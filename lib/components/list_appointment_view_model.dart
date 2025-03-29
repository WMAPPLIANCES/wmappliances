import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_appointment_view_widget.dart' show ListAppointmentViewWidget;
import 'package:flutter/material.dart';

class ListAppointmentViewModel
    extends FlutterFlowModel<ListAppointmentViewWidget> {
  ///  Local state fields for this component.

  bool viewDetail = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Icon widget.
  List<WorkOrdersRow>? workOrder;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
