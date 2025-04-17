import '../database.dart';

class VPendingActionsTable extends SupabaseTable<VPendingActionsRow> {
  @override
  String get tableName => 'v_pending_actions';

  @override
  VPendingActionsRow createRow(Map<String, dynamic> data) =>
      VPendingActionsRow(data);
}

class VPendingActionsRow extends SupabaseDataRow {
  VPendingActionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VPendingActionsTable();

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

  String? get customerName => getField<String>('customer_name');
  set customerName(String? value) => setField<String>('customer_name', value);

  String? get typeService => getField<String>('type_service');
  set typeService(String? value) => setField<String>('type_service', value);

  bool? get completed => getField<bool>('completed');
  set completed(bool? value) => setField<bool>('completed', value);

  double? get totalBilledAmount => getField<double>('total_billed_amount');
  set totalBilledAmount(double? value) =>
      setField<double>('total_billed_amount', value);

  bool? get billingAuthorized => getField<bool>('billing_authorized');
  set billingAuthorized(bool? value) =>
      setField<bool>('billing_authorized', value);

  bool? get lowRatingRisk => getField<bool>('low_rating_risk');
  set lowRatingRisk(bool? value) => setField<bool>('low_rating_risk', value);

  String? get paymentStatus => getField<String>('payment_status');
  set paymentStatus(String? value) => setField<String>('payment_status', value);

  DateTime? get billingDate => getField<DateTime>('billing_date');
  set billingDate(DateTime? value) => setField<DateTime>('billing_date', value);

  String? get pendingAction => getField<String>('pending_action');
  set pendingAction(String? value) => setField<String>('pending_action', value);
}
