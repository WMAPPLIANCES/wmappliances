import '../database.dart';

class StockPartsTable extends SupabaseTable<StockPartsRow> {
  @override
  String get tableName => 'stock_parts';

  @override
  StockPartsRow createRow(Map<String, dynamic> data) => StockPartsRow(data);
}

class StockPartsRow extends SupabaseDataRow {
  StockPartsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StockPartsTable();

  String get stockId => getField<String>('stock_id')!;
  set stockId(String value) => setField<String>('stock_id', value);

  String get partName => getField<String>('part_name')!;
  set partName(String value) => setField<String>('part_name', value);

  String get partNumber => getField<String>('part_number')!;
  set partNumber(String value) => setField<String>('part_number', value);

  int? get quantityInStock => getField<int>('quantity_in_stock');
  set quantityInStock(int? value) => setField<int>('quantity_in_stock', value);

  DateTime? get restockDate => getField<DateTime>('restock_date');
  set restockDate(DateTime? value) => setField<DateTime>('restock_date', value);

  int? get minimumQuantity => getField<int>('minimum_quantity');
  set minimumQuantity(int? value) => setField<int>('minimum_quantity', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  List<String> get partImage => getListField<String>('part_image');
  set partImage(List<String>? value) =>
      setListField<String>('part_image', value);

  String? get details => getField<String>('details');
  set details(String? value) => setField<String>('details', value);

  double? get partPrice => getField<double>('part_price');
  set partPrice(double? value) => setField<double>('part_price', value);

  String? get partLocation => getField<String>('part_location');
  set partLocation(String? value) => setField<String>('part_location', value);

  String? get qrCode => getField<String>('qr_code');
  set qrCode(String? value) => setField<String>('qr_code', value);

  String? get imagePart => getField<String>('image_part');
  set imagePart(String? value) => setField<String>('image_part', value);

  String? get compatibleModelNumber =>
      getField<String>('compatible_model_number');
  set compatibleModelNumber(String? value) =>
      setField<String>('compatible_model_number', value);

  String? get color => getField<String>('color');
  set color(String? value) => setField<String>('color', value);

  String? get iten => getField<String>('iten');
  set iten(String? value) => setField<String>('iten', value);

  String? get createBy => getField<String>('create_by');
  set createBy(String? value) => setField<String>('create_by', value);

  String? get color2 => getField<String>('color2');
  set color2(String? value) => setField<String>('color2', value);

  String? get partUrl => getField<String>('part_url');
  set partUrl(String? value) => setField<String>('part_url', value);

  String? get userUuid => getField<String>('user_uuid');
  set userUuid(String? value) => setField<String>('user_uuid', value);

  bool? get printed => getField<bool>('printed');
  set printed(bool? value) => setField<bool>('printed', value);

  String? get typePart => getField<String>('type_part');
  set typePart(String? value) => setField<String>('type_part', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);
}
