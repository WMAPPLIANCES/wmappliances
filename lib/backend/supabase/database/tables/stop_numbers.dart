import '../database.dart';

class StopNumbersTable extends SupabaseTable<StopNumbersRow> {
  @override
  String get tableName => 'stop_numbers';

  @override
  StopNumbersRow createRow(Map<String, dynamic> data) => StopNumbersRow(data);
}

class StopNumbersRow extends SupabaseDataRow {
  StopNumbersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StopNumbersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get stopUrl => getField<String>('stop_url');
  set stopUrl(String? value) => setField<String>('stop_url', value);

  int? get stopNumber => getField<int>('stop_number');
  set stopNumber(int? value) => setField<int>('stop_number', value);
}
