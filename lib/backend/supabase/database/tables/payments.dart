import '../database.dart';

class PaymentsTable extends SupabaseTable<PaymentsRow> {
  @override
  String get tableName => 'payments';

  @override
  PaymentsRow createRow(Map<String, dynamic> data) => PaymentsRow(data);
}

class PaymentsRow extends SupabaseDataRow {
  PaymentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PaymentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get diagnosisId => getField<String>('diagnosis_id');
  set diagnosisId(String? value) => setField<String>('diagnosis_id', value);

  String? get technicianUuid => getField<String>('technician_uuid');
  set technicianUuid(String? value) =>
      setField<String>('technician_uuid', value);

  double get amount => getField<double>('amount')!;
  set amount(double value) => setField<double>('amount', value);

  String? get reason => getField<String>('reason');
  set reason(String? value) => setField<String>('reason', value);

  String? get updateSeq => getField<String>('update_seq');
  set updateSeq(String? value) => setField<String>('update_seq', value);

  int? get linkedPaymentId => getField<int>('linked_payment_id');
  set linkedPaymentId(int? value) => setField<int>('linked_payment_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  bool? get paid => getField<bool>('paid');
  set paid(bool? value) => setField<bool>('paid', value);

  String? get payoutBatchId => getField<String>('payout_batch_id');
  set payoutBatchId(String? value) =>
      setField<String>('payout_batch_id', value);
}
