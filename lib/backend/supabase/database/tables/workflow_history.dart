import '../database.dart';

class WorkflowHistoryTable extends SupabaseTable<WorkflowHistoryRow> {
  @override
  String get tableName => 'workflow_history';

  @override
  WorkflowHistoryRow createRow(Map<String, dynamic> data) =>
      WorkflowHistoryRow(data);
}

class WorkflowHistoryRow extends SupabaseDataRow {
  WorkflowHistoryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WorkflowHistoryTable();

  String get versionId => getField<String>('versionId')!;
  set versionId(String value) => setField<String>('versionId', value);

  String get workflowId => getField<String>('workflowId')!;
  set workflowId(String value) => setField<String>('workflowId', value);

  String get authors => getField<String>('authors')!;
  set authors(String value) => setField<String>('authors', value);

  DateTime get createdAt => getField<DateTime>('createdAt')!;
  set createdAt(DateTime value) => setField<DateTime>('createdAt', value);

  DateTime get updatedAt => getField<DateTime>('updatedAt')!;
  set updatedAt(DateTime value) => setField<DateTime>('updatedAt', value);

  dynamic get nodes => getField<dynamic>('nodes')!;
  set nodes(dynamic value) => setField<dynamic>('nodes', value);

  dynamic get connections => getField<dynamic>('connections')!;
  set connections(dynamic value) => setField<dynamic>('connections', value);
}
