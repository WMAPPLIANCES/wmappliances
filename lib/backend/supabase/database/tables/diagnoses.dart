import '../database.dart';

class DiagnosesTable extends SupabaseTable<DiagnosesRow> {
  @override
  String get tableName => 'diagnoses';

  @override
  DiagnosesRow createRow(Map<String, dynamic> data) => DiagnosesRow(data);
}

class DiagnosesRow extends SupabaseDataRow {
  DiagnosesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DiagnosesTable();

  String get diagnosisId => getField<String>('diagnosis_id')!;
  set diagnosisId(String value) => setField<String>('diagnosis_id', value);

  String? get workOrderId => getField<String>('work_order_id');
  set workOrderId(String? value) => setField<String>('work_order_id', value);

  String? get diagnosisDetails => getField<String>('diagnosis_details');
  set diagnosisDetails(String? value) =>
      setField<String>('diagnosis_details', value);

  bool? get partNeeded => getField<bool>('part_needed');
  set partNeeded(bool? value) => setField<bool>('part_needed', value);

  List<String> get photoUrl => getListField<String>('photo_url');
  set photoUrl(List<String>? value) => setListField<String>('photo_url', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get diagnosisTechinician => getField<String>('diagnosis_techinician');
  set diagnosisTechinician(String? value) =>
      setField<String>('diagnosis_techinician', value);

  String? get item => getField<String>('item');
  set item(String? value) => setField<String>('item', value);

  String? get diagnosisVoice => getField<String>('diagnosis_voice');
  set diagnosisVoice(String? value) =>
      setField<String>('diagnosis_voice', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get createBy => getField<String>('create_by');
  set createBy(String? value) => setField<String>('create_by', value);

  String? get modelNumber => getField<String>('model_number');
  set modelNumber(String? value) => setField<String>('model_number', value);

  String? get serialNumber => getField<String>('serial_number');
  set serialNumber(String? value) => setField<String>('serial_number', value);

  List<dynamic> get modelNumberUrlSchematic =>
      getListField<dynamic>('model_number_url_schematic');
  set modelNumberUrlSchematic(List<dynamic>? value) =>
      setListField<dynamic>('model_number_url_schematic', value);

  String? get brand => getField<String>('brand');
  set brand(String? value) => setField<String>('brand', value);

  bool? get partInStock => getField<bool>('part_in_stock');
  set partInStock(bool? value) => setField<bool>('part_in_stock', value);

  String? get failureSymptom => getField<String>('failure_symptom');
  set failureSymptom(String? value) =>
      setField<String>('failure_symptom', value);

  String? get failurePart => getField<String>('failure_part');
  set failurePart(String? value) => setField<String>('failure_part', value);

  String? get ageOfItem => getField<String>('age_of_item');
  set ageOfItem(String? value) => setField<String>('age_of_item', value);

  String? get configuration => getField<String>('configuration');
  set configuration(String? value) => setField<String>('configuration', value);

  String? get itemsOptions => getField<String>('items_options');
  set itemsOptions(String? value) => setField<String>('items_options', value);

  String? get locationOfItem => getField<String>('location_of_item');
  set locationOfItem(String? value) =>
      setField<String>('location_of_item', value);

  String? get itemProblem => getField<String>('item_problem');
  set itemProblem(String? value) => setField<String>('item_problem', value);

  String? get solutionRequest => getField<String>('solution_request');
  set solutionRequest(String? value) =>
      setField<String>('solution_request', value);

  String? get notesDiagnosis => getField<String>('notes_diagnosis');
  set notesDiagnosis(String? value) =>
      setField<String>('notes_diagnosis', value);

  String? get createByImage => getField<String>('create_by_image');
  set createByImage(String? value) =>
      setField<String>('create_by_image', value);

  bool? get requested => getField<bool>('requested');
  set requested(bool? value) => setField<bool>('requested', value);

  bool? get arrived => getField<bool>('arrived');
  set arrived(bool? value) => setField<bool>('arrived', value);

  bool? get completed => getField<bool>('completed');
  set completed(bool? value) => setField<bool>('completed', value);

  bool? get helper => getField<bool>('helper');
  set helper(bool? value) => setField<bool>('helper', value);

  String? get typeService => getField<String>('type_service');
  set typeService(String? value) => setField<String>('type_service', value);

  String? get technicianName => getField<String>('technician_name');
  set technicianName(String? value) =>
      setField<String>('technician_name', value);

  bool? get approved => getField<bool>('approved');
  set approved(bool? value) => setField<bool>('approved', value);

  bool? get denied => getField<bool>('denied');
  set denied(bool? value) => setField<bool>('denied', value);

  bool? get pending => getField<bool>('pending');
  set pending(bool? value) => setField<bool>('pending', value);

  String? get aiNotes => getField<String>('ai_notes');
  set aiNotes(String? value) => setField<String>('ai_notes', value);

  String? get ocrModelNumber => getField<String>('ocr_model_number');
  set ocrModelNumber(String? value) =>
      setField<String>('ocr_model_number', value);

  String? get technicianUuid => getField<String>('technician_uuid');
  set technicianUuid(String? value) =>
      setField<String>('technician_uuid', value);

  String? get approvalStatus => getField<String>('approval_status');
  set approvalStatus(String? value) =>
      setField<String>('approval_status', value);

  String? get partToPickUp => getField<String>('part_to_pick_up');
  set partToPickUp(String? value) => setField<String>('part_to_pick_up', value);

  List<String> get partPickUpList => getListField<String>('part_pick_up_list');
  set partPickUpList(List<String>? value) =>
      setListField<String>('part_pick_up_list', value);

  bool? get pendingPhotos => getField<bool>('pending_photos');
  set pendingPhotos(bool? value) => setField<bool>('pending_photos', value);

  bool? get checkList => getField<bool>('check_list');
  set checkList(bool? value) => setField<bool>('check_list', value);

  bool? get itsCheckListDone => getField<bool>('its_check_list_done');
  set itsCheckListDone(bool? value) =>
      setField<bool>('its_check_list_done', value);

  int? get estimateTimeToRepair => getField<int>('estimate_time_to_repair');
  set estimateTimeToRepair(int? value) =>
      setField<int>('estimate_time_to_repair', value);

  bool? get schematicView => getField<bool>('schematic_view');
  set schematicView(bool? value) => setField<bool>('schematic_view', value);

  String? get repairCostType => getField<String>('repair_cost_type');
  set repairCostType(String? value) =>
      setField<String>('repair_cost_type', value);

  bool? get paymentAutorized => getField<bool>('payment_autorized');
  set paymentAutorized(bool? value) =>
      setField<bool>('payment_autorized', value);

  String? get visitType => getField<String>('visit_type');
  set visitType(String? value) => setField<String>('visit_type', value);

  double? get baseAmount => getField<double>('base_amount');
  set baseAmount(double? value) => setField<double>('base_amount', value);

  bool? get paymentCreated => getField<bool>('payment_created');
  set paymentCreated(bool? value) => setField<bool>('payment_created', value);

  String? get payCategory => getField<String>('pay_category');
  set payCategory(String? value) => setField<String>('pay_category', value);
}
