import '../database.dart';

class ExamplePhotosTable extends SupabaseTable<ExamplePhotosRow> {
  @override
  String get tableName => 'example_photos';

  @override
  ExamplePhotosRow createRow(Map<String, dynamic> data) =>
      ExamplePhotosRow(data);
}

class ExamplePhotosRow extends SupabaseDataRow {
  ExamplePhotosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ExamplePhotosTable();

  String get photoId => getField<String>('photo_id')!;
  set photoId(String value) => setField<String>('photo_id', value);

  String? get diagnosisRef => getField<String>('diagnosis_ref');
  set diagnosisRef(String? value) => setField<String>('diagnosis_ref', value);

  List<String> get photoUrls => getListField<String>('photo_urls');
  set photoUrls(List<String>? value) =>
      setListField<String>('photo_urls', value);

  DateTime? get uploadedAt => getField<DateTime>('uploaded_at');
  set uploadedAt(DateTime? value) => setField<DateTime>('uploaded_at', value);
}
