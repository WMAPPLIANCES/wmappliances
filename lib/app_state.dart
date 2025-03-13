import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _imageModelNumber =
          await secureStorage.getString('ff_imageModelNumber') ??
              _imageModelNumber;
    });
    await _safeInitAsync(() async {
      _imageAppliance =
          await secureStorage.getString('ff_imageAppliance') ?? _imageAppliance;
    });
    await _safeInitAsync(() async {
      _responseModelNumberAI =
          await secureStorage.getString('ff_responseModelNumberAI') ??
              _responseModelNumberAI;
    });
    await _safeInitAsync(() async {
      _responseApplianceAi =
          await secureStorage.getString('ff_responseApplianceAi') ??
              _responseApplianceAi;
    });
    await _safeInitAsync(() async {
      _darkMode = await secureStorage.getBool('ff_darkMode') ?? _darkMode;
    });
    await _safeInitAsync(() async {
      _imageUrl = await secureStorage.getString('ff_imageUrl') ?? _imageUrl;
    });
    await _safeInitAsync(() async {
      _query = await secureStorage.getString('ff_query') ?? _query;
    });
    await _safeInitAsync(() async {
      _userRole = await secureStorage.getString('ff_userRole') ?? _userRole;
    });
    await _safeInitAsync(() async {
      _userPhoto = await secureStorage.getString('ff_userPhoto') ?? _userPhoto;
    });
    await _safeInitAsync(() async {
      _userName = await secureStorage.getString('ff_userName') ?? _userName;
    });
    await _safeInitAsync(() async {
      _userPhone = await secureStorage.getString('ff_userPhone') ?? _userPhone;
    });
    await _safeInitAsync(() async {
      _userEmail = await secureStorage.getString('ff_userEmail') ?? _userEmail;
    });
    await _safeInitAsync(() async {
      _dispatch = await secureStorage.getString('ff_dispatch') ?? _dispatch;
    });
    await _safeInitAsync(() async {
      _officeComputer =
          await secureStorage.getBool('ff_officeComputer') ?? _officeComputer;
    });
    await _safeInitAsync(() async {
      _groqKey = await secureStorage.getString('ff_groqKey') ?? _groqKey;
    });
    await _safeInitAsync(() async {
      _apiKey = await secureStorage.getString('ff_apiKey') ?? _apiKey;
    });
    await _safeInitAsync(() async {
      _diagnoses = (await secureStorage.getStringList('ff_diagnoses'))
              ?.map((x) {
                try {
                  return DiagnosesStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _diagnoses;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _imageModelNumber = '';
  String get imageModelNumber => _imageModelNumber;
  set imageModelNumber(String value) {
    _imageModelNumber = value;
    secureStorage.setString('ff_imageModelNumber', value);
  }

  void deleteImageModelNumber() {
    secureStorage.delete(key: 'ff_imageModelNumber');
  }

  String _imageAppliance = '';
  String get imageAppliance => _imageAppliance;
  set imageAppliance(String value) {
    _imageAppliance = value;
    secureStorage.setString('ff_imageAppliance', value);
  }

  void deleteImageAppliance() {
    secureStorage.delete(key: 'ff_imageAppliance');
  }

  String _responseModelNumberAI = '';
  String get responseModelNumberAI => _responseModelNumberAI;
  set responseModelNumberAI(String value) {
    _responseModelNumberAI = value;
    secureStorage.setString('ff_responseModelNumberAI', value);
  }

  void deleteResponseModelNumberAI() {
    secureStorage.delete(key: 'ff_responseModelNumberAI');
  }

  String _responseApplianceAi = '';
  String get responseApplianceAi => _responseApplianceAi;
  set responseApplianceAi(String value) {
    _responseApplianceAi = value;
    secureStorage.setString('ff_responseApplianceAi', value);
  }

  void deleteResponseApplianceAi() {
    secureStorage.delete(key: 'ff_responseApplianceAi');
  }

  bool _darkMode = true;
  bool get darkMode => _darkMode;
  set darkMode(bool value) {
    _darkMode = value;
    secureStorage.setBool('ff_darkMode', value);
  }

  void deleteDarkMode() {
    secureStorage.delete(key: 'ff_darkMode');
  }

  String _imageUrl = '';
  String get imageUrl => _imageUrl;
  set imageUrl(String value) {
    _imageUrl = value;
    secureStorage.setString('ff_imageUrl', value);
  }

  void deleteImageUrl() {
    secureStorage.delete(key: 'ff_imageUrl');
  }

  String _query = '';
  String get query => _query;
  set query(String value) {
    _query = value;
    secureStorage.setString('ff_query', value);
  }

  void deleteQuery() {
    secureStorage.delete(key: 'ff_query');
  }

  bool _startRecord = true;
  bool get startRecord => _startRecord;
  set startRecord(bool value) {
    _startRecord = value;
  }

  String _fileAudio = '';
  String get fileAudio => _fileAudio;
  set fileAudio(String value) {
    _fileAudio = value;
  }

  String _aiResponseAudio = '';
  String get aiResponseAudio => _aiResponseAudio;
  set aiResponseAudio(String value) {
    _aiResponseAudio = value;
  }

  bool _openFab = false;
  bool get openFab => _openFab;
  set openFab(bool value) {
    _openFab = value;
  }

  bool _lightMode = true;
  bool get lightMode => _lightMode;
  set lightMode(bool value) {
    _lightMode = value;
  }

  bool _viewNotes = false;
  bool get viewNotes => _viewNotes;
  set viewNotes(bool value) {
    _viewNotes = value;
  }

  String _userRole = '';
  String get userRole => _userRole;
  set userRole(String value) {
    _userRole = value;
    secureStorage.setString('ff_userRole', value);
  }

  void deleteUserRole() {
    secureStorage.delete(key: 'ff_userRole');
  }

  String _userPhoto = '';
  String get userPhoto => _userPhoto;
  set userPhoto(String value) {
    _userPhoto = value;
    secureStorage.setString('ff_userPhoto', value);
  }

  void deleteUserPhoto() {
    secureStorage.delete(key: 'ff_userPhoto');
  }

  String _userName = '';
  String get userName => _userName;
  set userName(String value) {
    _userName = value;
    secureStorage.setString('ff_userName', value);
  }

  void deleteUserName() {
    secureStorage.delete(key: 'ff_userName');
  }

  String _userPhone = '';
  String get userPhone => _userPhone;
  set userPhone(String value) {
    _userPhone = value;
    secureStorage.setString('ff_userPhone', value);
  }

  void deleteUserPhone() {
    secureStorage.delete(key: 'ff_userPhone');
  }

  String _userEmail = '';
  String get userEmail => _userEmail;
  set userEmail(String value) {
    _userEmail = value;
    secureStorage.setString('ff_userEmail', value);
  }

  void deleteUserEmail() {
    secureStorage.delete(key: 'ff_userEmail');
  }

  DateTime? _datePicked = DateTime.fromMillisecondsSinceEpoch(1731052800000);
  DateTime? get datePicked => _datePicked;
  set datePicked(DateTime? value) {
    _datePicked = value;
  }

  List<String> _newTicket = [];
  List<String> get newTicket => _newTicket;
  set newTicket(List<String> value) {
    _newTicket = value;
  }

  void addToNewTicket(String value) {
    newTicket.add(value);
  }

  void removeFromNewTicket(String value) {
    newTicket.remove(value);
  }

  void removeAtIndexFromNewTicket(int index) {
    newTicket.removeAt(index);
  }

  void updateNewTicketAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    newTicket[index] = updateFn(_newTicket[index]);
  }

  void insertAtIndexInNewTicket(int index, String value) {
    newTicket.insert(index, value);
  }

  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  set startTime(DateTime? value) {
    _startTime = value;
  }

  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  set endTime(DateTime? value) {
    _endTime = value;
  }

  String _technicianPhoto = '';
  String get technicianPhoto => _technicianPhoto;
  set technicianPhoto(String value) {
    _technicianPhoto = value;
  }

  bool _priorityNote = false;
  bool get priorityNote => _priorityNote;
  set priorityNote(bool value) {
    _priorityNote = value;
  }

  String _dispatch = 'user';
  String get dispatch => _dispatch;
  set dispatch(String value) {
    _dispatch = value;
    secureStorage.setString('ff_dispatch', value);
  }

  void deleteDispatch() {
    secureStorage.delete(key: 'ff_dispatch');
  }

  String _technician = 'user';
  String get technician => _technician;
  set technician(String value) {
    _technician = value;
  }

  List<String> _workOrderList = [];
  List<String> get workOrderList => _workOrderList;
  set workOrderList(List<String> value) {
    _workOrderList = value;
  }

  void addToWorkOrderList(String value) {
    workOrderList.add(value);
  }

  void removeFromWorkOrderList(String value) {
    workOrderList.remove(value);
  }

  void removeAtIndexFromWorkOrderList(int index) {
    workOrderList.removeAt(index);
  }

  void updateWorkOrderListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    workOrderList[index] = updateFn(_workOrderList[index]);
  }

  void insertAtIndexInWorkOrderList(int index, String value) {
    workOrderList.insert(index, value);
  }

  String _qrCodeStockParts = 'Scan QR Code';
  String get qrCodeStockParts => _qrCodeStockParts;
  set qrCodeStockParts(String value) {
    _qrCodeStockParts = value;
  }

  String _manager = 'user';
  String get manager => _manager;
  set manager(String value) {
    _manager = value;
  }

  String _officeManager = 'user';
  String get officeManager => _officeManager;
  set officeManager(String value) {
    _officeManager = value;
  }

  String _qrUuidScaned = '00330';
  String get qrUuidScaned => _qrUuidScaned;
  set qrUuidScaned(String value) {
    _qrUuidScaned = value;
  }

  bool _officeComputer = false;
  bool get officeComputer => _officeComputer;
  set officeComputer(bool value) {
    _officeComputer = value;
    secureStorage.setBool('ff_officeComputer', value);
  }

  void deleteOfficeComputer() {
    secureStorage.delete(key: 'ff_officeComputer');
  }

  String _uuid = '01';
  String get uuid => _uuid;
  set uuid(String value) {
    _uuid = value;
  }

  DateTime? _dateTrackingArrive =
      DateTime.fromMillisecondsSinceEpoch(1741225680000);
  DateTime? get dateTrackingArrive => _dateTrackingArrive;
  set dateTrackingArrive(DateTime? value) {
    _dateTrackingArrive = value;
  }

  String _trackingSearch = '12';
  String get trackingSearch => _trackingSearch;
  set trackingSearch(String value) {
    _trackingSearch = value;
  }

  DateTime? _workOderSearchDate =
      DateTime.fromMillisecondsSinceEpoch(1741300680000);
  DateTime? get workOderSearchDate => _workOderSearchDate;
  set workOderSearchDate(DateTime? value) {
    _workOderSearchDate = value;
  }

  String _diagnosisId = '';
  String get diagnosisId => _diagnosisId;
  set diagnosisId(String value) {
    _diagnosisId = value;
  }

  bool _isOffline = false;
  bool get isOffline => _isOffline;
  set isOffline(bool value) {
    _isOffline = value;
  }

  String _groqKey = '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';
  String get groqKey => _groqKey;
  set groqKey(String value) {
    _groqKey = value;
    secureStorage.setString('ff_groqKey', value);
  }

  void deleteGroqKey() {
    secureStorage.delete(key: 'ff_groqKey');
  }

  String _apiKey = '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';
  String get apiKey => _apiKey;
  set apiKey(String value) {
    _apiKey = value;
    secureStorage.setString('ff_apiKey', value);
  }

  void deleteApiKey() {
    secureStorage.delete(key: 'ff_apiKey');
  }

  List<DiagnosesStruct> _diagnoses = [];
  List<DiagnosesStruct> get diagnoses => _diagnoses;
  set diagnoses(List<DiagnosesStruct> value) {
    _diagnoses = value;
    secureStorage.setStringList(
        'ff_diagnoses', value.map((x) => x.serialize()).toList());
  }

  void deleteDiagnoses() {
    secureStorage.delete(key: 'ff_diagnoses');
  }

  void addToDiagnoses(DiagnosesStruct value) {
    diagnoses.add(value);
    secureStorage.setStringList(
        'ff_diagnoses', _diagnoses.map((x) => x.serialize()).toList());
  }

  void removeFromDiagnoses(DiagnosesStruct value) {
    diagnoses.remove(value);
    secureStorage.setStringList(
        'ff_diagnoses', _diagnoses.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDiagnoses(int index) {
    diagnoses.removeAt(index);
    secureStorage.setStringList(
        'ff_diagnoses', _diagnoses.map((x) => x.serialize()).toList());
  }

  void updateDiagnosesAtIndex(
    int index,
    DiagnosesStruct Function(DiagnosesStruct) updateFn,
  ) {
    diagnoses[index] = updateFn(_diagnoses[index]);
    secureStorage.setStringList(
        'ff_diagnoses', _diagnoses.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDiagnoses(int index, DiagnosesStruct value) {
    diagnoses.insert(index, value);
    secureStorage.setStringList(
        'ff_diagnoses', _diagnoses.map((x) => x.serialize()).toList());
  }

  bool _checkView1 = false;
  bool get checkView1 => _checkView1;
  set checkView1(bool value) {
    _checkView1 = value;
  }

  bool _checkView2 = false;
  bool get checkView2 => _checkView2;
  set checkView2(bool value) {
    _checkView2 = value;
  }

  String _checkView3 = '';
  String get checkView3 => _checkView3;
  set checkView3(String value) {
    _checkView3 = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
