import '../database.dart';

class PayoutsTable extends SupabaseTable<PayoutsRow> {
  @override
  String get tableName => 'payouts';

  @override
  PayoutsRow createRow(Map<String, dynamic> data) => PayoutsRow(data);
}

class PayoutsRow extends SupabaseDataRow {
  PayoutsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PayoutsTable();

  String get batchId => getField<String>('batch_id')!;
  set batchId(String value) => setField<String>('batch_id', value);

  String? get technicianUuid => getField<String>('technician_uuid');
  set technicianUuid(String? value) =>
      setField<String>('technician_uuid', value);

  DateTime? get paidAt => getField<DateTime>('paid_at');
  set paidAt(DateTime? value) => setField<DateTime>('paid_at', value);

  double? get totalAmount => getField<double>('total_amount');
  set totalAmount(double? value) => setField<double>('total_amount', value);
}
