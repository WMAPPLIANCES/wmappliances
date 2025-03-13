import '../database.dart';

class ExampleDiagnosesTable extends SupabaseTable<ExampleDiagnosesRow> {
  @override
  String get tableName => 'example_diagnoses';

  @override
  ExampleDiagnosesRow createRow(Map<String, dynamic> data) =>
      ExampleDiagnosesRow(data);
}

class ExampleDiagnosesRow extends SupabaseDataRow {
  ExampleDiagnosesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ExampleDiagnosesTable();

  String get diagnosisId => getField<String>('diagnosis_id')!;
  set diagnosisId(String value) => setField<String>('diagnosis_id', value);

  String? get diagnosisNotes => getField<String>('diagnosis_notes');
  set diagnosisNotes(String? value) =>
      setField<String>('diagnosis_notes', value);

  List<String> get diagnosisPhotos => getListField<String>('diagnosis_photos');
  set diagnosisPhotos(List<String>? value) =>
      setListField<String>('diagnosis_photos', value);
}
