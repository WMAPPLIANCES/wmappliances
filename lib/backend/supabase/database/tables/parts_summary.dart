import '../database.dart';

class PartsSummaryTable extends SupabaseTable<PartsSummaryRow> {
  @override
  String get tableName => 'parts_summary';

  @override
  PartsSummaryRow createRow(Map<String, dynamic> data) => PartsSummaryRow(data);
}

class PartsSummaryRow extends SupabaseDataRow {
  PartsSummaryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PartsSummaryTable();

  String get diagnosisId => getField<String>('diagnosis_id')!;
  set diagnosisId(String value) => setField<String>('diagnosis_id', value);

  double get totalSoldPrice => getField<double>('total_sold_price')!;
  set totalSoldPrice(double value) =>
      setField<double>('total_sold_price', value);

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

  DateTime? get lastUpdatedAt => getField<DateTime>('last_updated_at');
  set lastUpdatedAt(DateTime? value) =>
      setField<DateTime>('last_updated_at', value);
}
