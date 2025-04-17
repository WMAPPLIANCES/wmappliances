import '../database.dart';

class VBillingDashboardTable extends SupabaseTable<VBillingDashboardRow> {
  @override
  String get tableName => 'v_billing_dashboard';

  @override
  VBillingDashboardRow createRow(Map<String, dynamic> data) =>
      VBillingDashboardRow(data);
}

class VBillingDashboardRow extends SupabaseDataRow {
  VBillingDashboardRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VBillingDashboardTable();

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

  String? get customerName => getField<String>('customer_name');
  set customerName(String? value) => setField<String>('customer_name', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get typeService => getField<String>('type_service');
  set typeService(String? value) => setField<String>('type_service', value);

  String? get workOrderStatus => getField<String>('work_order_status');
  set workOrderStatus(String? value) =>
      setField<String>('work_order_status', value);

  bool? get completed => getField<bool>('completed');
  set completed(bool? value) => setField<bool>('completed', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get scheduledDate => getField<DateTime>('scheduled_date');
  set scheduledDate(DateTime? value) =>
      setField<DateTime>('scheduled_date', value);

  String? get technician => getField<String>('technician');
  set technician(String? value) => setField<String>('technician', value);

  double? get totalBilledAmount => getField<double>('total_billed_amount');
  set totalBilledAmount(double? value) =>
      setField<double>('total_billed_amount', value);

  bool? get billingAuthorized => getField<bool>('billing_authorized');
  set billingAuthorized(bool? value) =>
      setField<bool>('billing_authorized', value);

  bool? get lowRatingRisk => getField<bool>('low_rating_risk');
  set lowRatingRisk(bool? value) => setField<bool>('low_rating_risk', value);

  DateTime? get billingDate => getField<DateTime>('billing_date');
  set billingDate(DateTime? value) => setField<DateTime>('billing_date', value);

  String? get paymentStatus => getField<String>('payment_status');
  set paymentStatus(String? value) => setField<String>('payment_status', value);

  DateTime? get paymentReceivedDate =>
      getField<DateTime>('payment_received_date');
  set paymentReceivedDate(DateTime? value) =>
      setField<DateTime>('payment_received_date', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  double? get daysSinceBilled => getField<double>('days_since_billed');
  set daysSinceBilled(double? value) =>
      setField<double>('days_since_billed', value);

  bool? get isOverdue => getField<bool>('is_overdue');
  set isOverdue(bool? value) => setField<bool>('is_overdue', value);
}
