// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UrserRoleStruct extends BaseStruct {
  UrserRoleStruct({
    String? userId,
    String? userRole,
  })  : _userId = userId,
        _userRole = userRole;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "user_role" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  set userRole(String? val) => _userRole = val;

  bool hasUserRole() => _userRole != null;

  static UrserRoleStruct fromMap(Map<String, dynamic> data) => UrserRoleStruct(
        userId: data['user_id'] as String?,
        userRole: data['user_role'] as String?,
      );

  static UrserRoleStruct? maybeFromMap(dynamic data) => data is Map
      ? UrserRoleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user_id': _userId,
        'user_role': _userRole,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'user_role': serializeParam(
          _userRole,
          ParamType.String,
        ),
      }.withoutNulls;

  static UrserRoleStruct fromSerializableMap(Map<String, dynamic> data) =>
      UrserRoleStruct(
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        userRole: deserializeParam(
          data['user_role'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UrserRoleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UrserRoleStruct &&
        userId == other.userId &&
        userRole == other.userRole;
  }

  @override
  int get hashCode => const ListEquality().hash([userId, userRole]);
}

UrserRoleStruct createUrserRoleStruct({
  String? userId,
  String? userRole,
}) =>
    UrserRoleStruct(
      userId: userId,
      userRole: userRole,
    );
