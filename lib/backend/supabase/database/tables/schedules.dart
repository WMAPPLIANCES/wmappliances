import '../database.dart';

class SchedulesTable extends SupabaseTable<SchedulesRow> {
  @override
  String get tableName => 'schedules';

  @override
  SchedulesRow createRow(Map<String, dynamic> data) => SchedulesRow(data);
}

class SchedulesRow extends SupabaseDataRow {
  SchedulesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SchedulesTable();

  String get scheduleId => getField<String>('schedule_id')!;
  set scheduleId(String value) => setField<String>('schedule_id', value);

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

  DateTime? get routeDate => getField<DateTime>('route_date');
  set routeDate(DateTime? value) => setField<DateTime>('route_date', value);

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

  DateTime? get appointmentDate => getField<DateTime>('appointment_date');
  set appointmentDate(DateTime? value) =>
      setField<DateTime>('appointment_date', value);

  String? get windowTime => getField<String>('window_time');
  set windowTime(String? value) => setField<String>('window_time', value);

  bool? get windowTimeChanged => getField<bool>('window_time_changed');
  set windowTimeChanged(bool? value) =>
      setField<bool>('window_time_changed', value);

  String? get appointmentStatus => getField<String>('appointment_status');
  set appointmentStatus(String? value) =>
      setField<String>('appointment_status', value);

  String? get customerAddress => getField<String>('customer_address');
  set customerAddress(String? value) =>
      setField<String>('customer_address', value);

  double? get customerLat => getField<double>('customer_lat');
  set customerLat(double? value) => setField<double>('customer_lat', value);

  double? get customerLng => getField<double>('customer_lng');
  set customerLng(double? value) => setField<double>('customer_lng', value);

  String? get customerPhone => getField<String>('customer_phone');
  set customerPhone(String? value) => setField<String>('customer_phone', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  DateTime? get appointmentStart => getField<DateTime>('appointment_start');
  set appointmentStart(DateTime? value) =>
      setField<DateTime>('appointment_start', value);

  DateTime? get appointmentEnd => getField<DateTime>('appointment_end');
  set appointmentEnd(DateTime? value) =>
      setField<DateTime>('appointment_end', value);

  DateTime? get startTime => getField<DateTime>('start_time');
  set startTime(DateTime? value) => setField<DateTime>('start_time', value);

  DateTime? get endTime => getField<DateTime>('end_time');
  set endTime(DateTime? value) => setField<DateTime>('end_time', value);

  bool? get helper => getField<bool>('helper');
  set helper(bool? value) => setField<bool>('helper', value);

  List<String> get itens => getListField<String>('itens');
  set itens(List<String>? value) => setListField<String>('itens', value);

  String? get techniciansName => getField<String>('technicians_name');
  set techniciansName(String? value) =>
      setField<String>('technicians_name', value);

  String? get techniciansPhoto => getField<String>('technicians_photo');
  set techniciansPhoto(String? value) =>
      setField<String>('technicians_photo', value);

  String? get appointmentType => getField<String>('appointment_type');
  set appointmentType(String? value) =>
      setField<String>('appointment_type', value);

  String? get technicians => getField<String>('technicians');
  set technicians(String? value) => setField<String>('technicians', value);

  bool? get completed => getField<bool>('completed');
  set completed(bool? value) => setField<bool>('completed', value);

  bool? get updateReview => getField<bool>('update_review');
  set updateReview(bool? value) => setField<bool>('update_review', value);

  String? get customerName => getField<String>('customer_name');
  set customerName(String? value) => setField<String>('customer_name', value);

  String? get apt => getField<String>('apt');
  set apt(String? value) => setField<String>('apt', value);
}
