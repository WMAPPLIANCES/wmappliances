import '../database.dart';

class RolesTable extends SupabaseTable<RolesRow> {
  @override
  String get tableName => 'roles';

  @override
  RolesRow createRow(Map<String, dynamic> data) => RolesRow(data);
}

class RolesRow extends SupabaseDataRow {
  RolesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RolesTable();

  String get roleId => getField<String>('role_id')!;
  set roleId(String value) => setField<String>('role_id', value);

  String get roleName => getField<String>('role_name')!;
  set roleName(String value) => setField<String>('role_name', value);
}
