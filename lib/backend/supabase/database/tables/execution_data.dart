import '../database.dart';

class ExecutionDataTable extends SupabaseTable<ExecutionDataRow> {
  @override
  String get tableName => 'execution_data';

  @override
  ExecutionDataRow createRow(Map<String, dynamic> data) =>
      ExecutionDataRow(data);
}

class ExecutionDataRow extends SupabaseDataRow {
  ExecutionDataRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ExecutionDataTable();

  int get executionId => getField<int>('executionId')!;
  set executionId(int value) => setField<int>('executionId', value);

  dynamic get workflowData => getField<dynamic>('workflowData')!;
  set workflowData(dynamic value) => setField<dynamic>('workflowData', value);

  String get dataField => getField<String>('data')!;
  set dataField(String value) => setField<String>('data', value);
}
