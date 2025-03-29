import '../database.dart';

class WorkOrdersTable extends SupabaseTable<WorkOrdersRow> {
  @override
  String get tableName => 'work_orders';

  @override
  WorkOrdersRow createRow(Map<String, dynamic> data) => WorkOrdersRow(data);
}

class WorkOrdersRow extends SupabaseDataRow {
  WorkOrdersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WorkOrdersTable();

  String get workOrderId => getField<String>('work_order_id')!;
  set workOrderId(String value) => setField<String>('work_order_id', value);

  String? get customerName => getField<String>('customer_name');
  set customerName(String? value) => setField<String>('customer_name', value);

  String? get customerPhone => getField<String>('customer_phone');
  set customerPhone(String? value) => setField<String>('customer_phone', value);

  String? get customerEmail => getField<String>('customer_email');
  set customerEmail(String? value) => setField<String>('customer_email', value);

  String? get tenantPhone => getField<String>('tenant_phone');
  set tenantPhone(String? value) => setField<String>('tenant_phone', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get apartmentNumber => getField<String>('apartment_number');
  set apartmentNumber(String? value) =>
      setField<String>('apartment_number', value);

  double? get lat => getField<double>('lat');
  set lat(double? value) => setField<double>('lat', value);

  double? get lng => getField<double>('lng');
  set lng(double? value) => setField<double>('lng', value);

  String? get workOrderStatus => getField<String>('work_order_status');
  set workOrderStatus(String? value) =>
      setField<String>('work_order_status', value);

  bool? get isAutomated => getField<bool>('is_automated');
  set isAutomated(bool? value) => setField<bool>('is_automated', value);

  String? get automationTrigger => getField<String>('automation_trigger');
  set automationTrigger(String? value) =>
      setField<String>('automation_trigger', value);

  DateTime? get scheduledDate => getField<DateTime>('scheduled_date');
  set scheduledDate(DateTime? value) =>
      setField<DateTime>('scheduled_date', value);

  PostgresTime? get startTime => getField<PostgresTime>('start_time');
  set startTime(PostgresTime? value) =>
      setField<PostgresTime>('start_time', value);

  PostgresTime? get endTime => getField<PostgresTime>('end_time');
  set endTime(PostgresTime? value) => setField<PostgresTime>('end_time', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get detail => getField<String>('detail');
  set detail(String? value) => setField<String>('detail', value);

  String? get tenantName => getField<String>('tenant_name');
  set tenantName(String? value) => setField<String>('tenant_name', value);

  String? get latLng => getField<String>('lat_lng');
  set latLng(String? value) => setField<String>('lat_lng', value);

  String? get typeService => getField<String>('type_service');
  set typeService(String? value) => setField<String>('type_service', value);

  String? get technician => getField<String>('technician');
  set technician(String? value) => setField<String>('technician', value);

  String? get nextAppointmentStatus =>
      getField<String>('next_appointment_status');
  set nextAppointmentStatus(String? value) =>
      setField<String>('next_appointment_status', value);

  double? get workOrderBarValue => getField<double>('work_order_bar_value');
  set workOrderBarValue(double? value) =>
      setField<double>('work_order_bar_value', value);

  String? get updateBy => getField<String>('update_by');
  set updateBy(String? value) => setField<String>('update_by', value);

  bool? get checkList => getField<bool>('check_list');
  set checkList(bool? value) => setField<bool>('check_list', value);

  String? get pinMakerUrl => getField<String>('pin_maker_url');
  set pinMakerUrl(String? value) => setField<String>('pin_maker_url', value);

  List<String> get items => getListField<String>('items');
  set items(List<String>? value) => setListField<String>('items', value);
}
