import '../database.dart';

class PartsTotalPriceTable extends SupabaseTable<PartsTotalPriceRow> {
  @override
  String get tableName => 'parts_total_price';

  @override
  PartsTotalPriceRow createRow(Map<String, dynamic> data) =>
      PartsTotalPriceRow(data);
}

class PartsTotalPriceRow extends SupabaseDataRow {
  PartsTotalPriceRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PartsTotalPriceTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get diagnosisId => getField<String>('diagnosis_id')!;
  set diagnosisId(String value) => setField<String>('diagnosis_id', value);

  double? get totalPrice => getField<double>('total_price');
  set totalPrice(double? value) => setField<double>('total_price', value);

  String? get typeService => getField<String>('type_service');
  set typeService(String? value) => setField<String>('type_service', value);

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

  String? get iten => getField<String>('iten');
  set iten(String? value) => setField<String>('iten', value);
}
