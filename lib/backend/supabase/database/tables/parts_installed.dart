import '../database.dart';

class PartsInstalledTable extends SupabaseTable<PartsInstalledRow> {
  @override
  String get tableName => 'parts_installed';

  @override
  PartsInstalledRow createRow(Map<String, dynamic> data) =>
      PartsInstalledRow(data);
}

class PartsInstalledRow extends SupabaseDataRow {
  PartsInstalledRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PartsInstalledTable();

  String get installId => getField<String>('install_id')!;
  set installId(String value) => setField<String>('install_id', value);

  String? get stockId => getField<String>('stock_id');
  set stockId(String? value) => setField<String>('stock_id', value);

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

  int? get installedQuantity => getField<int>('installed_quantity');
  set installedQuantity(int? value) =>
      setField<int>('installed_quantity', value);

  DateTime? get installDate => getField<DateTime>('install_date');
  set installDate(DateTime? value) => setField<DateTime>('install_date', value);
}
