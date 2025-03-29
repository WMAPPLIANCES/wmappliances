import '../database.dart';

class RoleTable extends SupabaseTable<RoleRow> {
  @override
  String get tableName => 'role';

  @override
  RoleRow createRow(Map<String, dynamic> data) => RoleRow(data);
}

class RoleRow extends SupabaseDataRow {
  RoleRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RoleTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get scope => getField<String>('scope')!;
  set scope(String value) => setField<String>('scope', value);

  DateTime get createdAt => getField<DateTime>('createdAt')!;
  set createdAt(DateTime value) => setField<DateTime>('createdAt', value);

  DateTime get updatedAt => getField<DateTime>('updatedAt')!;
  set updatedAt(DateTime value) => setField<DateTime>('updatedAt', value);
}
