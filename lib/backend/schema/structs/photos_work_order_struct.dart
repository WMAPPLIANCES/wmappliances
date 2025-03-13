// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PhotosWorkOrderStruct extends BaseStruct {
  PhotosWorkOrderStruct({
    List<PhotosWorkOrderStruct>? photos,
    List<String>? photosUrl,
    String? audioResponseDiagnosis,
    bool? openFab,
  })  : _photos = photos,
        _photosUrl = photosUrl,
        _audioResponseDiagnosis = audioResponseDiagnosis,
        _openFab = openFab;

  // "photos" field.
  List<PhotosWorkOrderStruct>? _photos;
  List<PhotosWorkOrderStruct> get photos => _photos ?? const [];
  set photos(List<PhotosWorkOrderStruct>? val) => _photos = val;

  void updatePhotos(Function(List<PhotosWorkOrderStruct>) updateFn) {
    updateFn(_photos ??= []);
  }

  bool hasPhotos() => _photos != null;

  // "photosUrl" field.
  List<String>? _photosUrl;
  List<String> get photosUrl => _photosUrl ?? const [];
  set photosUrl(List<String>? val) => _photosUrl = val;

  void updatePhotosUrl(Function(List<String>) updateFn) {
    updateFn(_photosUrl ??= []);
  }

  bool hasPhotosUrl() => _photosUrl != null;

  // "audioResponseDiagnosis" field.
  String? _audioResponseDiagnosis;
  String get audioResponseDiagnosis => _audioResponseDiagnosis ?? '';
  set audioResponseDiagnosis(String? val) => _audioResponseDiagnosis = val;

  bool hasAudioResponseDiagnosis() => _audioResponseDiagnosis != null;

  // "openFab" field.
  bool? _openFab;
  bool get openFab => _openFab ?? false;
  set openFab(bool? val) => _openFab = val;

  bool hasOpenFab() => _openFab != null;

  static PhotosWorkOrderStruct fromMap(Map<String, dynamic> data) =>
      PhotosWorkOrderStruct(
        photos: getStructList(
          data['photos'],
          PhotosWorkOrderStruct.fromMap,
        ),
        photosUrl: getDataList(data['photosUrl']),
        audioResponseDiagnosis: data['audioResponseDiagnosis'] as String?,
        openFab: data['openFab'] as bool?,
      );

  static PhotosWorkOrderStruct? maybeFromMap(dynamic data) => data is Map
      ? PhotosWorkOrderStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'photos': _photos?.map((e) => e.toMap()).toList(),
        'photosUrl': _photosUrl,
        'audioResponseDiagnosis': _audioResponseDiagnosis,
        'openFab': _openFab,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'photos': serializeParam(
          _photos,
          ParamType.DataStruct,
          isList: true,
        ),
        'photosUrl': serializeParam(
          _photosUrl,
          ParamType.String,
          isList: true,
        ),
        'audioResponseDiagnosis': serializeParam(
          _audioResponseDiagnosis,
          ParamType.String,
        ),
        'openFab': serializeParam(
          _openFab,
          ParamType.bool,
        ),
      }.withoutNulls;

  static PhotosWorkOrderStruct fromSerializableMap(Map<String, dynamic> data) =>
      PhotosWorkOrderStruct(
        photos: deserializeStructParam<PhotosWorkOrderStruct>(
          data['photos'],
          ParamType.DataStruct,
          true,
          structBuilder: PhotosWorkOrderStruct.fromSerializableMap,
        ),
        photosUrl: deserializeParam<String>(
          data['photosUrl'],
          ParamType.String,
          true,
        ),
        audioResponseDiagnosis: deserializeParam(
          data['audioResponseDiagnosis'],
          ParamType.String,
          false,
        ),
        openFab: deserializeParam(
          data['openFab'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'PhotosWorkOrderStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PhotosWorkOrderStruct &&
        listEquality.equals(photos, other.photos) &&
        listEquality.equals(photosUrl, other.photosUrl) &&
        audioResponseDiagnosis == other.audioResponseDiagnosis &&
        openFab == other.openFab;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([photos, photosUrl, audioResponseDiagnosis, openFab]);
}

PhotosWorkOrderStruct createPhotosWorkOrderStruct({
  String? audioResponseDiagnosis,
  bool? openFab,
}) =>
    PhotosWorkOrderStruct(
      audioResponseDiagnosis: audioResponseDiagnosis,
      openFab: openFab,
    );
