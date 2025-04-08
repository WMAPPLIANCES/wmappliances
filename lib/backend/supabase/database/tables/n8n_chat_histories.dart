import '../database.dart';

class N8nChatHistoriesTable extends SupabaseTable<N8nChatHistoriesRow> {
  @override
  String get tableName => 'n8n_chat_histories';

  @override
  N8nChatHistoriesRow createRow(Map<String, dynamic> data) =>
      N8nChatHistoriesRow(data);
}

class N8nChatHistoriesRow extends SupabaseDataRow {
  N8nChatHistoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => N8nChatHistoriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get sessionId => getField<String>('session_id')!;
  set sessionId(String value) => setField<String>('session_id', value);

  dynamic get message => getField<dynamic>('message')!;
  set message(dynamic value) => setField<dynamic>('message', value);
}
