import '../database.dart';

class TechniciansTable extends SupabaseTable<TechniciansRow> {
  @override
  String get tableName => 'technicians';

  @override
  TechniciansRow createRow(Map<String, dynamic> data) => TechniciansRow(data);
}

class TechniciansRow extends SupabaseDataRow {
  TechniciansRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TechniciansTable();

  String get technicianId => getField<String>('technician_id')!;
  set technicianId(String value) => setField<String>('technician_id', value);

  String? get fullName => getField<String>('full_name');
  set fullName(String? value) => setField<String>('full_name', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get userPhoto => getField<String>('user_photo');
  set userPhoto(String? value) => setField<String>('user_photo', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get users => getField<String>('users');
  set users(String? value) => setField<String>('users', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
