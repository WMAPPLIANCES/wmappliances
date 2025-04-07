import '../database.dart';

class ChatSupportTable extends SupabaseTable<ChatSupportRow> {
  @override
  String get tableName => 'chat_support';

  @override
  ChatSupportRow createRow(Map<String, dynamic> data) => ChatSupportRow(data);
}

class ChatSupportRow extends SupabaseDataRow {
  ChatSupportRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatSupportTable();

  String get chatId => getField<String>('chat_id')!;
  set chatId(String value) => setField<String>('chat_id', value);

  DateTime? get startedAt => getField<DateTime>('started_at');
  set startedAt(DateTime? value) => setField<DateTime>('started_at', value);
}
