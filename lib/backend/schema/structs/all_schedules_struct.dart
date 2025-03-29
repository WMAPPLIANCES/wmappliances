// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AllSchedulesStruct extends BaseStruct {
  AllSchedulesStruct({
    String? apt,
    List<String>? itens,
    bool? helper,
    String? latLng,
    String? endTime,
    String? location,
    bool? completed,
    String? createdAt,
    String? eventType,
    String? routeDate,
    String? startTime,
    String? updatedAt,
    String? scheduleId,
    String? stopNumber,
    String? technicians,
    String? windowTime,
    String? customerLat,
    String? customerLng,
    String? customerName,
    bool? updateReview,
    String? workOrderId,
    String? customerPhone,
    bool? managerReview,
    String? appointmentEnd,
    String? appointmentDate,
    String? appointmentType,
    String? customerAddress,
    String? endLocationLat,
    String? technicianColor,
    String? techniciansName,
    String? appointmentStart,
    String? endLocationLong,
    String? techniciansPhoto,
    String? appointmentStatus,
    String? startLocationLat,
    String? startLocationLong,
    bool? windowTimeChanged,
    String? officeLocation,
  })  : _apt = apt,
        _itens = itens,
        _helper = helper,
        _latLng = latLng,
        _endTime = endTime,
        _location = location,
        _completed = completed,
        _createdAt = createdAt,
        _eventType = eventType,
        _routeDate = routeDate,
        _startTime = startTime,
        _updatedAt = updatedAt,
        _scheduleId = scheduleId,
        _stopNumber = stopNumber,
        _technicians = technicians,
        _windowTime = windowTime,
        _customerLat = customerLat,
        _customerLng = customerLng,
        _customerName = customerName,
        _updateReview = updateReview,
        _workOrderId = workOrderId,
        _customerPhone = customerPhone,
        _managerReview = managerReview,
        _appointmentEnd = appointmentEnd,
        _appointmentDate = appointmentDate,
        _appointmentType = appointmentType,
        _customerAddress = customerAddress,
        _endLocationLat = endLocationLat,
        _technicianColor = technicianColor,
        _techniciansName = techniciansName,
        _appointmentStart = appointmentStart,
        _endLocationLong = endLocationLong,
        _techniciansPhoto = techniciansPhoto,
        _appointmentStatus = appointmentStatus,
        _startLocationLat = startLocationLat,
        _startLocationLong = startLocationLong,
        _windowTimeChanged = windowTimeChanged,
        _officeLocation = officeLocation;

  // "apt" field.
  String? _apt;
  String get apt => _apt ?? 'w';
  set apt(String? val) => _apt = val;

  bool hasApt() => _apt != null;

  // "itens" field.
  List<String>? _itens;
  List<String> get itens => _itens ?? const [];
  set itens(List<String>? val) => _itens = val;

  void updateItens(Function(List<String>) updateFn) {
    updateFn(_itens ??= []);
  }

  bool hasItens() => _itens != null;

  // "helper" field.
  bool? _helper;
  bool get helper => _helper ?? false;
  set helper(bool? val) => _helper = val;

  bool hasHelper() => _helper != null;

  // "latLng" field.
  String? _latLng;
  String get latLng => _latLng ?? 'w';
  set latLng(String? val) => _latLng = val;

  bool hasLatLng() => _latLng != null;

  // "end_time" field.
  String? _endTime;
  String get endTime => _endTime ?? '2025-03-19 12:00:00';
  set endTime(String? val) => _endTime = val;

  bool hasEndTime() => _endTime != null;

  // "location" field.
  String? _location;
  String get location => _location ?? 'w';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  set completed(bool? val) => _completed = val;

  bool hasCompleted() => _completed != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? 'w';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "event_type" field.
  String? _eventType;
  String get eventType => _eventType ?? 'ww';
  set eventType(String? val) => _eventType = val;

  bool hasEventType() => _eventType != null;

  // "route_date" field.
  String? _routeDate;
  String get routeDate => _routeDate ?? 'w';
  set routeDate(String? val) => _routeDate = val;

  bool hasRouteDate() => _routeDate != null;

  // "start_time" field.
  String? _startTime;
  String get startTime => _startTime ?? '2025-03-19 12:00:00';
  set startTime(String? val) => _startTime = val;

  bool hasStartTime() => _startTime != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '2025-03-19 12:00:00';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "schedule_id" field.
  String? _scheduleId;
  String get scheduleId => _scheduleId ?? 'ww';
  set scheduleId(String? val) => _scheduleId = val;

  bool hasScheduleId() => _scheduleId != null;

  // "stop_number" field.
  String? _stopNumber;
  String get stopNumber => _stopNumber ?? '0';
  set stopNumber(String? val) => _stopNumber = val;

  bool hasStopNumber() => _stopNumber != null;

  // "technicians" field.
  String? _technicians;
  String get technicians => _technicians ?? 'w';
  set technicians(String? val) => _technicians = val;

  bool hasTechnicians() => _technicians != null;

  // "window_time" field.
  String? _windowTime;
  String get windowTime => _windowTime ?? 'w';
  set windowTime(String? val) => _windowTime = val;

  bool hasWindowTime() => _windowTime != null;

  // "customer_lat" field.
  String? _customerLat;
  String get customerLat => _customerLat ?? 'w';
  set customerLat(String? val) => _customerLat = val;

  bool hasCustomerLat() => _customerLat != null;

  // "customer_lng" field.
  String? _customerLng;
  String get customerLng => _customerLng ?? 'w';
  set customerLng(String? val) => _customerLng = val;

  bool hasCustomerLng() => _customerLng != null;

  // "customer_name" field.
  String? _customerName;
  String get customerName => _customerName ?? 'w';
  set customerName(String? val) => _customerName = val;

  bool hasCustomerName() => _customerName != null;

  // "update_review" field.
  bool? _updateReview;
  bool get updateReview => _updateReview ?? false;
  set updateReview(bool? val) => _updateReview = val;

  bool hasUpdateReview() => _updateReview != null;

  // "work_order_id" field.
  String? _workOrderId;
  String get workOrderId => _workOrderId ?? 'w';
  set workOrderId(String? val) => _workOrderId = val;

  bool hasWorkOrderId() => _workOrderId != null;

  // "customer_phone" field.
  String? _customerPhone;
  String get customerPhone => _customerPhone ?? 'w';
  set customerPhone(String? val) => _customerPhone = val;

  bool hasCustomerPhone() => _customerPhone != null;

  // "manager_review" field.
  bool? _managerReview;
  bool get managerReview => _managerReview ?? false;
  set managerReview(bool? val) => _managerReview = val;

  bool hasManagerReview() => _managerReview != null;

  // "appointment_end" field.
  String? _appointmentEnd;
  String get appointmentEnd => _appointmentEnd ?? 'w';
  set appointmentEnd(String? val) => _appointmentEnd = val;

  bool hasAppointmentEnd() => _appointmentEnd != null;

  // "appointment_date" field.
  String? _appointmentDate;
  String get appointmentDate => _appointmentDate ?? '2025-03-19 12:00:00';
  set appointmentDate(String? val) => _appointmentDate = val;

  bool hasAppointmentDate() => _appointmentDate != null;

  // "appointment_type" field.
  String? _appointmentType;
  String get appointmentType => _appointmentType ?? 'w';
  set appointmentType(String? val) => _appointmentType = val;

  bool hasAppointmentType() => _appointmentType != null;

  // "customer_address" field.
  String? _customerAddress;
  String get customerAddress => _customerAddress ?? 'w';
  set customerAddress(String? val) => _customerAddress = val;

  bool hasCustomerAddress() => _customerAddress != null;

  // "end_location_lat" field.
  String? _endLocationLat;
  String get endLocationLat => _endLocationLat ?? 'w';
  set endLocationLat(String? val) => _endLocationLat = val;

  bool hasEndLocationLat() => _endLocationLat != null;

  // "technician_color" field.
  String? _technicianColor;
  String get technicianColor => _technicianColor ?? 'w';
  set technicianColor(String? val) => _technicianColor = val;

  bool hasTechnicianColor() => _technicianColor != null;

  // "technicians_name" field.
  String? _techniciansName;
  String get techniciansName => _techniciansName ?? 'w';
  set techniciansName(String? val) => _techniciansName = val;

  bool hasTechniciansName() => _techniciansName != null;

  // "appointment_start" field.
  String? _appointmentStart;
  String get appointmentStart => _appointmentStart ?? 'w';
  set appointmentStart(String? val) => _appointmentStart = val;

  bool hasAppointmentStart() => _appointmentStart != null;

  // "end_location_long" field.
  String? _endLocationLong;
  String get endLocationLong => _endLocationLong ?? 'ww';
  set endLocationLong(String? val) => _endLocationLong = val;

  bool hasEndLocationLong() => _endLocationLong != null;

  // "technicians_photo" field.
  String? _techniciansPhoto;
  String get techniciansPhoto => _techniciansPhoto ?? 'w';
  set techniciansPhoto(String? val) => _techniciansPhoto = val;

  bool hasTechniciansPhoto() => _techniciansPhoto != null;

  // "appointment_status" field.
  String? _appointmentStatus;
  String get appointmentStatus => _appointmentStatus ?? 'w';
  set appointmentStatus(String? val) => _appointmentStatus = val;

  bool hasAppointmentStatus() => _appointmentStatus != null;

  // "start_location_lat" field.
  String? _startLocationLat;
  String get startLocationLat => _startLocationLat ?? 'w';
  set startLocationLat(String? val) => _startLocationLat = val;

  bool hasStartLocationLat() => _startLocationLat != null;

  // "start_location_long" field.
  String? _startLocationLong;
  String get startLocationLong => _startLocationLong ?? 'w';
  set startLocationLong(String? val) => _startLocationLong = val;

  bool hasStartLocationLong() => _startLocationLong != null;

  // "window_time_changed" field.
  bool? _windowTimeChanged;
  bool get windowTimeChanged => _windowTimeChanged ?? false;
  set windowTimeChanged(bool? val) => _windowTimeChanged = val;

  bool hasWindowTimeChanged() => _windowTimeChanged != null;

  // "office_location" field.
  String? _officeLocation;
  String get officeLocation => _officeLocation ?? 'w';
  set officeLocation(String? val) => _officeLocation = val;

  bool hasOfficeLocation() => _officeLocation != null;

  static AllSchedulesStruct fromMap(Map<String, dynamic> data) =>
      AllSchedulesStruct(
        apt: data['apt'] as String?,
        itens: getDataList(data['itens']),
        helper: data['helper'] as bool?,
        latLng: data['latLng'] as String?,
        endTime: data['end_time'] as String?,
        location: data['location'] as String?,
        completed: data['completed'] as bool?,
        createdAt: data['created_at'] as String?,
        eventType: data['event_type'] as String?,
        routeDate: data['route_date'] as String?,
        startTime: data['start_time'] as String?,
        updatedAt: data['updated_at'] as String?,
        scheduleId: data['schedule_id'] as String?,
        stopNumber: data['stop_number'] as String?,
        technicians: data['technicians'] as String?,
        windowTime: data['window_time'] as String?,
        customerLat: data['customer_lat'] as String?,
        customerLng: data['customer_lng'] as String?,
        customerName: data['customer_name'] as String?,
        updateReview: data['update_review'] as bool?,
        workOrderId: data['work_order_id'] as String?,
        customerPhone: data['customer_phone'] as String?,
        managerReview: data['manager_review'] as bool?,
        appointmentEnd: data['appointment_end'] as String?,
        appointmentDate: data['appointment_date'] as String?,
        appointmentType: data['appointment_type'] as String?,
        customerAddress: data['customer_address'] as String?,
        endLocationLat: data['end_location_lat'] as String?,
        technicianColor: data['technician_color'] as String?,
        techniciansName: data['technicians_name'] as String?,
        appointmentStart: data['appointment_start'] as String?,
        endLocationLong: data['end_location_long'] as String?,
        techniciansPhoto: data['technicians_photo'] as String?,
        appointmentStatus: data['appointment_status'] as String?,
        startLocationLat: data['start_location_lat'] as String?,
        startLocationLong: data['start_location_long'] as String?,
        windowTimeChanged: data['window_time_changed'] as bool?,
        officeLocation: data['office_location'] as String?,
      );

  static AllSchedulesStruct? maybeFromMap(dynamic data) => data is Map
      ? AllSchedulesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'apt': _apt,
        'itens': _itens,
        'helper': _helper,
        'latLng': _latLng,
        'end_time': _endTime,
        'location': _location,
        'completed': _completed,
        'created_at': _createdAt,
        'event_type': _eventType,
        'route_date': _routeDate,
        'start_time': _startTime,
        'updated_at': _updatedAt,
        'schedule_id': _scheduleId,
        'stop_number': _stopNumber,
        'technicians': _technicians,
        'window_time': _windowTime,
        'customer_lat': _customerLat,
        'customer_lng': _customerLng,
        'customer_name': _customerName,
        'update_review': _updateReview,
        'work_order_id': _workOrderId,
        'customer_phone': _customerPhone,
        'manager_review': _managerReview,
        'appointment_end': _appointmentEnd,
        'appointment_date': _appointmentDate,
        'appointment_type': _appointmentType,
        'customer_address': _customerAddress,
        'end_location_lat': _endLocationLat,
        'technician_color': _technicianColor,
        'technicians_name': _techniciansName,
        'appointment_start': _appointmentStart,
        'end_location_long': _endLocationLong,
        'technicians_photo': _techniciansPhoto,
        'appointment_status': _appointmentStatus,
        'start_location_lat': _startLocationLat,
        'start_location_long': _startLocationLong,
        'window_time_changed': _windowTimeChanged,
        'office_location': _officeLocation,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'apt': serializeParam(
          _apt,
          ParamType.String,
        ),
        'itens': serializeParam(
          _itens,
          ParamType.String,
          isList: true,
        ),
        'helper': serializeParam(
          _helper,
          ParamType.bool,
        ),
        'latLng': serializeParam(
          _latLng,
          ParamType.String,
        ),
        'end_time': serializeParam(
          _endTime,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'completed': serializeParam(
          _completed,
          ParamType.bool,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'event_type': serializeParam(
          _eventType,
          ParamType.String,
        ),
        'route_date': serializeParam(
          _routeDate,
          ParamType.String,
        ),
        'start_time': serializeParam(
          _startTime,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'schedule_id': serializeParam(
          _scheduleId,
          ParamType.String,
        ),
        'stop_number': serializeParam(
          _stopNumber,
          ParamType.String,
        ),
        'technicians': serializeParam(
          _technicians,
          ParamType.String,
        ),
        'window_time': serializeParam(
          _windowTime,
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
        'customer_name': serializeParam(
          _customerName,
          ParamType.String,
        ),
        'update_review': serializeParam(
          _updateReview,
          ParamType.bool,
        ),
        'work_order_id': serializeParam(
          _workOrderId,
          ParamType.String,
        ),
        'customer_phone': serializeParam(
          _customerPhone,
          ParamType.String,
        ),
        'manager_review': serializeParam(
          _managerReview,
          ParamType.bool,
        ),
        'appointment_end': serializeParam(
          _appointmentEnd,
          ParamType.String,
        ),
        'appointment_date': serializeParam(
          _appointmentDate,
          ParamType.String,
        ),
        'appointment_type': serializeParam(
          _appointmentType,
          ParamType.String,
        ),
        'customer_address': serializeParam(
          _customerAddress,
          ParamType.String,
        ),
        'end_location_lat': serializeParam(
          _endLocationLat,
          ParamType.String,
        ),
        'technician_color': serializeParam(
          _technicianColor,
          ParamType.String,
        ),
        'technicians_name': serializeParam(
          _techniciansName,
          ParamType.String,
        ),
        'appointment_start': serializeParam(
          _appointmentStart,
          ParamType.String,
        ),
        'end_location_long': serializeParam(
          _endLocationLong,
          ParamType.String,
        ),
        'technicians_photo': serializeParam(
          _techniciansPhoto,
          ParamType.String,
        ),
        'appointment_status': serializeParam(
          _appointmentStatus,
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
        'window_time_changed': serializeParam(
          _windowTimeChanged,
          ParamType.bool,
        ),
        'office_location': serializeParam(
          _officeLocation,
          ParamType.String,
        ),
      }.withoutNulls;

  static AllSchedulesStruct fromSerializableMap(Map<String, dynamic> data) =>
      AllSchedulesStruct(
        apt: deserializeParam(
          data['apt'],
          ParamType.String,
          false,
        ),
        itens: deserializeParam<String>(
          data['itens'],
          ParamType.String,
          true,
        ),
        helper: deserializeParam(
          data['helper'],
          ParamType.bool,
          false,
        ),
        latLng: deserializeParam(
          data['latLng'],
          ParamType.String,
          false,
        ),
        endTime: deserializeParam(
          data['end_time'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        completed: deserializeParam(
          data['completed'],
          ParamType.bool,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        eventType: deserializeParam(
          data['event_type'],
          ParamType.String,
          false,
        ),
        routeDate: deserializeParam(
          data['route_date'],
          ParamType.String,
          false,
        ),
        startTime: deserializeParam(
          data['start_time'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
        scheduleId: deserializeParam(
          data['schedule_id'],
          ParamType.String,
          false,
        ),
        stopNumber: deserializeParam(
          data['stop_number'],
          ParamType.String,
          false,
        ),
        technicians: deserializeParam(
          data['technicians'],
          ParamType.String,
          false,
        ),
        windowTime: deserializeParam(
          data['window_time'],
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
        customerName: deserializeParam(
          data['customer_name'],
          ParamType.String,
          false,
        ),
        updateReview: deserializeParam(
          data['update_review'],
          ParamType.bool,
          false,
        ),
        workOrderId: deserializeParam(
          data['work_order_id'],
          ParamType.String,
          false,
        ),
        customerPhone: deserializeParam(
          data['customer_phone'],
          ParamType.String,
          false,
        ),
        managerReview: deserializeParam(
          data['manager_review'],
          ParamType.bool,
          false,
        ),
        appointmentEnd: deserializeParam(
          data['appointment_end'],
          ParamType.String,
          false,
        ),
        appointmentDate: deserializeParam(
          data['appointment_date'],
          ParamType.String,
          false,
        ),
        appointmentType: deserializeParam(
          data['appointment_type'],
          ParamType.String,
          false,
        ),
        customerAddress: deserializeParam(
          data['customer_address'],
          ParamType.String,
          false,
        ),
        endLocationLat: deserializeParam(
          data['end_location_lat'],
          ParamType.String,
          false,
        ),
        technicianColor: deserializeParam(
          data['technician_color'],
          ParamType.String,
          false,
        ),
        techniciansName: deserializeParam(
          data['technicians_name'],
          ParamType.String,
          false,
        ),
        appointmentStart: deserializeParam(
          data['appointment_start'],
          ParamType.String,
          false,
        ),
        endLocationLong: deserializeParam(
          data['end_location_long'],
          ParamType.String,
          false,
        ),
        techniciansPhoto: deserializeParam(
          data['technicians_photo'],
          ParamType.String,
          false,
        ),
        appointmentStatus: deserializeParam(
          data['appointment_status'],
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
        windowTimeChanged: deserializeParam(
          data['window_time_changed'],
          ParamType.bool,
          false,
        ),
        officeLocation: deserializeParam(
          data['office_location'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AllSchedulesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AllSchedulesStruct &&
        apt == other.apt &&
        listEquality.equals(itens, other.itens) &&
        helper == other.helper &&
        latLng == other.latLng &&
        endTime == other.endTime &&
        location == other.location &&
        completed == other.completed &&
        createdAt == other.createdAt &&
        eventType == other.eventType &&
        routeDate == other.routeDate &&
        startTime == other.startTime &&
        updatedAt == other.updatedAt &&
        scheduleId == other.scheduleId &&
        stopNumber == other.stopNumber &&
        technicians == other.technicians &&
        windowTime == other.windowTime &&
        customerLat == other.customerLat &&
        customerLng == other.customerLng &&
        customerName == other.customerName &&
        updateReview == other.updateReview &&
        workOrderId == other.workOrderId &&
        customerPhone == other.customerPhone &&
        managerReview == other.managerReview &&
        appointmentEnd == other.appointmentEnd &&
        appointmentDate == other.appointmentDate &&
        appointmentType == other.appointmentType &&
        customerAddress == other.customerAddress &&
        endLocationLat == other.endLocationLat &&
        technicianColor == other.technicianColor &&
        techniciansName == other.techniciansName &&
        appointmentStart == other.appointmentStart &&
        endLocationLong == other.endLocationLong &&
        techniciansPhoto == other.techniciansPhoto &&
        appointmentStatus == other.appointmentStatus &&
        startLocationLat == other.startLocationLat &&
        startLocationLong == other.startLocationLong &&
        windowTimeChanged == other.windowTimeChanged &&
        officeLocation == other.officeLocation;
  }

  @override
  int get hashCode => const ListEquality().hash([
        apt,
        itens,
        helper,
        latLng,
        endTime,
        location,
        completed,
        createdAt,
        eventType,
        routeDate,
        startTime,
        updatedAt,
        scheduleId,
        stopNumber,
        technicians,
        windowTime,
        customerLat,
        customerLng,
        customerName,
        updateReview,
        workOrderId,
        customerPhone,
        managerReview,
        appointmentEnd,
        appointmentDate,
        appointmentType,
        customerAddress,
        endLocationLat,
        technicianColor,
        techniciansName,
        appointmentStart,
        endLocationLong,
        techniciansPhoto,
        appointmentStatus,
        startLocationLat,
        startLocationLong,
        windowTimeChanged,
        officeLocation
      ]);
}

AllSchedulesStruct createAllSchedulesStruct({
  String? apt,
  bool? helper,
  String? latLng,
  String? endTime,
  String? location,
  bool? completed,
  String? createdAt,
  String? eventType,
  String? routeDate,
  String? startTime,
  String? updatedAt,
  String? scheduleId,
  String? stopNumber,
  String? technicians,
  String? windowTime,
  String? customerLat,
  String? customerLng,
  String? customerName,
  bool? updateReview,
  String? workOrderId,
  String? customerPhone,
  bool? managerReview,
  String? appointmentEnd,
  String? appointmentDate,
  String? appointmentType,
  String? customerAddress,
  String? endLocationLat,
  String? technicianColor,
  String? techniciansName,
  String? appointmentStart,
  String? endLocationLong,
  String? techniciansPhoto,
  String? appointmentStatus,
  String? startLocationLat,
  String? startLocationLong,
  bool? windowTimeChanged,
  String? officeLocation,
}) =>
    AllSchedulesStruct(
      apt: apt,
      helper: helper,
      latLng: latLng,
      endTime: endTime,
      location: location,
      completed: completed,
      createdAt: createdAt,
      eventType: eventType,
      routeDate: routeDate,
      startTime: startTime,
      updatedAt: updatedAt,
      scheduleId: scheduleId,
      stopNumber: stopNumber,
      technicians: technicians,
      windowTime: windowTime,
      customerLat: customerLat,
      customerLng: customerLng,
      customerName: customerName,
      updateReview: updateReview,
      workOrderId: workOrderId,
      customerPhone: customerPhone,
      managerReview: managerReview,
      appointmentEnd: appointmentEnd,
      appointmentDate: appointmentDate,
      appointmentType: appointmentType,
      customerAddress: customerAddress,
      endLocationLat: endLocationLat,
      technicianColor: technicianColor,
      techniciansName: techniciansName,
      appointmentStart: appointmentStart,
      endLocationLong: endLocationLong,
      techniciansPhoto: techniciansPhoto,
      appointmentStatus: appointmentStatus,
      startLocationLat: startLocationLat,
      startLocationLong: startLocationLong,
      windowTimeChanged: windowTimeChanged,
      officeLocation: officeLocation,
    );
