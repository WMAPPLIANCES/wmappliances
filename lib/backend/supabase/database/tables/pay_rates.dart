import '../database.dart';

class PayRatesTable extends SupabaseTable<PayRatesRow> {
  @override
  String get tableName => 'pay_rates';

  @override
  PayRatesRow createRow(Map<String, dynamic> data) => PayRatesRow(data);
}

class PayRatesRow extends SupabaseDataRow {
  PayRatesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PayRatesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get itemCategory => getField<String>('item_category')!;
  set itemCategory(String value) => setField<String>('item_category', value);

  String get visitType => getField<String>('visit_type')!;
  set visitType(String value) => setField<String>('visit_type', value);

  double get amount => getField<double>('amount')!;
  set amount(double value) => setField<double>('amount', value);
}
