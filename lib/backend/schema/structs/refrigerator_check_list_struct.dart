// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RefrigeratorCheckListStruct extends BaseStruct {
  RefrigeratorCheckListStruct({
    String? powersupplyisconnected,
    String? temperaturecontrolsaresetcorrectly,
    String? doorlatchandgasketsealtightly,
    String? condensercoilscleanandunobstructed,
    String? evaporatorcoilsfrostFree,
    String? evaporatorfanandcondenserfanoperatingcorrectly,
    String? refrigeratorcoolingproperly,
    String? defrostsystemoperational,
    String? drainpananddraintubeclearofobstructions,
    String? novisiblewaterleaks,
    bool? completeCheckList,
  })  : _powersupplyisconnected = powersupplyisconnected,
        _temperaturecontrolsaresetcorrectly =
            temperaturecontrolsaresetcorrectly,
        _doorlatchandgasketsealtightly = doorlatchandgasketsealtightly,
        _condensercoilscleanandunobstructed =
            condensercoilscleanandunobstructed,
        _evaporatorcoilsfrostFree = evaporatorcoilsfrostFree,
        _evaporatorfanandcondenserfanoperatingcorrectly =
            evaporatorfanandcondenserfanoperatingcorrectly,
        _refrigeratorcoolingproperly = refrigeratorcoolingproperly,
        _defrostsystemoperational = defrostsystemoperational,
        _drainpananddraintubeclearofobstructions =
            drainpananddraintubeclearofobstructions,
        _novisiblewaterleaks = novisiblewaterleaks,
        _completeCheckList = completeCheckList;

  // "Powersupplyisconnected" field.
  String? _powersupplyisconnected;
  String get powersupplyisconnected =>
      _powersupplyisconnected ?? 'Power supply is connected';
  set powersupplyisconnected(String? val) => _powersupplyisconnected = val;

  bool hasPowersupplyisconnected() => _powersupplyisconnected != null;

  // "Temperaturecontrolsaresetcorrectly" field.
  String? _temperaturecontrolsaresetcorrectly;
  String get temperaturecontrolsaresetcorrectly =>
      _temperaturecontrolsaresetcorrectly ??
      'Temperature controls are set correctly';
  set temperaturecontrolsaresetcorrectly(String? val) =>
      _temperaturecontrolsaresetcorrectly = val;

  bool hasTemperaturecontrolsaresetcorrectly() =>
      _temperaturecontrolsaresetcorrectly != null;

  // "Doorlatchandgasketsealtightly" field.
  String? _doorlatchandgasketsealtightly;
  String get doorlatchandgasketsealtightly =>
      _doorlatchandgasketsealtightly ?? 'Door latch and gasket seal tightly';
  set doorlatchandgasketsealtightly(String? val) =>
      _doorlatchandgasketsealtightly = val;

  bool hasDoorlatchandgasketsealtightly() =>
      _doorlatchandgasketsealtightly != null;

  // "Condensercoilscleanandunobstructed" field.
  String? _condensercoilscleanandunobstructed;
  String get condensercoilscleanandunobstructed =>
      _condensercoilscleanandunobstructed ??
      'Condenser coils clean and unobstructed';
  set condensercoilscleanandunobstructed(String? val) =>
      _condensercoilscleanandunobstructed = val;

  bool hasCondensercoilscleanandunobstructed() =>
      _condensercoilscleanandunobstructed != null;

  // "Evaporatorcoilsfrost-free" field.
  String? _evaporatorcoilsfrostFree;
  String get evaporatorcoilsfrostFree =>
      _evaporatorcoilsfrostFree ?? 'Evaporator coils frost-free';
  set evaporatorcoilsfrostFree(String? val) => _evaporatorcoilsfrostFree = val;

  bool hasEvaporatorcoilsfrostFree() => _evaporatorcoilsfrostFree != null;

  // "Evaporatorfanandcondenserfanoperatingcorrectly" field.
  String? _evaporatorfanandcondenserfanoperatingcorrectly;
  String get evaporatorfanandcondenserfanoperatingcorrectly =>
      _evaporatorfanandcondenserfanoperatingcorrectly ??
      'Evaporator fan and condenser fan operating correctly';
  set evaporatorfanandcondenserfanoperatingcorrectly(String? val) =>
      _evaporatorfanandcondenserfanoperatingcorrectly = val;

  bool hasEvaporatorfanandcondenserfanoperatingcorrectly() =>
      _evaporatorfanandcondenserfanoperatingcorrectly != null;

  // "Refrigeratorcoolingproperly" field.
  String? _refrigeratorcoolingproperly;
  String get refrigeratorcoolingproperly =>
      _refrigeratorcoolingproperly ?? 'Refrigerator cooling properly';
  set refrigeratorcoolingproperly(String? val) =>
      _refrigeratorcoolingproperly = val;

  bool hasRefrigeratorcoolingproperly() => _refrigeratorcoolingproperly != null;

  // "Defrostsystemoperational" field.
  String? _defrostsystemoperational;
  String get defrostsystemoperational =>
      _defrostsystemoperational ?? 'Defrost system operational';
  set defrostsystemoperational(String? val) => _defrostsystemoperational = val;

  bool hasDefrostsystemoperational() => _defrostsystemoperational != null;

  // "Drainpananddraintubeclearofobstructions" field.
  String? _drainpananddraintubeclearofobstructions;
  String get drainpananddraintubeclearofobstructions =>
      _drainpananddraintubeclearofobstructions ??
      'Drain pan and drain tube clear of obstructions';
  set drainpananddraintubeclearofobstructions(String? val) =>
      _drainpananddraintubeclearofobstructions = val;

  bool hasDrainpananddraintubeclearofobstructions() =>
      _drainpananddraintubeclearofobstructions != null;

  // "Novisiblewaterleaks" field.
  String? _novisiblewaterleaks;
  String get novisiblewaterleaks =>
      _novisiblewaterleaks ?? 'No visible water leaks';
  set novisiblewaterleaks(String? val) => _novisiblewaterleaks = val;

  bool hasNovisiblewaterleaks() => _novisiblewaterleaks != null;

  // "completeCheckList" field.
  bool? _completeCheckList;
  bool get completeCheckList => _completeCheckList ?? false;
  set completeCheckList(bool? val) => _completeCheckList = val;

  bool hasCompleteCheckList() => _completeCheckList != null;

  static RefrigeratorCheckListStruct fromMap(Map<String, dynamic> data) =>
      RefrigeratorCheckListStruct(
        powersupplyisconnected: data['Powersupplyisconnected'] as String?,
        temperaturecontrolsaresetcorrectly:
            data['Temperaturecontrolsaresetcorrectly'] as String?,
        doorlatchandgasketsealtightly:
            data['Doorlatchandgasketsealtightly'] as String?,
        condensercoilscleanandunobstructed:
            data['Condensercoilscleanandunobstructed'] as String?,
        evaporatorcoilsfrostFree: data['Evaporatorcoilsfrost-free'] as String?,
        evaporatorfanandcondenserfanoperatingcorrectly:
            data['Evaporatorfanandcondenserfanoperatingcorrectly'] as String?,
        refrigeratorcoolingproperly:
            data['Refrigeratorcoolingproperly'] as String?,
        defrostsystemoperational: data['Defrostsystemoperational'] as String?,
        drainpananddraintubeclearofobstructions:
            data['Drainpananddraintubeclearofobstructions'] as String?,
        novisiblewaterleaks: data['Novisiblewaterleaks'] as String?,
        completeCheckList: data['completeCheckList'] as bool?,
      );

  static RefrigeratorCheckListStruct? maybeFromMap(dynamic data) => data is Map
      ? RefrigeratorCheckListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Powersupplyisconnected': _powersupplyisconnected,
        'Temperaturecontrolsaresetcorrectly':
            _temperaturecontrolsaresetcorrectly,
        'Doorlatchandgasketsealtightly': _doorlatchandgasketsealtightly,
        'Condensercoilscleanandunobstructed':
            _condensercoilscleanandunobstructed,
        'Evaporatorcoilsfrost-free': _evaporatorcoilsfrostFree,
        'Evaporatorfanandcondenserfanoperatingcorrectly':
            _evaporatorfanandcondenserfanoperatingcorrectly,
        'Refrigeratorcoolingproperly': _refrigeratorcoolingproperly,
        'Defrostsystemoperational': _defrostsystemoperational,
        'Drainpananddraintubeclearofobstructions':
            _drainpananddraintubeclearofobstructions,
        'Novisiblewaterleaks': _novisiblewaterleaks,
        'completeCheckList': _completeCheckList,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Powersupplyisconnected': serializeParam(
          _powersupplyisconnected,
          ParamType.String,
        ),
        'Temperaturecontrolsaresetcorrectly': serializeParam(
          _temperaturecontrolsaresetcorrectly,
          ParamType.String,
        ),
        'Doorlatchandgasketsealtightly': serializeParam(
          _doorlatchandgasketsealtightly,
          ParamType.String,
        ),
        'Condensercoilscleanandunobstructed': serializeParam(
          _condensercoilscleanandunobstructed,
          ParamType.String,
        ),
        'Evaporatorcoilsfrost-free': serializeParam(
          _evaporatorcoilsfrostFree,
          ParamType.String,
        ),
        'Evaporatorfanandcondenserfanoperatingcorrectly': serializeParam(
          _evaporatorfanandcondenserfanoperatingcorrectly,
          ParamType.String,
        ),
        'Refrigeratorcoolingproperly': serializeParam(
          _refrigeratorcoolingproperly,
          ParamType.String,
        ),
        'Defrostsystemoperational': serializeParam(
          _defrostsystemoperational,
          ParamType.String,
        ),
        'Drainpananddraintubeclearofobstructions': serializeParam(
          _drainpananddraintubeclearofobstructions,
          ParamType.String,
        ),
        'Novisiblewaterleaks': serializeParam(
          _novisiblewaterleaks,
          ParamType.String,
        ),
        'completeCheckList': serializeParam(
          _completeCheckList,
          ParamType.bool,
        ),
      }.withoutNulls;

  static RefrigeratorCheckListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RefrigeratorCheckListStruct(
        powersupplyisconnected: deserializeParam(
          data['Powersupplyisconnected'],
          ParamType.String,
          false,
        ),
        temperaturecontrolsaresetcorrectly: deserializeParam(
          data['Temperaturecontrolsaresetcorrectly'],
          ParamType.String,
          false,
        ),
        doorlatchandgasketsealtightly: deserializeParam(
          data['Doorlatchandgasketsealtightly'],
          ParamType.String,
          false,
        ),
        condensercoilscleanandunobstructed: deserializeParam(
          data['Condensercoilscleanandunobstructed'],
          ParamType.String,
          false,
        ),
        evaporatorcoilsfrostFree: deserializeParam(
          data['Evaporatorcoilsfrost-free'],
          ParamType.String,
          false,
        ),
        evaporatorfanandcondenserfanoperatingcorrectly: deserializeParam(
          data['Evaporatorfanandcondenserfanoperatingcorrectly'],
          ParamType.String,
          false,
        ),
        refrigeratorcoolingproperly: deserializeParam(
          data['Refrigeratorcoolingproperly'],
          ParamType.String,
          false,
        ),
        defrostsystemoperational: deserializeParam(
          data['Defrostsystemoperational'],
          ParamType.String,
          false,
        ),
        drainpananddraintubeclearofobstructions: deserializeParam(
          data['Drainpananddraintubeclearofobstructions'],
          ParamType.String,
          false,
        ),
        novisiblewaterleaks: deserializeParam(
          data['Novisiblewaterleaks'],
          ParamType.String,
          false,
        ),
        completeCheckList: deserializeParam(
          data['completeCheckList'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'RefrigeratorCheckListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RefrigeratorCheckListStruct &&
        powersupplyisconnected == other.powersupplyisconnected &&
        temperaturecontrolsaresetcorrectly ==
            other.temperaturecontrolsaresetcorrectly &&
        doorlatchandgasketsealtightly == other.doorlatchandgasketsealtightly &&
        condensercoilscleanandunobstructed ==
            other.condensercoilscleanandunobstructed &&
        evaporatorcoilsfrostFree == other.evaporatorcoilsfrostFree &&
        evaporatorfanandcondenserfanoperatingcorrectly ==
            other.evaporatorfanandcondenserfanoperatingcorrectly &&
        refrigeratorcoolingproperly == other.refrigeratorcoolingproperly &&
        defrostsystemoperational == other.defrostsystemoperational &&
        drainpananddraintubeclearofobstructions ==
            other.drainpananddraintubeclearofobstructions &&
        novisiblewaterleaks == other.novisiblewaterleaks &&
        completeCheckList == other.completeCheckList;
  }

  @override
  int get hashCode => const ListEquality().hash([
        powersupplyisconnected,
        temperaturecontrolsaresetcorrectly,
        doorlatchandgasketsealtightly,
        condensercoilscleanandunobstructed,
        evaporatorcoilsfrostFree,
        evaporatorfanandcondenserfanoperatingcorrectly,
        refrigeratorcoolingproperly,
        defrostsystemoperational,
        drainpananddraintubeclearofobstructions,
        novisiblewaterleaks,
        completeCheckList
      ]);
}

RefrigeratorCheckListStruct createRefrigeratorCheckListStruct({
  String? powersupplyisconnected,
  String? temperaturecontrolsaresetcorrectly,
  String? doorlatchandgasketsealtightly,
  String? condensercoilscleanandunobstructed,
  String? evaporatorcoilsfrostFree,
  String? evaporatorfanandcondenserfanoperatingcorrectly,
  String? refrigeratorcoolingproperly,
  String? defrostsystemoperational,
  String? drainpananddraintubeclearofobstructions,
  String? novisiblewaterleaks,
  bool? completeCheckList,
}) =>
    RefrigeratorCheckListStruct(
      powersupplyisconnected: powersupplyisconnected,
      temperaturecontrolsaresetcorrectly: temperaturecontrolsaresetcorrectly,
      doorlatchandgasketsealtightly: doorlatchandgasketsealtightly,
      condensercoilscleanandunobstructed: condensercoilscleanandunobstructed,
      evaporatorcoilsfrostFree: evaporatorcoilsfrostFree,
      evaporatorfanandcondenserfanoperatingcorrectly:
          evaporatorfanandcondenserfanoperatingcorrectly,
      refrigeratorcoolingproperly: refrigeratorcoolingproperly,
      defrostsystemoperational: defrostsystemoperational,
      drainpananddraintubeclearofobstructions:
          drainpananddraintubeclearofobstructions,
      novisiblewaterleaks: novisiblewaterleaks,
      completeCheckList: completeCheckList,
    );
