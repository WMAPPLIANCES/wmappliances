import '../database.dart';

class PartSummaryAggregatedTable
    extends SupabaseTable<PartSummaryAggregatedRow> {
  @override
  String get tableName => 'part_summary_aggregated';

  @override
  PartSummaryAggregatedRow createRow(Map<String, dynamic> data) =>
      PartSummaryAggregatedRow(data);
}

class PartSummaryAggregatedRow extends SupabaseDataRow {
  PartSummaryAggregatedRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PartSummaryAggregatedTable();

  String get workOrderId => getField<String>('work_order_id')!;
  set workOrderId(String value) => setField<String>('work_order_id', value);

  int? get totalPartSum => getField<int>('total_part_sum');
  set totalPartSum(int? value) => setField<int>('total_part_sum', value);

  int? get totalPartArrivedSum => getField<int>('total_part_arrived_sum');
  set totalPartArrivedSum(int? value) =>
      setField<int>('total_part_arrived_sum', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
