import '../database.dart';

class UpdateRatesTable extends SupabaseTable<UpdateRatesRow> {
  @override
  String get tableName => 'update_rates';

  @override
  UpdateRatesRow createRow(Map<String, dynamic> data) => UpdateRatesRow(data);
}

class UpdateRatesRow extends SupabaseDataRow {
  UpdateRatesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UpdateRatesTable();

  String get updateSeq => getField<String>('update_seq')!;
  set updateSeq(String value) => setField<String>('update_seq', value);

  double get additionAmt => getField<double>('addition_amt')!;
  set additionAmt(double value) => setField<double>('addition_amt', value);

  double get discountAmt => getField<double>('discount_amt')!;
  set discountAmt(double value) => setField<double>('discount_amt', value);
}
