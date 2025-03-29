import '../database.dart';

class TechniciansSchedulesTable extends SupabaseTable<TechniciansSchedulesRow> {
  @override
  String get tableName => 'technicians_schedules';

  @override
  TechniciansSchedulesRow createRow(Map<String, dynamic> data) =>
      TechniciansSchedulesRow(data);
}

class TechniciansSchedulesRow extends SupabaseDataRow {
  TechniciansSchedulesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TechniciansSchedulesTable();

  String get technicianUuid => getField<String>('technician_uuid')!;
  set technicianUuid(String value) =>
      setField<String>('technician_uuid', value);

  DateTime get appointmentDate => getField<DateTime>('appointment_date')!;
  set appointmentDate(DateTime value) =>
      setField<DateTime>('appointment_date', value);

  String? get techniciansName => getField<String>('technicians_name');
  set techniciansName(String? value) =>
      setField<String>('technicians_name', value);

  String? get techniciansPhoto => getField<String>('technicians_photo');
  set techniciansPhoto(String? value) =>
      setField<String>('technicians_photo', value);

  String? get technicianColor => getField<String>('technician_color');
  set technicianColor(String? value) =>
      setField<String>('technician_color', value);

  dynamic get allSchedules => getField<dynamic>('all_schedules');
  set allSchedules(dynamic value) => setField<dynamic>('all_schedules', value);
}
