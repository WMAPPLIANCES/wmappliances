// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DiagnosesStruct extends BaseStruct {
  DiagnosesStruct({
    String? diagnosisId,
    String? workOrderId,
    String? diagnosisDetails,
    bool? partNeeded,
    List<String>? photoUrl,
    DateTime? createdAt,
    String? diagnosisTechinician,
    String? item,
    String? diagnosisVoice,
    String? status,
    String? createBy,
    String? modelNumber,
    String? serialNumber,
    String? modelNumberPhoto,
    String? brand,
    bool? partInStock,
    String? failureSymptom,
    String? failurePart,
    String? ageOfItem,
    String? configuration,
    String? itemsOptions,
    String? locationOfItem,
    String? itemProblem,
    String? solutionRequest,
    String? notesDiagnosis,
    String? createByImage,
    bool? requested,
    bool? arrived,
    bool? completed,
    bool? helper,
    String? typeService,
    String? technicianName,
    bool? approved,
    bool? denied,
    bool? pending,
    String? aiNotes,
    String? ocrModelNumber,
    String? technicianUuid,
    String? approvalStatus,
    String? partToPickUp,
    List<String>? partPickUpList,
    bool? pendingPhotos,
    List<String>? modeNumberUrlSchematic,
  })  : _diagnosisId = diagnosisId,
        _workOrderId = workOrderId,
        _diagnosisDetails = diagnosisDetails,
        _partNeeded = partNeeded,
        _photoUrl = photoUrl,
        _createdAt = createdAt,
        _diagnosisTechinician = diagnosisTechinician,
        _item = item,
        _diagnosisVoice = diagnosisVoice,
        _status = status,
        _createBy = createBy,
        _modelNumber = modelNumber,
        _serialNumber = serialNumber,
        _modelNumberPhoto = modelNumberPhoto,
        _brand = brand,
        _partInStock = partInStock,
        _failureSymptom = failureSymptom,
        _failurePart = failurePart,
        _ageOfItem = ageOfItem,
        _configuration = configuration,
        _itemsOptions = itemsOptions,
        _locationOfItem = locationOfItem,
        _itemProblem = itemProblem,
        _solutionRequest = solutionRequest,
        _notesDiagnosis = notesDiagnosis,
        _createByImage = createByImage,
        _requested = requested,
        _arrived = arrived,
        _completed = completed,
        _helper = helper,
        _typeService = typeService,
        _technicianName = technicianName,
        _approved = approved,
        _denied = denied,
        _pending = pending,
        _aiNotes = aiNotes,
        _ocrModelNumber = ocrModelNumber,
        _technicianUuid = technicianUuid,
        _approvalStatus = approvalStatus,
        _partToPickUp = partToPickUp,
        _partPickUpList = partPickUpList,
        _pendingPhotos = pendingPhotos,
        _modeNumberUrlSchematic = modeNumberUrlSchematic;

  // "diagnosis_id" field.
  String? _diagnosisId;
  String get diagnosisId => _diagnosisId ?? '';
  set diagnosisId(String? val) => _diagnosisId = val;

  bool hasDiagnosisId() => _diagnosisId != null;

  // "work_order_id" field.
  String? _workOrderId;
  String get workOrderId => _workOrderId ?? '';
  set workOrderId(String? val) => _workOrderId = val;

  bool hasWorkOrderId() => _workOrderId != null;

  // "diagnosis_details" field.
  String? _diagnosisDetails;
  String get diagnosisDetails => _diagnosisDetails ?? '';
  set diagnosisDetails(String? val) => _diagnosisDetails = val;

  bool hasDiagnosisDetails() => _diagnosisDetails != null;

  // "part_needed" field.
  bool? _partNeeded;
  bool get partNeeded => _partNeeded ?? false;
  set partNeeded(bool? val) => _partNeeded = val;

  bool hasPartNeeded() => _partNeeded != null;

  // "photo_url" field.
  List<String>? _photoUrl;
  List<String> get photoUrl => _photoUrl ?? const [];
  set photoUrl(List<String>? val) => _photoUrl = val;

  void updatePhotoUrl(Function(List<String>) updateFn) {
    updateFn(_photoUrl ??= []);
  }

  bool hasPhotoUrl() => _photoUrl != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "diagnosis_techinician" field.
  String? _diagnosisTechinician;
  String get diagnosisTechinician => _diagnosisTechinician ?? '';
  set diagnosisTechinician(String? val) => _diagnosisTechinician = val;

  bool hasDiagnosisTechinician() => _diagnosisTechinician != null;

  // "item" field.
  String? _item;
  String get item => _item ?? '';
  set item(String? val) => _item = val;

  bool hasItem() => _item != null;

  // "diagnosis_voice" field.
  String? _diagnosisVoice;
  String get diagnosisVoice => _diagnosisVoice ?? '';
  set diagnosisVoice(String? val) => _diagnosisVoice = val;

  bool hasDiagnosisVoice() => _diagnosisVoice != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "create_by" field.
  String? _createBy;
  String get createBy => _createBy ?? '';
  set createBy(String? val) => _createBy = val;

  bool hasCreateBy() => _createBy != null;

  // "model_number" field.
  String? _modelNumber;
  String get modelNumber => _modelNumber ?? '';
  set modelNumber(String? val) => _modelNumber = val;

  bool hasModelNumber() => _modelNumber != null;

  // "serial_number" field.
  String? _serialNumber;
  String get serialNumber => _serialNumber ?? '';
  set serialNumber(String? val) => _serialNumber = val;

  bool hasSerialNumber() => _serialNumber != null;

  // "model_number_photo" field.
  String? _modelNumberPhoto;
  String get modelNumberPhoto => _modelNumberPhoto ?? '';
  set modelNumberPhoto(String? val) => _modelNumberPhoto = val;

  bool hasModelNumberPhoto() => _modelNumberPhoto != null;

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  set brand(String? val) => _brand = val;

  bool hasBrand() => _brand != null;

  // "part_in_stock" field.
  bool? _partInStock;
  bool get partInStock => _partInStock ?? false;
  set partInStock(bool? val) => _partInStock = val;

  bool hasPartInStock() => _partInStock != null;

  // "failure_symptom" field.
  String? _failureSymptom;
  String get failureSymptom => _failureSymptom ?? '';
  set failureSymptom(String? val) => _failureSymptom = val;

  bool hasFailureSymptom() => _failureSymptom != null;

  // "failure_part" field.
  String? _failurePart;
  String get failurePart => _failurePart ?? '';
  set failurePart(String? val) => _failurePart = val;

  bool hasFailurePart() => _failurePart != null;

  // "age_of_item" field.
  String? _ageOfItem;
  String get ageOfItem => _ageOfItem ?? '';
  set ageOfItem(String? val) => _ageOfItem = val;

  bool hasAgeOfItem() => _ageOfItem != null;

  // "configuration" field.
  String? _configuration;
  String get configuration => _configuration ?? '';
  set configuration(String? val) => _configuration = val;

  bool hasConfiguration() => _configuration != null;

  // "items_options" field.
  String? _itemsOptions;
  String get itemsOptions => _itemsOptions ?? '';
  set itemsOptions(String? val) => _itemsOptions = val;

  bool hasItemsOptions() => _itemsOptions != null;

  // "location_of_item" field.
  String? _locationOfItem;
  String get locationOfItem => _locationOfItem ?? '';
  set locationOfItem(String? val) => _locationOfItem = val;

  bool hasLocationOfItem() => _locationOfItem != null;

  // "item_problem" field.
  String? _itemProblem;
  String get itemProblem => _itemProblem ?? '';
  set itemProblem(String? val) => _itemProblem = val;

  bool hasItemProblem() => _itemProblem != null;

  // "solution_request" field.
  String? _solutionRequest;
  String get solutionRequest => _solutionRequest ?? '';
  set solutionRequest(String? val) => _solutionRequest = val;

  bool hasSolutionRequest() => _solutionRequest != null;

  // "notes_diagnosis" field.
  String? _notesDiagnosis;
  String get notesDiagnosis => _notesDiagnosis ?? '';
  set notesDiagnosis(String? val) => _notesDiagnosis = val;

  bool hasNotesDiagnosis() => _notesDiagnosis != null;

  // "create_by_image" field.
  String? _createByImage;
  String get createByImage => _createByImage ?? '';
  set createByImage(String? val) => _createByImage = val;

  bool hasCreateByImage() => _createByImage != null;

  // "requested" field.
  bool? _requested;
  bool get requested => _requested ?? false;
  set requested(bool? val) => _requested = val;

  bool hasRequested() => _requested != null;

  // "arrived" field.
  bool? _arrived;
  bool get arrived => _arrived ?? false;
  set arrived(bool? val) => _arrived = val;

  bool hasArrived() => _arrived != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  set completed(bool? val) => _completed = val;

  bool hasCompleted() => _completed != null;

  // "helper" field.
  bool? _helper;
  bool get helper => _helper ?? false;
  set helper(bool? val) => _helper = val;

  bool hasHelper() => _helper != null;

  // "type_service" field.
  String? _typeService;
  String get typeService => _typeService ?? '';
  set typeService(String? val) => _typeService = val;

  bool hasTypeService() => _typeService != null;

  // "technician_name" field.
  String? _technicianName;
  String get technicianName => _technicianName ?? '';
  set technicianName(String? val) => _technicianName = val;

  bool hasTechnicianName() => _technicianName != null;

  // "approved" field.
  bool? _approved;
  bool get approved => _approved ?? false;
  set approved(bool? val) => _approved = val;

  bool hasApproved() => _approved != null;

  // "denied" field.
  bool? _denied;
  bool get denied => _denied ?? false;
  set denied(bool? val) => _denied = val;

  bool hasDenied() => _denied != null;

  // "pending" field.
  bool? _pending;
  bool get pending => _pending ?? false;
  set pending(bool? val) => _pending = val;

  bool hasPending() => _pending != null;

  // "ai_notes" field.
  String? _aiNotes;
  String get aiNotes => _aiNotes ?? '';
  set aiNotes(String? val) => _aiNotes = val;

  bool hasAiNotes() => _aiNotes != null;

  // "ocr_model_number" field.
  String? _ocrModelNumber;
  String get ocrModelNumber => _ocrModelNumber ?? '';
  set ocrModelNumber(String? val) => _ocrModelNumber = val;

  bool hasOcrModelNumber() => _ocrModelNumber != null;

  // "technician_uuid" field.
  String? _technicianUuid;
  String get technicianUuid => _technicianUuid ?? '';
  set technicianUuid(String? val) => _technicianUuid = val;

  bool hasTechnicianUuid() => _technicianUuid != null;

  // "approval_status" field.
  String? _approvalStatus;
  String get approvalStatus => _approvalStatus ?? '';
  set approvalStatus(String? val) => _approvalStatus = val;

  bool hasApprovalStatus() => _approvalStatus != null;

  // "part_to_pick_up" field.
  String? _partToPickUp;
  String get partToPickUp => _partToPickUp ?? '';
  set partToPickUp(String? val) => _partToPickUp = val;

  bool hasPartToPickUp() => _partToPickUp != null;

  // "part_pick_up_list" field.
  List<String>? _partPickUpList;
  List<String> get partPickUpList => _partPickUpList ?? const [];
  set partPickUpList(List<String>? val) => _partPickUpList = val;

  void updatePartPickUpList(Function(List<String>) updateFn) {
    updateFn(_partPickUpList ??= []);
  }

  bool hasPartPickUpList() => _partPickUpList != null;

  // "pending_photos" field.
  bool? _pendingPhotos;
  bool get pendingPhotos => _pendingPhotos ?? false;
  set pendingPhotos(bool? val) => _pendingPhotos = val;

  bool hasPendingPhotos() => _pendingPhotos != null;

  // "modeNumberUrlSchematic" field.
  List<String>? _modeNumberUrlSchematic;
  List<String> get modeNumberUrlSchematic =>
      _modeNumberUrlSchematic ?? const [];
  set modeNumberUrlSchematic(List<String>? val) =>
      _modeNumberUrlSchematic = val;

  void updateModeNumberUrlSchematic(Function(List<String>) updateFn) {
    updateFn(_modeNumberUrlSchematic ??= []);
  }

  bool hasModeNumberUrlSchematic() => _modeNumberUrlSchematic != null;

  static DiagnosesStruct fromMap(Map<String, dynamic> data) => DiagnosesStruct(
        diagnosisId: data['diagnosis_id'] as String?,
        workOrderId: data['work_order_id'] as String?,
        diagnosisDetails: data['diagnosis_details'] as String?,
        partNeeded: data['part_needed'] as bool?,
        photoUrl: getDataList(data['photo_url']),
        createdAt: data['created_at'] as DateTime?,
        diagnosisTechinician: data['diagnosis_techinician'] as String?,
        item: data['item'] as String?,
        diagnosisVoice: data['diagnosis_voice'] as String?,
        status: data['status'] as String?,
        createBy: data['create_by'] as String?,
        modelNumber: data['model_number'] as String?,
        serialNumber: data['serial_number'] as String?,
        modelNumberPhoto: data['model_number_photo'] as String?,
        brand: data['brand'] as String?,
        partInStock: data['part_in_stock'] as bool?,
        failureSymptom: data['failure_symptom'] as String?,
        failurePart: data['failure_part'] as String?,
        ageOfItem: data['age_of_item'] as String?,
        configuration: data['configuration'] as String?,
        itemsOptions: data['items_options'] as String?,
        locationOfItem: data['location_of_item'] as String?,
        itemProblem: data['item_problem'] as String?,
        solutionRequest: data['solution_request'] as String?,
        notesDiagnosis: data['notes_diagnosis'] as String?,
        createByImage: data['create_by_image'] as String?,
        requested: data['requested'] as bool?,
        arrived: data['arrived'] as bool?,
        completed: data['completed'] as bool?,
        helper: data['helper'] as bool?,
        typeService: data['type_service'] as String?,
        technicianName: data['technician_name'] as String?,
        approved: data['approved'] as bool?,
        denied: data['denied'] as bool?,
        pending: data['pending'] as bool?,
        aiNotes: data['ai_notes'] as String?,
        ocrModelNumber: data['ocr_model_number'] as String?,
        technicianUuid: data['technician_uuid'] as String?,
        approvalStatus: data['approval_status'] as String?,
        partToPickUp: data['part_to_pick_up'] as String?,
        partPickUpList: getDataList(data['part_pick_up_list']),
        pendingPhotos: data['pending_photos'] as bool?,
        modeNumberUrlSchematic: getDataList(data['modeNumberUrlSchematic']),
      );

  static DiagnosesStruct? maybeFromMap(dynamic data) => data is Map
      ? DiagnosesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'diagnosis_id': _diagnosisId,
        'work_order_id': _workOrderId,
        'diagnosis_details': _diagnosisDetails,
        'part_needed': _partNeeded,
        'photo_url': _photoUrl,
        'created_at': _createdAt,
        'diagnosis_techinician': _diagnosisTechinician,
        'item': _item,
        'diagnosis_voice': _diagnosisVoice,
        'status': _status,
        'create_by': _createBy,
        'model_number': _modelNumber,
        'serial_number': _serialNumber,
        'model_number_photo': _modelNumberPhoto,
        'brand': _brand,
        'part_in_stock': _partInStock,
        'failure_symptom': _failureSymptom,
        'failure_part': _failurePart,
        'age_of_item': _ageOfItem,
        'configuration': _configuration,
        'items_options': _itemsOptions,
        'location_of_item': _locationOfItem,
        'item_problem': _itemProblem,
        'solution_request': _solutionRequest,
        'notes_diagnosis': _notesDiagnosis,
        'create_by_image': _createByImage,
        'requested': _requested,
        'arrived': _arrived,
        'completed': _completed,
        'helper': _helper,
        'type_service': _typeService,
        'technician_name': _technicianName,
        'approved': _approved,
        'denied': _denied,
        'pending': _pending,
        'ai_notes': _aiNotes,
        'ocr_model_number': _ocrModelNumber,
        'technician_uuid': _technicianUuid,
        'approval_status': _approvalStatus,
        'part_to_pick_up': _partToPickUp,
        'part_pick_up_list': _partPickUpList,
        'pending_photos': _pendingPhotos,
        'modeNumberUrlSchematic': _modeNumberUrlSchematic,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'diagnosis_id': serializeParam(
          _diagnosisId,
          ParamType.String,
        ),
        'work_order_id': serializeParam(
          _workOrderId,
          ParamType.String,
        ),
        'diagnosis_details': serializeParam(
          _diagnosisDetails,
          ParamType.String,
        ),
        'part_needed': serializeParam(
          _partNeeded,
          ParamType.bool,
        ),
        'photo_url': serializeParam(
          _photoUrl,
          ParamType.String,
          isList: true,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'diagnosis_techinician': serializeParam(
          _diagnosisTechinician,
          ParamType.String,
        ),
        'item': serializeParam(
          _item,
          ParamType.String,
        ),
        'diagnosis_voice': serializeParam(
          _diagnosisVoice,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'create_by': serializeParam(
          _createBy,
          ParamType.String,
        ),
        'model_number': serializeParam(
          _modelNumber,
          ParamType.String,
        ),
        'serial_number': serializeParam(
          _serialNumber,
          ParamType.String,
        ),
        'model_number_photo': serializeParam(
          _modelNumberPhoto,
          ParamType.String,
        ),
        'brand': serializeParam(
          _brand,
          ParamType.String,
        ),
        'part_in_stock': serializeParam(
          _partInStock,
          ParamType.bool,
        ),
        'failure_symptom': serializeParam(
          _failureSymptom,
          ParamType.String,
        ),
        'failure_part': serializeParam(
          _failurePart,
          ParamType.String,
        ),
        'age_of_item': serializeParam(
          _ageOfItem,
          ParamType.String,
        ),
        'configuration': serializeParam(
          _configuration,
          ParamType.String,
        ),
        'items_options': serializeParam(
          _itemsOptions,
          ParamType.String,
        ),
        'location_of_item': serializeParam(
          _locationOfItem,
          ParamType.String,
        ),
        'item_problem': serializeParam(
          _itemProblem,
          ParamType.String,
        ),
        'solution_request': serializeParam(
          _solutionRequest,
          ParamType.String,
        ),
        'notes_diagnosis': serializeParam(
          _notesDiagnosis,
          ParamType.String,
        ),
        'create_by_image': serializeParam(
          _createByImage,
          ParamType.String,
        ),
        'requested': serializeParam(
          _requested,
          ParamType.bool,
        ),
        'arrived': serializeParam(
          _arrived,
          ParamType.bool,
        ),
        'completed': serializeParam(
          _completed,
          ParamType.bool,
        ),
        'helper': serializeParam(
          _helper,
          ParamType.bool,
        ),
        'type_service': serializeParam(
          _typeService,
          ParamType.String,
        ),
        'technician_name': serializeParam(
          _technicianName,
          ParamType.String,
        ),
        'approved': serializeParam(
          _approved,
          ParamType.bool,
        ),
        'denied': serializeParam(
          _denied,
          ParamType.bool,
        ),
        'pending': serializeParam(
          _pending,
          ParamType.bool,
        ),
        'ai_notes': serializeParam(
          _aiNotes,
          ParamType.String,
        ),
        'ocr_model_number': serializeParam(
          _ocrModelNumber,
          ParamType.String,
        ),
        'technician_uuid': serializeParam(
          _technicianUuid,
          ParamType.String,
        ),
        'approval_status': serializeParam(
          _approvalStatus,
          ParamType.String,
        ),
        'part_to_pick_up': serializeParam(
          _partToPickUp,
          ParamType.String,
        ),
        'part_pick_up_list': serializeParam(
          _partPickUpList,
          ParamType.String,
          isList: true,
        ),
        'pending_photos': serializeParam(
          _pendingPhotos,
          ParamType.bool,
        ),
        'modeNumberUrlSchematic': serializeParam(
          _modeNumberUrlSchematic,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static DiagnosesStruct fromSerializableMap(Map<String, dynamic> data) =>
      DiagnosesStruct(
        diagnosisId: deserializeParam(
          data['diagnosis_id'],
          ParamType.String,
          false,
        ),
        workOrderId: deserializeParam(
          data['work_order_id'],
          ParamType.String,
          false,
        ),
        diagnosisDetails: deserializeParam(
          data['diagnosis_details'],
          ParamType.String,
          false,
        ),
        partNeeded: deserializeParam(
          data['part_needed'],
          ParamType.bool,
          false,
        ),
        photoUrl: deserializeParam<String>(
          data['photo_url'],
          ParamType.String,
          true,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        diagnosisTechinician: deserializeParam(
          data['diagnosis_techinician'],
          ParamType.String,
          false,
        ),
        item: deserializeParam(
          data['item'],
          ParamType.String,
          false,
        ),
        diagnosisVoice: deserializeParam(
          data['diagnosis_voice'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        createBy: deserializeParam(
          data['create_by'],
          ParamType.String,
          false,
        ),
        modelNumber: deserializeParam(
          data['model_number'],
          ParamType.String,
          false,
        ),
        serialNumber: deserializeParam(
          data['serial_number'],
          ParamType.String,
          false,
        ),
        modelNumberPhoto: deserializeParam(
          data['model_number_photo'],
          ParamType.String,
          false,
        ),
        brand: deserializeParam(
          data['brand'],
          ParamType.String,
          false,
        ),
        partInStock: deserializeParam(
          data['part_in_stock'],
          ParamType.bool,
          false,
        ),
        failureSymptom: deserializeParam(
          data['failure_symptom'],
          ParamType.String,
          false,
        ),
        failurePart: deserializeParam(
          data['failure_part'],
          ParamType.String,
          false,
        ),
        ageOfItem: deserializeParam(
          data['age_of_item'],
          ParamType.String,
          false,
        ),
        configuration: deserializeParam(
          data['configuration'],
          ParamType.String,
          false,
        ),
        itemsOptions: deserializeParam(
          data['items_options'],
          ParamType.String,
          false,
        ),
        locationOfItem: deserializeParam(
          data['location_of_item'],
          ParamType.String,
          false,
        ),
        itemProblem: deserializeParam(
          data['item_problem'],
          ParamType.String,
          false,
        ),
        solutionRequest: deserializeParam(
          data['solution_request'],
          ParamType.String,
          false,
        ),
        notesDiagnosis: deserializeParam(
          data['notes_diagnosis'],
          ParamType.String,
          false,
        ),
        createByImage: deserializeParam(
          data['create_by_image'],
          ParamType.String,
          false,
        ),
        requested: deserializeParam(
          data['requested'],
          ParamType.bool,
          false,
        ),
        arrived: deserializeParam(
          data['arrived'],
          ParamType.bool,
          false,
        ),
        completed: deserializeParam(
          data['completed'],
          ParamType.bool,
          false,
        ),
        helper: deserializeParam(
          data['helper'],
          ParamType.bool,
          false,
        ),
        typeService: deserializeParam(
          data['type_service'],
          ParamType.String,
          false,
        ),
        technicianName: deserializeParam(
          data['technician_name'],
          ParamType.String,
          false,
        ),
        approved: deserializeParam(
          data['approved'],
          ParamType.bool,
          false,
        ),
        denied: deserializeParam(
          data['denied'],
          ParamType.bool,
          false,
        ),
        pending: deserializeParam(
          data['pending'],
          ParamType.bool,
          false,
        ),
        aiNotes: deserializeParam(
          data['ai_notes'],
          ParamType.String,
          false,
        ),
        ocrModelNumber: deserializeParam(
          data['ocr_model_number'],
          ParamType.String,
          false,
        ),
        technicianUuid: deserializeParam(
          data['technician_uuid'],
          ParamType.String,
          false,
        ),
        approvalStatus: deserializeParam(
          data['approval_status'],
          ParamType.String,
          false,
        ),
        partToPickUp: deserializeParam(
          data['part_to_pick_up'],
          ParamType.String,
          false,
        ),
        partPickUpList: deserializeParam<String>(
          data['part_pick_up_list'],
          ParamType.String,
          true,
        ),
        pendingPhotos: deserializeParam(
          data['pending_photos'],
          ParamType.bool,
          false,
        ),
        modeNumberUrlSchematic: deserializeParam<String>(
          data['modeNumberUrlSchematic'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'DiagnosesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DiagnosesStruct &&
        diagnosisId == other.diagnosisId &&
        workOrderId == other.workOrderId &&
        diagnosisDetails == other.diagnosisDetails &&
        partNeeded == other.partNeeded &&
        listEquality.equals(photoUrl, other.photoUrl) &&
        createdAt == other.createdAt &&
        diagnosisTechinician == other.diagnosisTechinician &&
        item == other.item &&
        diagnosisVoice == other.diagnosisVoice &&
        status == other.status &&
        createBy == other.createBy &&
        modelNumber == other.modelNumber &&
        serialNumber == other.serialNumber &&
        modelNumberPhoto == other.modelNumberPhoto &&
        brand == other.brand &&
        partInStock == other.partInStock &&
        failureSymptom == other.failureSymptom &&
        failurePart == other.failurePart &&
        ageOfItem == other.ageOfItem &&
        configuration == other.configuration &&
        itemsOptions == other.itemsOptions &&
        locationOfItem == other.locationOfItem &&
        itemProblem == other.itemProblem &&
        solutionRequest == other.solutionRequest &&
        notesDiagnosis == other.notesDiagnosis &&
        createByImage == other.createByImage &&
        requested == other.requested &&
        arrived == other.arrived &&
        completed == other.completed &&
        helper == other.helper &&
        typeService == other.typeService &&
        technicianName == other.technicianName &&
        approved == other.approved &&
        denied == other.denied &&
        pending == other.pending &&
        aiNotes == other.aiNotes &&
        ocrModelNumber == other.ocrModelNumber &&
        technicianUuid == other.technicianUuid &&
        approvalStatus == other.approvalStatus &&
        partToPickUp == other.partToPickUp &&
        listEquality.equals(partPickUpList, other.partPickUpList) &&
        pendingPhotos == other.pendingPhotos &&
        listEquality.equals(
            modeNumberUrlSchematic, other.modeNumberUrlSchematic);
  }

  @override
  int get hashCode => const ListEquality().hash([
        diagnosisId,
        workOrderId,
        diagnosisDetails,
        partNeeded,
        photoUrl,
        createdAt,
        diagnosisTechinician,
        item,
        diagnosisVoice,
        status,
        createBy,
        modelNumber,
        serialNumber,
        modelNumberPhoto,
        brand,
        partInStock,
        failureSymptom,
        failurePart,
        ageOfItem,
        configuration,
        itemsOptions,
        locationOfItem,
        itemProblem,
        solutionRequest,
        notesDiagnosis,
        createByImage,
        requested,
        arrived,
        completed,
        helper,
        typeService,
        technicianName,
        approved,
        denied,
        pending,
        aiNotes,
        ocrModelNumber,
        technicianUuid,
        approvalStatus,
        partToPickUp,
        partPickUpList,
        pendingPhotos,
        modeNumberUrlSchematic
      ]);
}

DiagnosesStruct createDiagnosesStruct({
  String? diagnosisId,
  String? workOrderId,
  String? diagnosisDetails,
  bool? partNeeded,
  DateTime? createdAt,
  String? diagnosisTechinician,
  String? item,
  String? diagnosisVoice,
  String? status,
  String? createBy,
  String? modelNumber,
  String? serialNumber,
  String? modelNumberPhoto,
  String? brand,
  bool? partInStock,
  String? failureSymptom,
  String? failurePart,
  String? ageOfItem,
  String? configuration,
  String? itemsOptions,
  String? locationOfItem,
  String? itemProblem,
  String? solutionRequest,
  String? notesDiagnosis,
  String? createByImage,
  bool? requested,
  bool? arrived,
  bool? completed,
  bool? helper,
  String? typeService,
  String? technicianName,
  bool? approved,
  bool? denied,
  bool? pending,
  String? aiNotes,
  String? ocrModelNumber,
  String? technicianUuid,
  String? approvalStatus,
  String? partToPickUp,
  bool? pendingPhotos,
}) =>
    DiagnosesStruct(
      diagnosisId: diagnosisId,
      workOrderId: workOrderId,
      diagnosisDetails: diagnosisDetails,
      partNeeded: partNeeded,
      createdAt: createdAt,
      diagnosisTechinician: diagnosisTechinician,
      item: item,
      diagnosisVoice: diagnosisVoice,
      status: status,
      createBy: createBy,
      modelNumber: modelNumber,
      serialNumber: serialNumber,
      modelNumberPhoto: modelNumberPhoto,
      brand: brand,
      partInStock: partInStock,
      failureSymptom: failureSymptom,
      failurePart: failurePart,
      ageOfItem: ageOfItem,
      configuration: configuration,
      itemsOptions: itemsOptions,
      locationOfItem: locationOfItem,
      itemProblem: itemProblem,
      solutionRequest: solutionRequest,
      notesDiagnosis: notesDiagnosis,
      createByImage: createByImage,
      requested: requested,
      arrived: arrived,
      completed: completed,
      helper: helper,
      typeService: typeService,
      technicianName: technicianName,
      approved: approved,
      denied: denied,
      pending: pending,
      aiNotes: aiNotes,
      ocrModelNumber: ocrModelNumber,
      technicianUuid: technicianUuid,
      approvalStatus: approvalStatus,
      partToPickUp: partToPickUp,
      pendingPhotos: pendingPhotos,
    );
