// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrinterDeviceStruct extends BaseStruct {
  PrinterDeviceStruct({
    String? deviceName,
    String? address,
    String? typePrinter,
    bool? isBle,
    String? vendorId,
    String? productId,
  })  : _deviceName = deviceName,
        _address = address,
        _typePrinter = typePrinter,
        _isBle = isBle,
        _vendorId = vendorId,
        _productId = productId;

  // "deviceName" field.
  String? _deviceName;
  String get deviceName => _deviceName ?? '';
  set deviceName(String? val) => _deviceName = val;

  bool hasDeviceName() => _deviceName != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "typePrinter" field.
  String? _typePrinter;
  String get typePrinter => _typePrinter ?? '';
  set typePrinter(String? val) => _typePrinter = val;

  bool hasTypePrinter() => _typePrinter != null;

  // "isBle" field.
  bool? _isBle;
  bool get isBle => _isBle ?? false;
  set isBle(bool? val) => _isBle = val;

  bool hasIsBle() => _isBle != null;

  // "vendorId" field.
  String? _vendorId;
  String get vendorId => _vendorId ?? '';
  set vendorId(String? val) => _vendorId = val;

  bool hasVendorId() => _vendorId != null;

  // "productId" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;

  bool hasProductId() => _productId != null;

  static PrinterDeviceStruct fromMap(Map<String, dynamic> data) =>
      PrinterDeviceStruct(
        deviceName: data['deviceName'] as String?,
        address: data['address'] as String?,
        typePrinter: data['typePrinter'] as String?,
        isBle: data['isBle'] as bool?,
        vendorId: data['vendorId'] as String?,
        productId: data['productId'] as String?,
      );

  static PrinterDeviceStruct? maybeFromMap(dynamic data) => data is Map
      ? PrinterDeviceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'deviceName': _deviceName,
        'address': _address,
        'typePrinter': _typePrinter,
        'isBle': _isBle,
        'vendorId': _vendorId,
        'productId': _productId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'deviceName': serializeParam(
          _deviceName,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'typePrinter': serializeParam(
          _typePrinter,
          ParamType.String,
        ),
        'isBle': serializeParam(
          _isBle,
          ParamType.bool,
        ),
        'vendorId': serializeParam(
          _vendorId,
          ParamType.String,
        ),
        'productId': serializeParam(
          _productId,
          ParamType.String,
        ),
      }.withoutNulls;

  static PrinterDeviceStruct fromSerializableMap(Map<String, dynamic> data) =>
      PrinterDeviceStruct(
        deviceName: deserializeParam(
          data['deviceName'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        typePrinter: deserializeParam(
          data['typePrinter'],
          ParamType.String,
          false,
        ),
        isBle: deserializeParam(
          data['isBle'],
          ParamType.bool,
          false,
        ),
        vendorId: deserializeParam(
          data['vendorId'],
          ParamType.String,
          false,
        ),
        productId: deserializeParam(
          data['productId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PrinterDeviceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PrinterDeviceStruct &&
        deviceName == other.deviceName &&
        address == other.address &&
        typePrinter == other.typePrinter &&
        isBle == other.isBle &&
        vendorId == other.vendorId &&
        productId == other.productId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([deviceName, address, typePrinter, isBle, vendorId, productId]);
}

PrinterDeviceStruct createPrinterDeviceStruct({
  String? deviceName,
  String? address,
  String? typePrinter,
  bool? isBle,
  String? vendorId,
  String? productId,
}) =>
    PrinterDeviceStruct(
      deviceName: deviceName,
      address: address,
      typePrinter: typePrinter,
      isBle: isBle,
      vendorId: vendorId,
      productId: productId,
    );
