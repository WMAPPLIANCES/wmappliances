import '../database.dart';

class TechnicianLocationsTable extends SupabaseTable<TechnicianLocationsRow> {
  @override
  String get tableName => 'technician_locations';

  @override
  TechnicianLocationsRow createRow(Map<String, dynamic> data) =>
      TechnicianLocationsRow(data);
}

class TechnicianLocationsRow extends SupabaseDataRow {
  TechnicianLocationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TechnicianLocationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get technicianId => getField<String>('technician_id')!;
  set technicianId(String value) => setField<String>('technician_id', value);

  double? get latitude => getField<double>('latitude');
  set latitude(double? value) => setField<double>('latitude', value);

  double? get longitude => getField<double>('longitude');
  set longitude(double? value) => setField<double>('longitude', value);

  double? get accuracy => getField<double>('accuracy');
  set accuracy(double? value) => setField<double>('accuracy', value);

  double? get speed => getField<double>('speed');
  set speed(double? value) => setField<double>('speed', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
