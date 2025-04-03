import '../database.dart';

class AppointmentsTable extends SupabaseTable<AppointmentsRow> {
  @override
  String get tableName => 'appointments';

  @override
  AppointmentsRow createRow(Map<String, dynamic> data) => AppointmentsRow(data);
}

class AppointmentsRow extends SupabaseDataRow {
  AppointmentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppointmentsTable();

  String get appointmentId => getField<String>('appointment_id')!;
  set appointmentId(String value) => setField<String>('appointment_id', value);

  String? get technicianId => getField<String>('technician_id');
  set technicianId(String? value) => setField<String>('technician_id', value);

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  double? get lat => getField<double>('lat');
  set lat(double? value) => setField<double>('lat', value);

  double? get lng => getField<double>('lng');
  set lng(double? value) => setField<double>('lng', value);

  DateTime? get scheduledStart => getField<DateTime>('scheduled_start');
  set scheduledStart(DateTime? value) =>
      setField<DateTime>('scheduled_start', value);

  DateTime? get scheduledEnd => getField<DateTime>('scheduled_end');
  set scheduledEnd(DateTime? value) =>
      setField<DateTime>('scheduled_end', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get itemsCount => getField<int>('items_count');
  set itemsCount(int? value) => setField<int>('items_count', value);

  String? get technicianName => getField<String>('technician_name');
  set technicianName(String? value) =>
      setField<String>('technician_name', value);

  String? get technicianColor => getField<String>('technician_color');
  set technicianColor(String? value) =>
      setField<String>('technician_color', value);

  int? get stopNumber => getField<int>('stop_number');
  set stopNumber(int? value) => setField<int>('stop_number', value);

  String? get technicianPhoto => getField<String>('technician_photo');
  set technicianPhoto(String? value) =>
      setField<String>('technician_photo', value);

  String? get clientName => getField<String>('client_name');
  set clientName(String? value) => setField<String>('client_name', value);

  List<dynamic> get items => getListField<dynamic>('items');
  set items(List<dynamic>? value) => setListField<dynamic>('items', value);

  DateTime? get appointmentDate => getField<DateTime>('appointment_date');
  set appointmentDate(DateTime? value) =>
      setField<DateTime>('appointment_date', value);

  String? get appointmentStatus => getField<String>('appointment_status');
  set appointmentStatus(String? value) =>
      setField<String>('appointment_status', value);

  String? get apt => getField<String>('apt');
  set apt(String? value) => setField<String>('apt', value);

  String? get clientPhone => getField<String>('client_phone');
  set clientPhone(String? value) => setField<String>('client_phone', value);

  bool? get completed => getField<bool>('completed');
  set completed(bool? value) => setField<bool>('completed', value);

  bool? get updated => getField<bool>('updated');
  set updated(bool? value) => setField<bool>('updated', value);

  bool? get followUp => getField<bool>('follow_up');
  set followUp(bool? value) => setField<bool>('follow_up', value);

  bool? get managerReview => getField<bool>('manager_review');
  set managerReview(bool? value) => setField<bool>('manager_review', value);

  bool? get helper => getField<bool>('helper');
  set helper(bool? value) => setField<bool>('helper', value);

  String? get scheduleId => getField<String>('schedule_id');
  set scheduleId(String? value) => setField<String>('schedule_id', value);

  List<dynamic> get itemsView => getListField<dynamic>('items_view');
  set itemsView(List<dynamic>? value) =>
      setListField<dynamic>('items_view', value);
}
