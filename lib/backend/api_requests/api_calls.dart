import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class DiagnosisAudioCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? file,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'diagnosisAudio',
      apiUrl: 'https://host.n8n.wmappliances.cloud/webhook/audioDiagnosis',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AudioTranscribeCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? audioDiagnosis,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'audioTranscribe',
      apiUrl: 'https://host.n8n.wmappliances.cloud/webhook-test/audioDiagnosis',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'audioDiagnosis': audioDiagnosis,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddPartStockDiagnosisCall {
  static Future<ApiCallResponse> call({
    String? createBy = 'none',
    String? workOrderId = 'none',
    String? diagnosisStockPart = 'none',
    String? diagnosisId = 'none',
    String? stockId = 'none',
    String? partId = 'none',
    String? partUrl = 'none',
    String? typePart = 'none',
    String? iten = 'none',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'addPartStockDiagnosis',
      apiUrl: 'https://webhook.wmappliances.cloud/webhook/addPartStock',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'create_by': createBy,
        'work_order_id': workOrderId,
        'diagnosis_stock_part': diagnosisStockPart,
        'diagnosis_id': diagnosisId,
        'stock_id': stockId,
        'part_id': partId,
        'part_url': partUrl,
        'type_part': typePart,
        'iten': iten,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GroqAudioTranscriptionCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? file,
    String? apiKey = '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',
    String? model = 'whisper-large-v3-turbo',
    String? responseFormat = 'verbose_json',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Groq Audio Transcription',
      apiUrl: 'https://api.groq.com/openai/v1/audio/transcriptions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${apiKey}',
        'Content-Type': 'multipart/form-data',
      },
      params: {
        'file': file,
        'apiKey': apiKey,
        'model': model,
        'response_format': responseFormat,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTechniciansSchedulesByDateCall {
  static Future<ApiCallResponse> call({
    String? appointmentDate = 'eq.2025-03-20',
    String? apiKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4amxxb3ZtZW51c2NwYWVldGxsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc5ODA5MzUsImV4cCI6MjA0MzU1NjkzNX0.oZDlUq2ZYfECUwcCzaqXcokhNw-96nJn25WtVh2KK2Q',
    String? selectedDate = '2025-03-20',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getTechniciansSchedulesByDate',
      apiUrl: 'https://api.wmappliances.cloud/rest/v1/technicians_schedules',
      callType: ApiCallType.GET,
      headers: {
        'apikey': '${apiKey}',
        'Authorization': 'Bearer ${apiKey}',
      },
      params: {
        'appointment_date': appointmentDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTechniciansSchedulesByDateMapsCall {
  static Future<ApiCallResponse> call({
    String? appointmentDate,
    String? apiKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4amxxb3ZtZW51c2NwYWVldGxsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc5ODA5MzUsImV4cCI6MjA0MzU1NjkzNX0.oZDlUq2ZYfECUwcCzaqXcokhNw-96nJn25WtVh2KK2Q',
    String? selectedDate = '',
  }) async {
    appointmentDate ??= 'eq.[selectedDate]';

    return ApiManager.instance.makeApiCall(
      callName: 'getTechniciansSchedulesByDateMaps',
      apiUrl: 'https://api.wmappliances.cloud/rest/v1/schedules',
      callType: ApiCallType.GET,
      headers: {
        'apikey': '${apiKey}',
        'Authorization': 'Bearer ${apiKey}',
      },
      params: {
        'appointment_date': appointmentDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? latLng(dynamic response) => (getJsonField(
        response,
        r'''$[:].lat_lng''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? scheduleId(dynamic response) => (getJsonField(
        response,
        r'''$[:].schedule_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? techniciansUuid(dynamic response) => (getJsonField(
        response,
        r'''$[:].technicians_uuid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? techniciansName(dynamic response) => (getJsonField(
        response,
        r'''$[:].technicians_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? techniciansPhoto(dynamic response) => (getJsonField(
        response,
        r'''$[:].technicians_photo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? technicianColor(dynamic response) => (getJsonField(
        response,
        r'''$[:].technician_color''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? customerName(dynamic response) => (getJsonField(
        response,
        r'''$[:].customer_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? appointmentDate(dynamic response) => (getJsonField(
        response,
        r'''$[:].appointment_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? customerAddress(dynamic response) => (getJsonField(
        response,
        r'''$[:].customer_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
