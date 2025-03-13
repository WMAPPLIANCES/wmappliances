import '../database.dart';

class WorkOrderChatsTable extends SupabaseTable<WorkOrderChatsRow> {
  @override
  String get tableName => 'work_order_chats';

  @override
  WorkOrderChatsRow createRow(Map<String, dynamic> data) =>
      WorkOrderChatsRow(data);
}

class WorkOrderChatsRow extends SupabaseDataRow {
  WorkOrderChatsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WorkOrderChatsTable();

  String get chatId => getField<String>('chat_id')!;
  set chatId(String value) => setField<String>('chat_id', value);

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

  String? get senderType => getField<String>('sender_type');
  set senderType(String? value) => setField<String>('sender_type', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
