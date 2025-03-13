import '../database.dart';

class TicketsTable extends SupabaseTable<TicketsRow> {
  @override
  String get tableName => 'tickets';

  @override
  TicketsRow createRow(Map<String, dynamic> data) => TicketsRow(data);
}

class TicketsRow extends SupabaseDataRow {
  TicketsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TicketsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

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

  String? get issue => getField<String>('issue');
  set issue(String? value) => setField<String>('issue', value);

  String? get issueCategory => getField<String>('issue_category');
  set issueCategory(String? value) => setField<String>('issue_category', value);

  String? get summary => getField<String>('summary');
  set summary(String? value) => setField<String>('summary', value);

  String? get technicianNotes => getField<String>('technician_notes');
  set technicianNotes(String? value) =>
      setField<String>('technician_notes', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get assignedDispatch => getField<String>('assigned_dispatch');
  set assignedDispatch(String? value) =>
      setField<String>('assigned_dispatch', value);

  String? get priority => getField<String>('priority');
  set priority(String? value) => setField<String>('priority', value);

  String? get resolution => getField<String>('resolution');
  set resolution(String? value) => setField<String>('resolution', value);

  String? get ticketId => getField<String>('ticket_id');
  set ticketId(String? value) => setField<String>('ticket_id', value);

  String? get wmId => getField<String>('wm_id');
  set wmId(String? value) => setField<String>('wm_id', value);

  String? get dispatchPhoto => getField<String>('dispatch_photo');
  set dispatchPhoto(String? value) => setField<String>('dispatch_photo', value);
}
