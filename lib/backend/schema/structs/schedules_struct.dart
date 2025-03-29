// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SchedulesStruct extends BaseStruct {
  SchedulesStruct({
    String? scheduleId,
    String? workOrderId,
    String? routeDate,
    String? stopNumber,
    String? startLocationLat,
    String? startLocationLong,
    String? endLocationLat,
    String? endLocationLong,
    String? appointmentDate,
    String? windowTime,
    bool? windowTimeChanged,
    String? appointmentStatus,
    String? customerAddress,
    String? customerLat,
    String? customerLng,
    String? customerPhone,
    String? location,
    String? createdAt,
    String? updatedAt,
    String? appointmentStart,
    String? appointmentEnd,
    String? startTime,
    String? endTime,
    bool? helper,
    List<String>? itens,
    String? techniciansName,
    String? techniciansPhoto,
    String? appointmentType,
    String? techniciansUuid,
    bool? completed,
    bool? updateReview,
    String? customerName,
    String? apt,
    bool? managerReview,
    String? latLng,
    String? eventType,
    String? technicianColor,
    String? officeLocation,
  })  : _scheduleId = scheduleId,
        _workOrderId = workOrderId,
        _routeDate = routeDate,
        _stopNumber = stopNumber,
        _startLocationLat = startLocationLat,
        _startLocationLong = startLocationLong,
        _endLocationLat = endLocationLat,
        _endLocationLong = endLocationLong,
        _appointmentDate = appointmentDate,
        _windowTime = windowTime,
        _windowTimeChanged = windowTimeChanged,
        _appointmentStatus = appointmentStatus,
        _customerAddress = customerAddress,
        _customerLat = customerLat,
        _customerLng = customerLng,
        _customerPhone = customerPhone,
        _location = location,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _appointmentStart = appointmentStart,
        _appointmentEnd = appointmentEnd,
        _startTime = startTime,
        _endTime = endTime,
        _helper = helper,
        _itens = itens,
        _techniciansName = techniciansName,
        _techniciansPhoto = techniciansPhoto,
        _appointmentType = appointmentType,
        _techniciansUuid = techniciansUuid,
        _completed = completed,
        _updateReview = updateReview,
        _customerName = customerName,
        _apt = apt,
        _managerReview = managerReview,
        _latLng = latLng,
        _eventType = eventType,
        _technicianColor = technicianColor,
        _officeLocation = officeLocation;

  // "schedule_id" field.
  String? _scheduleId;
  String get scheduleId => _scheduleId ?? '';
  set scheduleId(String? val) => _scheduleId = val;

  bool hasScheduleId() => _scheduleId != null;

  // "work_order_id" field.
  String? _workOrderId;
  String get workOrderId => _workOrderId ?? '';
  set workOrderId(String? val) => _workOrderId = val;

  bool hasWorkOrderId() => _workOrderId != null;

  // "route_date" field.
  String? _routeDate;
  String get routeDate => _routeDate ?? '';
  set routeDate(String? val) => _routeDate = val;

  bool hasRouteDate() => _routeDate != null;

  // "stop_number" field.
  String? _stopNumber;
  String get stopNumber => _stopNumber ?? '';
  set stopNumber(String? val) => _stopNumber = val;

  bool hasStopNumber() => _stopNumber != null;

  // "start_location_lat" field.
  String? _startLocationLat;
  String get startLocationLat => _startLocationLat ?? '';
  set startLocationLat(String? val) => _startLocationLat = val;

  bool hasStartLocationLat() => _startLocationLat != null;

  // "start_location_long" field.
  String? _startLocationLong;
  String get startLocationLong => _startLocationLong ?? '';
  set startLocationLong(String? val) => _startLocationLong = val;

  bool hasStartLocationLong() => _startLocationLong != null;

  // "end_location_lat" field.
  String? _endLocationLat;
  String get endLocationLat => _endLocationLat ?? '';
  set endLocationLat(String? val) => _endLocationLat = val;

  bool hasEndLocationLat() => _endLocationLat != null;

  // "end_location_long" field.
  String? _endLocationLong;
  String get endLocationLong => _endLocationLong ?? '';
  set endLocationLong(String? val) => _endLocationLong = val;

  bool hasEndLocationLong() => _endLocationLong != null;

  // "appointment_date" field.
  String? _appointmentDate;
  String get appointmentDate => _appointmentDate ?? '';
  set appointmentDate(String? val) => _appointmentDate = val;

  bool hasAppointmentDate() => _appointmentDate != null;

  // "window_time" field.
  String? _windowTime;
  String get windowTime => _windowTime ?? '';
  set windowTime(String? val) => _windowTime = val;

  bool hasWindowTime() => _windowTime != null;

  // "window_time_changed" field.
  bool? _windowTimeChanged;
  bool get windowTimeChanged => _windowTimeChanged ?? false;
  set windowTimeChanged(bool? val) => _windowTimeChanged = val;

  bool hasWindowTimeChanged() => _windowTimeChanged != null;

  // "appointment_status" field.
  String? _appointmentStatus;
  String get appointmentStatus => _appointmentStatus ?? '';
  set appointmentStatus(String? val) => _appointmentStatus = val;

  bool hasAppointmentStatus() => _appointmentStatus != null;

  // "customer_address" field.
  String? _customerAddress;
  String get customerAddress => _customerAddress ?? '';
  set customerAddress(String? val) => _customerAddress = val;

  bool hasCustomerAddress() => _customerAddress != null;

  // "customer_lat" field.
  String? _customerLat;
  String get customerLat => _customerLat ?? '';
  set customerLat(String? val) => _customerLat = val;

  bool hasCustomerLat() => _customerLat != null;

  // "customer_lng" field.
  String? _customerLng;
  String get customerLng => _customerLng ?? '';
  set customerLng(String? val) => _customerLng = val;

  bool hasCustomerLng() => _customerLng != null;

  // "customer_phone" field.
  String? _customerPhone;
  String get customerPhone => _customerPhone ?? '';
  set customerPhone(String? val) => _customerPhone = val;

  bool hasCustomerPhone() => _customerPhone != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "appointment_start" field.
  String? _appointmentStart;
  String get appointmentStart => _appointmentStart ?? '';
  set appointmentStart(String? val) => _appointmentStart = val;

  bool hasAppointmentStart() => _appointmentStart != null;

  // "appointment_end" field.
  String? _appointmentEnd;
  String get appointmentEnd => _appointmentEnd ?? '';
  set appointmentEnd(String? val) => _appointmentEnd = val;

  bool hasAppointmentEnd() => _appointmentEnd != null;

  // "start_time" field.
  String? _startTime;
  String get startTime => _startTime ?? '';
  set startTime(String? val) => _startTime = val;

  bool hasStartTime() => _startTime != null;

  // "end_time" field.
  String? _endTime;
  String get endTime => _endTime ?? '';
  set endTime(String? val) => _endTime = val;

  bool hasEndTime() => _endTime != null;

  // "helper" field.
  bool? _helper;
  bool get helper => _helper ?? false;
  set helper(bool? val) => _helper = val;

  bool hasHelper() => _helper != null;

  // "itens" field.
  List<String>? _itens;
  List<String> get itens => _itens ?? const [];
  set itens(List<String>? val) => _itens = val;

  void updateItens(Function(List<String>) updateFn) {
    updateFn(_itens ??= []);
  }

  bool hasItens() => _itens != null;

  // "technicians_name" field.
  String? _techniciansName;
  String get techniciansName => _techniciansName ?? '';
  set techniciansName(String? val) => _techniciansName = val;

  bool hasTechniciansName() => _techniciansName != null;

  // "technicians_photo" field.
  String? _techniciansPhoto;
  String get techniciansPhoto => _techniciansPhoto ?? '';
  set techniciansPhoto(String? val) => _techniciansPhoto = val;

  bool hasTechniciansPhoto() => _techniciansPhoto != null;

  // "appointment_type" field.
  String? _appointmentType;
  String get appointmentType => _appointmentType ?? '';
  set appointmentType(String? val) => _appointmentType = val;

  bool hasAppointmentType() => _appointmentType != null;

  // "technicians_uuid" field.
  String? _techniciansUuid;
  String get techniciansUuid => _techniciansUuid ?? '';
  set techniciansUuid(String? val) => _techniciansUuid = val;

  bool hasTechniciansUuid() => _techniciansUuid != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  set completed(bool? val) => _completed = val;

  bool hasCompleted() => _completed != null;

  // "update_review" field.
  bool? _updateReview;
  bool get updateReview => _updateReview ?? false;
  set updateReview(bool? val) => _updateReview = val;

  bool hasUpdateReview() => _updateReview != null;

  // "customer_name" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  set customerName(String? val) => _customerName = val;

  bool hasCustomerName() => _customerName != null;

  // "apt" field.
  String? _apt;
  String get apt => _apt ?? '';
  set apt(String? val) => _apt = val;

  bool hasApt() => _apt != null;

  // "manager_review" field.
  bool? _managerReview;
  bool get managerReview => _managerReview ?? false;
  set managerReview(bool? val) => _managerReview = val;

  bool hasManagerReview() => _managerReview != null;

  // "lat_lng" field.
  String? _latLng;
  String get latLng => _latLng ?? '';
  set latLng(String? val) => _latLng = val;

  bool hasLatLng() => _latLng != null;

  // "event_type" field.
  String? _eventType;
  String get eventType => _eventType ?? '';
  set eventType(String? val) => _eventType = val;

  bool hasEventType() => _eventType != null;

  // "technician_color" field.
  String? _technicianColor;
  String get technicianColor => _technicianColor ?? '';
  set technicianColor(String? val) => _technicianColor = val;

  bool hasTechnicianColor() => _technicianColor != null;

  // "office_location" field.
  String? _officeLocation;
  String get officeLocation => _officeLocation ?? '';
  set officeLocation(String? val) => _officeLocation = val;

  bool hasOfficeLocation() => _officeLocation != null;

  static SchedulesStruct fromMap(Map<String, dynamic> data) => SchedulesStruct(
        scheduleId: data['schedule_id'] as String?,
        workOrderId: data['work_order_id'] as String?,
        routeDate: data['route_date'] as String?,
        stopNumber: data['stop_number'] as String?,
        startLocationLat: data['start_location_lat'] as String?,
        startLocationLong: data['start_location_long'] as String?,
        endLocationLat: data['end_location_lat'] as String?,
        endLocationLong: data['end_location_long'] as String?,
        appointmentDate: data['appointment_date'] as String?,
        windowTime: data['window_time'] as String?,
        windowTimeChanged: data['window_time_changed'] as bool?,
        appointmentStatus: data['appointment_status'] as String?,
        customerAddress: data['customer_address'] as String?,
        customerLat: data['customer_lat'] as String?,
        customerLng: data['customer_lng'] as String?,
        customerPhone: data['customer_phone'] as String?,
        location: data['location'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
        appointmentStart: data['appointment_start'] as String?,
        appointmentEnd: data['appointment_end'] as String?,
        startTime: data['start_time'] as String?,
        endTime: data['end_time'] as String?,
        helper: data['helper'] as bool?,
        itens: getDataList(data['itens']),
        techniciansName: data['technicians_name'] as String?,
        techniciansPhoto: data['technicians_photo'] as String?,
        appointmentType: data['appointment_type'] as String?,
        techniciansUuid: data['technicians_uuid'] as String?,
        completed: data['completed'] as bool?,
        updateReview: data['update_review'] as bool?,
        customerName: data['customer_name'] as String?,
        apt: data['apt'] as String?,
        managerReview: data['manager_review'] as bool?,
        latLng: data['lat_lng'] as String?,
        eventType: data['event_type'] as String?,
        technicianColor: data['technician_color'] as String?,
        officeLocation: data['office_location'] as String?,
      );

  static SchedulesStruct? maybeFromMap(dynamic data) => data is Map
      ? SchedulesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'schedule_id': _scheduleId,
        'work_order_id': _workOrderId,
        'route_date': _routeDate,
        'stop_number': _stopNumber,
        'start_location_lat': _startLocationLat,
        'start_location_long': _startLocationLong,
        'end_location_lat': _endLocationLat,
        'end_location_long': _endLocationLong,
        'appointment_date': _appointmentDate,
        'window_time': _windowTime,
        'window_time_changed': _windowTimeChanged,
        'appointment_status': _appointmentStatus,
        'customer_address': _customerAddress,
        'customer_lat': _customerLat,
        'customer_lng': _customerLng,
        'customer_phone': _customerPhone,
        'location': _location,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'appointment_start': _appointmentStart,
        'appointment_end': _appointmentEnd,
        'start_time': _startTime,
        'end_time': _endTime,
        'helper': _helper,
        'itens': _itens,
        'technicians_name': _techniciansName,
        'technicians_photo': _techniciansPhoto,
        'appointment_type': _appointmentType,
        'technicians_uuid': _techniciansUuid,
        'completed': _completed,
        'update_review': _updateReview,
        'customer_name': _customerName,
        'apt': _apt,
        'manager_review': _managerReview,
        'lat_lng': _latLng,
        'event_type': _eventType,
        'technician_color': _technicianColor,
        'office_location': _officeLocation,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'schedule_id': serializeParam(
          _scheduleId,
          ParamType.String,
        ),
        'work_order_id': serializeParam(
          _workOrderId,
          ParamType.String,
        ),
        'route_date': serializeParam(
          _routeDate,
          ParamType.String,
        ),
        'stop_number': serializeParam(
          _stopNumber,
          ParamType.String,
        ),
        'start_location_lat': serializeParam(
          _startLocationLat,
          ParamType.String,
        ),
        'start_location_long': serializeParam(
          _startLocationLong,
          ParamType.String,
        ),
        'end_location_lat': serializeParam(
          _endLocationLat,
          ParamType.String,
        ),
        'end_location_long': serializeParam(
          _endLocationLong,
          ParamType.String,
        ),
        'appointment_date': serializeParam(
          _appointmentDate,
          ParamType.String,
        ),
        'window_time': serializeParam(
          _windowTime,
          ParamType.String,
        ),
        'window_time_changed': serializeParam(
          _windowTimeChanged,
          ParamType.bool,
        ),
        'appointment_status': serializeParam(
          _appointmentStatus,
          ParamType.String,
        ),
        'customer_address': serializeParam(
          _customerAddress,
          ParamType.String,
        ),
        'customer_lat': serializeParam(
          _customerLat,
          ParamType.String,
        ),
        'customer_lng': serializeParam(
          _customerLng,
          ParamType.String,
        ),
        'customer_phone': serializeParam(
          _customerPhone,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'appointment_start': serializeParam(
          _appointmentStart,
          ParamType.String,
        ),
        'appointment_end': serializeParam(
          _appointmentEnd,
          ParamType.String,
        ),
        'start_time': serializeParam(
          _startTime,
          ParamType.String,
        ),
        'end_time': serializeParam(
          _endTime,
          ParamType.String,
        ),
        'helper': serializeParam(
          _helper,
          ParamType.bool,
        ),
        'itens': serializeParam(
          _itens,
          ParamType.String,
          isList: true,
        ),
        'technicians_name': serializeParam(
          _techniciansName,
          ParamType.String,
        ),
        'technicians_photo': serializeParam(
          _techniciansPhoto,
          ParamType.String,
        ),
        'appointment_type': serializeParam(
          _appointmentType,
          ParamType.String,
        ),
        'technicians_uuid': serializeParam(
          _techniciansUuid,
          ParamType.String,
        ),
        'completed': serializeParam(
          _completed,
          ParamType.bool,
        ),
        'update_review': serializeParam(
          _updateReview,
          ParamType.bool,
        ),
        'customer_name': serializeParam(
          _customerName,
          ParamType.String,
        ),
        'apt': serializeParam(
          _apt,
          ParamType.String,
        ),
        'manager_review': serializeParam(
          _managerReview,
          ParamType.bool,
        ),
        'lat_lng': serializeParam(
          _latLng,
          ParamType.String,
        ),
        'event_type': serializeParam(
          _eventType,
          ParamType.String,
        ),
        'technician_color': serializeParam(
          _technicianColor,
          ParamType.String,
        ),
        'office_location': serializeParam(
          _officeLocation,
          ParamType.String,
        ),
      }.withoutNulls;

  static SchedulesStruct fromSerializableMap(Map<String, dynamic> data) =>
      SchedulesStruct(
        scheduleId: deserializeParam(
          data['schedule_id'],
          ParamType.String,
          false,
        ),
        workOrderId: deserializeParam(
          data['work_order_id'],
          ParamType.String,
          false,
        ),
        routeDate: deserializeParam(
          data['route_date'],
          ParamType.String,
          false,
        ),
        stopNumber: deserializeParam(
          data['stop_number'],
          ParamType.String,
          false,
        ),
        startLocationLat: deserializeParam(
          data['start_location_lat'],
          ParamType.String,
          false,
        ),
        startLocationLong: deserializeParam(
          data['start_location_long'],
          ParamType.String,
          false,
        ),
        endLocationLat: deserializeParam(
          data['end_location_lat'],
          ParamType.String,
          false,
        ),
        endLocationLong: deserializeParam(
          data['end_location_long'],
          ParamType.String,
          false,
        ),
        appointmentDate: deserializeParam(
          data['appointment_date'],
          ParamType.String,
          false,
        ),
        windowTime: deserializeParam(
          data['window_time'],
          ParamType.String,
          false,
        ),
        windowTimeChanged: deserializeParam(
          data['window_time_changed'],
          ParamType.bool,
          false,
        ),
        appointmentStatus: deserializeParam(
          data['appointment_status'],
          ParamType.String,
          false,
        ),
        customerAddress: deserializeParam(
          data['customer_address'],
          ParamType.String,
          false,
        ),
        customerLat: deserializeParam(
          data['customer_lat'],
          ParamType.String,
          false,
        ),
        customerLng: deserializeParam(
          data['customer_lng'],
          ParamType.String,
          false,
        ),
        customerPhone: deserializeParam(
          data['customer_phone'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
        appointmentStart: deserializeParam(
          data['appointment_start'],
          ParamType.String,
          false,
        ),
        appointmentEnd: deserializeParam(
          data['appointment_end'],
          ParamType.String,
          false,
        ),
        startTime: deserializeParam(
          data['start_time'],
          ParamType.String,
          false,
        ),
        endTime: deserializeParam(
          data['end_time'],
          ParamType.String,
          false,
        ),
        helper: deserializeParam(
          data['helper'],
          ParamType.bool,
          false,
        ),
        itens: deserializeParam<String>(
          data['itens'],
          ParamType.String,
          true,
        ),
        techniciansName: deserializeParam(
          data['technicians_name'],
          ParamType.String,
          false,
        ),
        techniciansPhoto: deserializeParam(
          data['technicians_photo'],
          ParamType.String,
          false,
        ),
        appointmentType: deserializeParam(
          data['appointment_type'],
          ParamType.String,
          false,
        ),
        techniciansUuid: deserializeParam(
          data['technicians_uuid'],
          ParamType.String,
          false,
        ),
        completed: deserializeParam(
          data['completed'],
          ParamType.bool,
          false,
        ),
        updateReview: deserializeParam(
          data['update_review'],
          ParamType.bool,
          false,
        ),
        customerName: deserializeParam(
          data['customer_name'],
          ParamType.String,
          false,
        ),
        apt: deserializeParam(
          data['apt'],
          ParamType.String,
          false,
        ),
        managerReview: deserializeParam(
          data['manager_review'],
          ParamType.bool,
          false,
        ),
        latLng: deserializeParam(
          data['lat_lng'],
          ParamType.String,
          false,
        ),
        eventType: deserializeParam(
          data['event_type'],
          ParamType.String,
          false,
        ),
        technicianColor: deserializeParam(
          data['technician_color'],
          ParamType.String,
          false,
        ),
        officeLocation: deserializeParam(
          data['office_location'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SchedulesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SchedulesStruct &&
        scheduleId == other.scheduleId &&
        workOrderId == other.workOrderId &&
        routeDate == other.routeDate &&
        stopNumber == other.stopNumber &&
        startLocationLat == other.startLocationLat &&
        startLocationLong == other.startLocationLong &&
        endLocationLat == other.endLocationLat &&
        endLocationLong == other.endLocationLong &&
        appointmentDate == other.appointmentDate &&
        windowTime == other.windowTime &&
        windowTimeChanged == other.windowTimeChanged &&
        appointmentStatus == other.appointmentStatus &&
        customerAddress == other.customerAddress &&
        customerLat == other.customerLat &&
        customerLng == other.customerLng &&
        customerPhone == other.customerPhone &&
        location == other.location &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        appointmentStart == other.appointmentStart &&
        appointmentEnd == other.appointmentEnd &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        helper == other.helper &&
        listEquality.equals(itens, other.itens) &&
        techniciansName == other.techniciansName &&
        techniciansPhoto == other.techniciansPhoto &&
        appointmentType == other.appointmentType &&
        techniciansUuid == other.techniciansUuid &&
        completed == other.completed &&
        updateReview == other.updateReview &&
        customerName == other.customerName &&
        apt == other.apt &&
        managerReview == other.managerReview &&
        latLng == other.latLng &&
        eventType == other.eventType &&
        technicianColor == other.technicianColor &&
        officeLocation == other.officeLocation;
  }

  @override
  int get hashCode => const ListEquality().hash([
        scheduleId,
        workOrderId,
        routeDate,
        stopNumber,
        startLocationLat,
        startLocationLong,
        endLocationLat,
        endLocationLong,
        appointmentDate,
        windowTime,
        windowTimeChanged,
        appointmentStatus,
        customerAddress,
        customerLat,
        customerLng,
        customerPhone,
        location,
        createdAt,
        updatedAt,
        appointmentStart,
        appointmentEnd,
        startTime,
        endTime,
        helper,
        itens,
        techniciansName,
        techniciansPhoto,
        appointmentType,
        techniciansUuid,
        completed,
        updateReview,
        customerName,
        apt,
        managerReview,
        latLng,
        eventType,
        technicianColor,
        officeLocation
      ]);
}

SchedulesStruct createSchedulesStruct({
  String? scheduleId,
  String? workOrderId,
  String? routeDate,
  String? stopNumber,
  String? startLocationLat,
  String? startLocationLong,
  String? endLocationLat,
  String? endLocationLong,
  String? appointmentDate,
  String? windowTime,
  bool? windowTimeChanged,
  String? appointmentStatus,
  String? customerAddress,
  String? customerLat,
  String? customerLng,
  String? customerPhone,
  String? location,
  String? createdAt,
  String? updatedAt,
  String? appointmentStart,
  String? appointmentEnd,
  String? startTime,
  String? endTime,
  bool? helper,
  String? techniciansName,
  String? techniciansPhoto,
  String? appointmentType,
  String? techniciansUuid,
  bool? completed,
  bool? updateReview,
  String? customerName,
  String? apt,
  bool? managerReview,
  String? latLng,
  String? eventType,
  String? technicianColor,
  String? officeLocation,
}) =>
    SchedulesStruct(
      scheduleId: scheduleId,
      workOrderId: workOrderId,
      routeDate: routeDate,
      stopNumber: stopNumber,
      startLocationLat: startLocationLat,
      startLocationLong: startLocationLong,
      endLocationLat: endLocationLat,
      endLocationLong: endLocationLong,
      appointmentDate: appointmentDate,
      windowTime: windowTime,
      windowTimeChanged: windowTimeChanged,
      appointmentStatus: appointmentStatus,
      customerAddress: customerAddress,
      customerLat: customerLat,
      customerLng: customerLng,
      customerPhone: customerPhone,
      location: location,
      createdAt: createdAt,
      updatedAt: updatedAt,
      appointmentStart: appointmentStart,
      appointmentEnd: appointmentEnd,
      startTime: startTime,
      endTime: endTime,
      helper: helper,
      techniciansName: techniciansName,
      techniciansPhoto: techniciansPhoto,
      appointmentType: appointmentType,
      techniciansUuid: techniciansUuid,
      completed: completed,
      updateReview: updateReview,
      customerName: customerName,
      apt: apt,
      managerReview: managerReview,
      latLng: latLng,
      eventType: eventType,
      technicianColor: technicianColor,
      officeLocation: officeLocation,
    );
