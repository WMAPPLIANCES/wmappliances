import '../database.dart';

class SensorsTable extends SupabaseTable<SensorsRow> {
  @override
  String get tableName => 'sensors';

  @override
  SensorsRow createRow(Map<String, dynamic> data) => SensorsRow(data);
}

class SensorsRow extends SupabaseDataRow {
  SensorsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SensorsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get sensorId => getField<String>('sensor_id')!;
  set sensorId(String value) => setField<String>('sensor_id', value);

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

  String? get modelNumber => getField<String>('model_number');
  set modelNumber(String? value) => setField<String>('model_number', value);

  String? get sensorLocation => getField<String>('sensor_location');
  set sensorLocation(String? value) =>
      setField<String>('sensor_location', value);

  String? get appliance => getField<String>('appliance');
  set appliance(String? value) => setField<String>('appliance', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get assignedAt => getField<DateTime>('assigned_at');
  set assignedAt(DateTime? value) => setField<DateTime>('assigned_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
