import '../database.dart';

class TechnicianEarningsTable extends SupabaseTable<TechnicianEarningsRow> {
  @override
  String get tableName => 'technician_earnings';

  @override
  TechnicianEarningsRow createRow(Map<String, dynamic> data) =>
      TechnicianEarningsRow(data);
}

class TechnicianEarningsRow extends SupabaseDataRow {
  TechnicianEarningsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TechnicianEarningsTable();

  String? get technicianUuid => getField<String>('technician_uuid');
  set technicianUuid(String? value) =>
      setField<String>('technician_uuid', value);

  String? get technicianName => getField<String>('technician_name');
  set technicianName(String? value) =>
      setField<String>('technician_name', value);

  double? get totalEarned => getField<double>('total_earned');
  set totalEarned(double? value) => setField<double>('total_earned', value);

  DateTime? get periodStart => getField<DateTime>('period_start');
  set periodStart(DateTime? value) => setField<DateTime>('period_start', value);

  DateTime? get periodEnd => getField<DateTime>('period_end');
  set periodEnd(DateTime? value) => setField<DateTime>('period_end', value);
}
