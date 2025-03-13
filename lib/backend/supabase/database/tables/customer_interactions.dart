import '../database.dart';

class CustomerInteractionsTable extends SupabaseTable<CustomerInteractionsRow> {
  @override
  String get tableName => 'customer_interactions';

  @override
  CustomerInteractionsRow createRow(Map<String, dynamic> data) =>
      CustomerInteractionsRow(data);
}

class CustomerInteractionsRow extends SupabaseDataRow {
  CustomerInteractionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CustomerInteractionsTable();

  String get interactionId => getField<String>('interaction_id')!;
  set interactionId(String value) => setField<String>('interaction_id', value);

  String? get customerEmail => getField<String>('customer_email');
  set customerEmail(String? value) => setField<String>('customer_email', value);

  String? get customerPhone => getField<String>('customer_phone');
  set customerPhone(String? value) => setField<String>('customer_phone', value);

  String? get interactionType => getField<String>('interaction_type');
  set interactionType(String? value) =>
      setField<String>('interaction_type', value);

  String? get details => getField<String>('details');
  set details(String? value) => setField<String>('details', value);

  DateTime? get interactionTimestamp =>
      getField<DateTime>('interaction_timestamp');
  set interactionTimestamp(DateTime? value) =>
      setField<DateTime>('interaction_timestamp', value);

  String? get handledBy => getField<String>('handled_by');
  set handledBy(String? value) => setField<String>('handled_by', value);

  String? get resolutionStatus => getField<String>('resolution_status');
  set resolutionStatus(String? value) =>
      setField<String>('resolution_status', value);
}
