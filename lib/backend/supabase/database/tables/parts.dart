import '../database.dart';

class PartsTable extends SupabaseTable<PartsRow> {
  @override
  String get tableName => 'parts';

  @override
  PartsRow createRow(Map<String, dynamic> data) => PartsRow(data);
}

class PartsRow extends SupabaseDataRow {
  PartsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PartsTable();

  String get partId => getField<String>('part_id')!;
  set partId(String value) => setField<String>('part_id', value);

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

  String? get partName => getField<String>('part_name');
  set partName(String? value) => setField<String>('part_name', value);

  String? get partNumber => getField<String>('part_number');
  set partNumber(String? value) => setField<String>('part_number', value);

  int? get quantity => getField<int>('quantity');
  set quantity(int? value) => setField<int>('quantity', value);

  String? get partStatus => getField<String>('part_status');
  set partStatus(String? value) => setField<String>('part_status', value);

  String? get details => getField<String>('details');
  set details(String? value) => setField<String>('details', value);

  String? get iten => getField<String>('iten');
  set iten(String? value) => setField<String>('iten', value);

  DateTime? get createDate => getField<DateTime>('create_date');
  set createDate(DateTime? value) => setField<DateTime>('create_date', value);

  DateTime? get arrivedDate => getField<DateTime>('arrived_date');
  set arrivedDate(DateTime? value) => setField<DateTime>('arrived_date', value);

  bool? get stock => getField<bool>('stock');
  set stock(bool? value) => setField<bool>('stock', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);

  String? get diagnosisId => getField<String>('diagnosis_id');
  set diagnosisId(String? value) => setField<String>('diagnosis_id', value);

  String? get tutorial => getField<String>('tutorial');
  set tutorial(String? value) => setField<String>('tutorial', value);

  bool? get partInStock => getField<bool>('part_in_stock');
  set partInStock(bool? value) => setField<bool>('part_in_stock', value);

  int? get totalPart => getField<int>('total_part');
  set totalPart(int? value) => setField<int>('total_part', value);

  bool? get requested => getField<bool>('requested');
  set requested(bool? value) => setField<bool>('requested', value);

  bool? get arrived => getField<bool>('arrived');
  set arrived(bool? value) => setField<bool>('arrived', value);

  int? get totalPartArrived => getField<int>('total_part_arrived');
  set totalPartArrived(int? value) =>
      setField<int>('total_part_arrived', value);

  double? get partCost => getField<double>('part_cost');
  set partCost(double? value) => setField<double>('part_cost', value);

  String? get partPaid => getField<String>('part_paid');
  set partPaid(String? value) => setField<String>('part_paid', value);

  bool? get approved => getField<bool>('approved');
  set approved(bool? value) => setField<bool>('approved', value);

  bool? get denied => getField<bool>('denied');
  set denied(bool? value) => setField<bool>('denied', value);

  String? get partTaken => getField<String>('part_taken');
  set partTaken(String? value) => setField<String>('part_taken', value);

  double? get partSoldPrice => getField<double>('part_sold_price');
  set partSoldPrice(double? value) =>
      setField<double>('part_sold_price', value);

  List<String> get partImage => getListField<String>('part_image');
  set partImage(List<String>? value) =>
      setListField<String>('part_image', value);

  String? get compatibleModelNumber =>
      getField<String>('compatible_model_number');
  set compatibleModelNumber(String? value) =>
      setField<String>('compatible_model_number', value);

  double? get progressBarValue => getField<double>('progress_bar_value');
  set progressBarValue(double? value) =>
      setField<double>('progress_bar_value', value);

  String? get progressBarName => getField<String>('progress_bar_name');
  set progressBarName(String? value) =>
      setField<String>('progress_bar_name', value);

  String? get progressColor => getField<String>('progress_color');
  set progressColor(String? value) => setField<String>('progress_color', value);

  bool? get secondReview => getField<bool>('second_review');
  set secondReview(bool? value) => setField<bool>('second_review', value);

  String? get updateBy => getField<String>('update_by');
  set updateBy(String? value) => setField<String>('update_by', value);
}
