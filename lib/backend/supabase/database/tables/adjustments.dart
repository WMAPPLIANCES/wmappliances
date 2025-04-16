import '../database.dart';

class AdjustmentsTable extends SupabaseTable<AdjustmentsRow> {
  @override
  String get tableName => 'adjustments';

  @override
  AdjustmentsRow createRow(Map<String, dynamic> data) => AdjustmentsRow(data);
}

class AdjustmentsRow extends SupabaseDataRow {
  AdjustmentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AdjustmentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get originalPaymentId => getField<int>('original_payment_id');
  set originalPaymentId(int? value) =>
      setField<int>('original_payment_id', value);

  int? get newPaymentId => getField<int>('new_payment_id');
  set newPaymentId(int? value) => setField<int>('new_payment_id', value);

  String? get adjustmentReason => getField<String>('adjustment_reason');
  set adjustmentReason(String? value) =>
      setField<String>('adjustment_reason', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
