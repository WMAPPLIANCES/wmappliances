import '../database.dart';

class WorkflowStatusTrackingTable
    extends SupabaseTable<WorkflowStatusTrackingRow> {
  @override
  String get tableName => 'workflow_status_tracking';

  @override
  WorkflowStatusTrackingRow createRow(Map<String, dynamic> data) =>
      WorkflowStatusTrackingRow(data);
}

class WorkflowStatusTrackingRow extends SupabaseDataRow {
  WorkflowStatusTrackingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WorkflowStatusTrackingTable();

  String get workflowId => getField<String>('workflow_id')!;
  set workflowId(String value) => setField<String>('workflow_id', value);

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

  String? get currentStatus => getField<String>('current_status');
  set currentStatus(String? value) => setField<String>('current_status', value);

  String? get actionTriggered => getField<String>('action_triggered');
  set actionTriggered(String? value) =>
      setField<String>('action_triggered', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
