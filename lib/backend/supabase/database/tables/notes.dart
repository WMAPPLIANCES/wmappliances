import '../database.dart';

class NotesTable extends SupabaseTable<NotesRow> {
  @override
  String get tableName => 'notes';

  @override
  NotesRow createRow(Map<String, dynamic> data) => NotesRow(data);
}

class NotesRow extends SupabaseDataRow {
  NotesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotesTable();

  String get noteId => getField<String>('note_id')!;
  set noteId(String value) => setField<String>('note_id', value);

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

  String get noteContent => getField<String>('note_content')!;
  set noteContent(String value) => setField<String>('note_content', value);

  String? get visibility => getField<String>('visibility');
  set visibility(String? value) => setField<String>('visibility', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get createBy => getField<String>('create_by');
  set createBy(String? value) => setField<String>('create_by', value);

  String? get diagnosesId => getField<String>('diagnoses_id');
  set diagnosesId(String? value) => setField<String>('diagnoses_id', value);

  String? get createByImage => getField<String>('create_by_image');
  set createByImage(String? value) =>
      setField<String>('create_by_image', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get ticketsId => getField<String>('tickets_id');
  set ticketsId(String? value) => setField<String>('tickets_id', value);

  bool? get priority => getField<bool>('priority');
  set priority(bool? value) => setField<bool>('priority', value);

  bool? get dispatchNote => getField<bool>('dispatch_note');
  set dispatchNote(bool? value) => setField<bool>('dispatch_note', value);

  String? get taskOwner => getField<String>('task_owner');
  set taskOwner(String? value) => setField<String>('task_owner', value);
}
