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
      apiUrl: 'https://webhook.wmappliances.cloud/webhook/stock',
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
