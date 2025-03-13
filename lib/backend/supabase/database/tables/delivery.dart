import '../database.dart';

class DeliveryTable extends SupabaseTable<DeliveryRow> {
  @override
  String get tableName => 'delivery';

  @override
  DeliveryRow createRow(Map<String, dynamic> data) => DeliveryRow(data);
}

class DeliveryRow extends SupabaseDataRow {
  DeliveryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DeliveryTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get trackingNumber => getField<String>('tracking_number')!;
  set trackingNumber(String value) =>
      setField<String>('tracking_number', value);

  String? get photoTracking => getField<String>('photo_tracking');
  set photoTracking(String? value) => setField<String>('photo_tracking', value);

  String? get photoItens => getField<String>('photo_itens');
  set photoItens(String? value) => setField<String>('photo_itens', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  String? get uuid => getField<String>('uuid');
  set uuid(String? value) => setField<String>('uuid', value);

  String? get partReceipt => getField<String>('part_receipt');
  set partReceipt(String? value) => setField<String>('part_receipt', value);
}
