import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'work_order_status_widget.dart' show WorkOrderStatusWidget;
import 'package:flutter/material.dart';

class WorkOrderStatusModel extends FlutterFlowModel<WorkOrderStatusWidget> {
  ///  Local state fields for this component.

  String? statusSelected = 'Please Select Status';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<WorkOrdersRow>? requestRow;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<WorkOrdersRow>? workOrderCopy;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<WorkOrdersRow>? workOrder;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
