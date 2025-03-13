import '../database.dart';

class TechnicianRoutesTable extends SupabaseTable<TechnicianRoutesRow> {
  @override
  String get tableName => 'technician_routes';

  @override
  TechnicianRoutesRow createRow(Map<String, dynamic> data) =>
      TechnicianRoutesRow(data);
}

class TechnicianRoutesRow extends SupabaseDataRow {
  TechnicianRoutesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TechnicianRoutesTable();

  String get routeId => getField<String>('route_id')!;
  set routeId(String value) => setField<String>('route_id', value);

  String? get technicianId => getField<String>('technician_id');
  set technicianId(String? value) => setField<String>('technician_id', value);

  DateTime? get routeDate => getField<DateTime>('route_date');
  set routeDate(DateTime? value) => setField<DateTime>('route_date', value);

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

  int? get stopNumber => getField<int>('stop_number');
  set stopNumber(int? value) => setField<int>('stop_number', value);

  double? get startLocationLat => getField<double>('start_location_lat');
  set startLocationLat(double? value) =>
      setField<double>('start_location_lat', value);

  double? get startLocationLong => getField<double>('start_location_long');
  set startLocationLong(double? value) =>
      setField<double>('start_location_long', value);

  double? get endLocationLat => getField<double>('end_location_lat');
  set endLocationLat(double? value) =>
      setField<double>('end_location_lat', value);

  double? get endLocationLong => getField<double>('end_location_long');
  set endLocationLong(double? value) =>
      setField<double>('end_location_long', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
