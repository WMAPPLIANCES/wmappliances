import '../database.dart';

class PhotosTable extends SupabaseTable<PhotosRow> {
  @override
  String get tableName => 'photos';

  @override
  PhotosRow createRow(Map<String, dynamic> data) => PhotosRow(data);
}

class PhotosRow extends SupabaseDataRow {
  PhotosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PhotosTable();

  String get photoId => getField<String>('photo_id')!;
  set photoId(String value) => setField<String>('photo_id', value);

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

  String? get uploadedBy => getField<String>('uploaded_by');
  set uploadedBy(String? value) => setField<String>('uploaded_by', value);

  DateTime? get uploadedAt => getField<DateTime>('uploaded_at');
  set uploadedAt(DateTime? value) => setField<DateTime>('uploaded_at', value);

  List<String> get photosWorkOrder => getListField<String>('photos_work_order');
  set photosWorkOrder(List<String>? value) =>
      setListField<String>('photos_work_order', value);

  String? get diagnosisId => getField<String>('diagnosis_id');
  set diagnosisId(String? value) => setField<String>('diagnosis_id', value);
}
