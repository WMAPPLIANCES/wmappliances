// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppliancesStruct extends BaseStruct {
  AppliancesStruct({
    String? refrigerator,
    String? dishwasher,
    String? washerM,
  })  : _refrigerator = refrigerator,
        _dishwasher = dishwasher,
        _washerM = washerM;

  // "Refrigerator" field.
  String? _refrigerator;
  String get refrigerator => _refrigerator ?? '';
  set refrigerator(String? val) => _refrigerator = val;

  bool hasRefrigerator() => _refrigerator != null;

  // "Dishwasher" field.
  String? _dishwasher;
  String get dishwasher => _dishwasher ?? '';
  set dishwasher(String? val) => _dishwasher = val;

  bool hasDishwasher() => _dishwasher != null;

  // "WasherM" field.
  String? _washerM;
  String get washerM => _washerM ?? '';
  set washerM(String? val) => _washerM = val;

  bool hasWasherM() => _washerM != null;

  static AppliancesStruct fromMap(Map<String, dynamic> data) =>
      AppliancesStruct(
        refrigerator: data['Refrigerator'] as String?,
        dishwasher: data['Dishwasher'] as String?,
        washerM: data['WasherM'] as String?,
      );

  static AppliancesStruct? maybeFromMap(dynamic data) => data is Map
      ? AppliancesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Refrigerator': _refrigerator,
        'Dishwasher': _dishwasher,
        'WasherM': _washerM,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Refrigerator': serializeParam(
          _refrigerator,
          ParamType.String,
        ),
        'Dishwasher': serializeParam(
          _dishwasher,
          ParamType.String,
        ),
        'WasherM': serializeParam(
          _washerM,
          ParamType.String,
        ),
      }.withoutNulls;

  static AppliancesStruct fromSerializableMap(Map<String, dynamic> data) =>
      AppliancesStruct(
        refrigerator: deserializeParam(
          data['Refrigerator'],
          ParamType.String,
          false,
        ),
        dishwasher: deserializeParam(
          data['Dishwasher'],
          ParamType.String,
          false,
        ),
        washerM: deserializeParam(
          data['WasherM'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AppliancesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppliancesStruct &&
        refrigerator == other.refrigerator &&
        dishwasher == other.dishwasher &&
        washerM == other.washerM;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([refrigerator, dishwasher, washerM]);
}

AppliancesStruct createAppliancesStruct({
  String? refrigerator,
  String? dishwasher,
  String? washerM,
}) =>
    AppliancesStruct(
      refrigerator: refrigerator,
      dishwasher: dishwasher,
      washerM: washerM,
    );
