import '../database.dart';

class PartsAlternativeSuggestionsTable
    extends SupabaseTable<PartsAlternativeSuggestionsRow> {
  @override
  String get tableName => 'parts_alternative_suggestions';

  @override
  PartsAlternativeSuggestionsRow createRow(Map<String, dynamic> data) =>
      PartsAlternativeSuggestionsRow(data);
}

class PartsAlternativeSuggestionsRow extends SupabaseDataRow {
  PartsAlternativeSuggestionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PartsAlternativeSuggestionsTable();

  String get suggestionId => getField<String>('suggestion_id')!;
  set suggestionId(String value) => setField<String>('suggestion_id', value);

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

  String? get originalPart => getField<String>('original_part');
  set originalPart(String? value) => setField<String>('original_part', value);

  String? get suggestedPart => getField<String>('suggested_part');
  set suggestedPart(String? value) => setField<String>('suggested_part', value);

  String? get suggestionReason => getField<String>('suggestion_reason');
  set suggestionReason(String? value) =>
      setField<String>('suggestion_reason', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
