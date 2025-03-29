import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String? get fullName => getField<String>('full_name');
  set fullName(String? value) => setField<String>('full_name', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String? get customerPhone => getField<String>('customer_phone');
  set customerPhone(String? value) => setField<String>('customer_phone', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get userPhoto => getField<String>('user_photo');
  set userPhoto(String? value) => setField<String>('user_photo', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  String? get technician => getField<String>('technician');
  set technician(String? value) => setField<String>('technician', value);

  String? get dispatch => getField<String>('dispatch');
  set dispatch(String? value) => setField<String>('dispatch', value);

  String? get qrcodeUrl => getField<String>('qrcode_url');
  set qrcodeUrl(String? value) => setField<String>('qrcode_url', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get officeManager => getField<String>('office_manager');
  set officeManager(String? value) => setField<String>('office_manager', value);

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);

  bool? get verified => getField<bool>('verified');
  set verified(bool? value) => setField<bool>('verified', value);

  String? get manager => getField<String>('manager');
  set manager(String? value) => setField<String>('manager', value);

  int? get pin => getField<int>('pin');
  set pin(int? value) => setField<int>('pin', value);

  bool? get officeComputer => getField<bool>('office_computer');
  set officeComputer(bool? value) => setField<bool>('office_computer', value);

  String? get technicianColor => getField<String>('technician_color');
  set technicianColor(String? value) =>
      setField<String>('technician_color', value);

  String? get officeLocation => getField<String>('office_location');
  set officeLocation(String? value) =>
      setField<String>('office_location', value);

  String? get colorCode => getField<String>('color_code');
  set colorCode(String? value) => setField<String>('color_code', value);
}
