import '../database.dart';

class AiActionLogsTable extends SupabaseTable<AiActionLogsRow> {
  @override
  String get tableName => 'ai_action_logs';

  @override
  AiActionLogsRow createRow(Map<String, dynamic> data) => AiActionLogsRow(data);
}

class AiActionLogsRow extends SupabaseDataRow {
  AiActionLogsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AiActionLogsTable();

  String get actionId => getField<String>('action_id')!;
  set actionId(String value) => setField<String>('action_id', value);

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

  String? get actionType => getField<String>('action_type');
  set actionType(String? value) => setField<String>('action_type', value);

  String? get actionDetails => getField<String>('action_details');
  set actionDetails(String? value) => setField<String>('action_details', value);

  DateTime? get actionTimestamp => getField<DateTime>('action_timestamp');
  set actionTimestamp(DateTime? value) =>
      setField<DateTime>('action_timestamp', value);
}
