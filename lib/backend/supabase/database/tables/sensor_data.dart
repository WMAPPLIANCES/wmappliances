import '../database.dart';

class SensorDataTable extends SupabaseTable<SensorDataRow> {
  @override
  String get tableName => 'sensor_data';

  @override
  SensorDataRow createRow(Map<String, dynamic> data) => SensorDataRow(data);
}

class SensorDataRow extends SupabaseDataRow {
  SensorDataRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SensorDataTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

  String? get modelNumber => getField<String>('model_number');
  set modelNumber(String? value) => setField<String>('model_number', value);

  double? get temperatureFahrenheit =>
      getField<double>('temperature_fahrenheit');
  set temperatureFahrenheit(double? value) =>
      setField<double>('temperature_fahrenheit', value);

  double? get humidity => getField<double>('humidity');
  set humidity(double? value) => setField<double>('humidity', value);

  DateTime? get dateTime => getField<DateTime>('date_time');
  set dateTime(DateTime? value) => setField<DateTime>('date_time', value);

  String? get sensorLocation => getField<String>('sensor_location');
  set sensorLocation(String? value) =>
      setField<String>('sensor_location', value);

  String? get audioUrl => getField<String>('audio_url');
  set audioUrl(String? value) => setField<String>('audio_url', value);

  bool? get soundDetected => getField<bool>('sound_detected');
  set soundDetected(bool? value) => setField<bool>('sound_detected', value);

  String? get gasType => getField<String>('gas_type');
  set gasType(String? value) => setField<String>('gas_type', value);

  String? get pressure => getField<String>('pressure');
  set pressure(String? value) => setField<String>('pressure', value);

  String? get voltage => getField<String>('voltage');
  set voltage(String? value) => setField<String>('voltage', value);

  String? get appliance => getField<String>('appliance');
  set appliance(String? value) => setField<String>('appliance', value);

  double? get iaq => getField<double>('iaq');
  set iaq(double? value) => setField<double>('iaq', value);

  String? get gasDescription => getField<String>('gas_description');
  set gasDescription(String? value) =>
      setField<String>('gas_description', value);

  String? get sensorId => getField<String>('sensor_id');
  set sensorId(String? value) => setField<String>('sensor_id', value);

  double? get gasResistance => getField<double>('gas_resistance');
  set gasResistance(double? value) => setField<double>('gas_resistance', value);

  String? get airQuality => getField<String>('air_quality');
  set airQuality(String? value) => setField<String>('air_quality', value);

  String? get audioData => getField<String>('audio_data');
  set audioData(String? value) => setField<String>('audio_data', value);

  double? get infraredTemperature => getField<double>('infrared_temperature');
  set infraredTemperature(double? value) =>
      setField<double>('infrared_temperature', value);

  bool? get leak => getField<bool>('leak');
  set leak(bool? value) => setField<bool>('leak', value);

  double? get airFlow => getField<double>('air_flow');
  set airFlow(double? value) => setField<double>('air_flow', value);

  String? get compressorPsi => getField<String>('compressor_psi');
  set compressorPsi(String? value) => setField<String>('compressor_psi', value);
}
