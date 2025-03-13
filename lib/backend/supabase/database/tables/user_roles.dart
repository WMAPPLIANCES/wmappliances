import '../database.dart';

class UserRolesTable extends SupabaseTable<UserRolesRow> {
  @override
  String get tableName => 'user_roles';

  @override
  UserRolesRow createRow(Map<String, dynamic> data) => UserRolesRow(data);
}

class UserRolesRow extends SupabaseDataRow {
  UserRolesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserRolesTable();

  String get userRoleId => getField<String>('user_role_id')!;
  set userRoleId(String value) => setField<String>('user_role_id', value);

  String? get roleId => getField<String>('role_id');
  set roleId(String? value) => setField<String>('role_id', value);

  String? get roleName => getField<String>('role_name');
  set roleName(String? value) => setField<String>('role_name', value);
}
