import '../database.dart';

class JobTrackingTable extends SupabaseTable<JobTrackingRow> {
  @override
  String get tableName => 'job_tracking';

  @override
  JobTrackingRow createRow(Map<String, dynamic> data) => JobTrackingRow(data);
}

class JobTrackingRow extends SupabaseDataRow {
  JobTrackingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => JobTrackingTable();

  String get jobId => getField<String>('job_id')!;
  set jobId(String value) => setField<String>('job_id', value);

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

  String? get workOrderNumber => getField<String>('work_order_number');
  set workOrderNumber(String? value) =>
      setField<String>('work_order_number', value);

  String? get technicianName => getField<String>('technician_name');
  set technicianName(String? value) =>
      setField<String>('technician_name', value);

  String? get typeOfJob => getField<String>('type_of_job');
  set typeOfJob(String? value) => setField<String>('type_of_job', value);

  double? get actionCode => getField<double>('action_code');
  set actionCode(double? value) => setField<double>('action_code', value);

  String? get initialAction => getField<String>('initial_action');
  set initialAction(String? value) => setField<String>('initial_action', value);

  bool? get initialStatus => getField<bool>('initial_status');
  set initialStatus(bool? value) => setField<bool>('initial_status', value);

  String? get finalAction => getField<String>('final_action');
  set finalAction(String? value) => setField<String>('final_action', value);

  bool? get finalStatus => getField<bool>('final_status');
  set finalStatus(bool? value) => setField<bool>('final_status', value);

  String? get managerReview => getField<String>('manager_review');
  set managerReview(String? value) => setField<String>('manager_review', value);

  String? get actionChecklist => getField<String>('action_checklist');
  set actionChecklist(String? value) =>
      setField<String>('action_checklist', value);

  bool? get allDone => getField<bool>('all_done');
  set allDone(bool? value) => setField<bool>('all_done', value);

  String? get jobStatus => getField<String>('job_status');
  set jobStatus(String? value) => setField<String>('job_status', value);

  DateTime? get scheduledDate => getField<DateTime>('scheduled_date');
  set scheduledDate(DateTime? value) =>
      setField<DateTime>('scheduled_date', value);

  String? get scheduledDayOfWeek => getField<String>('scheduled_day_of_week');
  set scheduledDayOfWeek(String? value) =>
      setField<String>('scheduled_day_of_week', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  DateTime? get startTime => getField<DateTime>('start_time');
  set startTime(DateTime? value) => setField<DateTime>('start_time', value);

  DateTime? get endTime => getField<DateTime>('end_time');
  set endTime(DateTime? value) => setField<DateTime>('end_time', value);
}
