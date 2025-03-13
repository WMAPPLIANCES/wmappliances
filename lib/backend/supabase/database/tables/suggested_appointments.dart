import '../database.dart';

class SuggestedAppointmentsTable
    extends SupabaseTable<SuggestedAppointmentsRow> {
  @override
  String get tableName => 'suggested_appointments';

  @override
  SuggestedAppointmentsRow createRow(Map<String, dynamic> data) =>
      SuggestedAppointmentsRow(data);
}

class SuggestedAppointmentsRow extends SupabaseDataRow {
  SuggestedAppointmentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SuggestedAppointmentsTable();

  String get appointmentId => getField<String>('appointment_id')!;
  set appointmentId(String value) => setField<String>('appointment_id', value);

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

  DateTime? get suggestedDate1 => getField<DateTime>('suggested_date_1');
  set suggestedDate1(DateTime? value) =>
      setField<DateTime>('suggested_date_1', value);

  String? get timeWindow1 => getField<String>('time_window_1');
  set timeWindow1(String? value) => setField<String>('time_window_1', value);

  DateTime? get suggestedDate2 => getField<DateTime>('suggested_date_2');
  set suggestedDate2(DateTime? value) =>
      setField<DateTime>('suggested_date_2', value);

  String? get timeWindow2 => getField<String>('time_window_2');
  set timeWindow2(String? value) => setField<String>('time_window_2', value);

  DateTime? get suggestedDate3 => getField<DateTime>('suggested_date_3');
  set suggestedDate3(DateTime? value) =>
      setField<DateTime>('suggested_date_3', value);

  String? get timeWindow3 => getField<String>('time_window_3');
  set timeWindow3(String? value) => setField<String>('time_window_3', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get confirmationDate => getField<DateTime>('confirmation_date');
  set confirmationDate(DateTime? value) =>
      setField<DateTime>('confirmation_date', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
