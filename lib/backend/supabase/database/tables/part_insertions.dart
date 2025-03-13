import '../database.dart';

class PartInsertionsTable extends SupabaseTable<PartInsertionsRow> {
  @override
  String get tableName => 'part_insertions';

  @override
  PartInsertionsRow createRow(Map<String, dynamic> data) =>
      PartInsertionsRow(data);
}

class PartInsertionsRow extends SupabaseDataRow {
  PartInsertionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PartInsertionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

  int? get insertedPart => getField<int>('inserted_part');
  set insertedPart(int? value) => setField<int>('inserted_part', value);

  int? get insertedPartArrived => getField<int>('inserted_part_arrived');
  set insertedPartArrived(int? value) =>
      setField<int>('inserted_part_arrived', value);

  DateTime? get insertionTimestamp => getField<DateTime>('insertion_timestamp');
  set insertionTimestamp(DateTime? value) =>
      setField<DateTime>('insertion_timestamp', value);

  int? get subtractedPart => getField<int>('subtracted_part');
  set subtractedPart(int? value) => setField<int>('subtracted_part', value);

  int? get subtractedPartArrived => getField<int>('subtracted_part_arrived');
  set subtractedPartArrived(int? value) =>
      setField<int>('subtracted_part_arrived', value);
}
