import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'diagnosis_botton_sheet_widget.dart' show DiagnosisBottonSheetWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class DiagnosisBottonSheetModel
    extends FlutterFlowModel<DiagnosisBottonSheetWidget> {
  ///  Local state fields for this component.

  List<dynamic> copytextAudioResponse = [];
  void addToCopytextAudioResponse(dynamic item) =>
      copytextAudioResponse.add(item);
  void removeFromCopytextAudioResponse(dynamic item) =>
      copytextAudioResponse.remove(item);
  void removeAtIndexFromCopytextAudioResponse(int index) =>
      copytextAudioResponse.removeAt(index);
  void insertAtIndexInCopytextAudioResponse(int index, dynamic item) =>
      copytextAudioResponse.insert(index, item);
  void updateCopytextAudioResponseAtIndex(
          int index, Function(dynamic) updateFn) =>
      copytextAudioResponse[index] = updateFn(copytextAudioResponse[index]);

  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // Stores action output result for [Gemini - Text From Image] action in Container widget.
  String? responseModelNumber;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Gemini - Text From Image] action in Container widget.
  String? responseAppliances;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? audioRecord;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - API (diagnosisAudio)] action in Button widget.
  ApiCallResponse? audioDianosis;
  AudioRecorder? audioRecorder;
  bool isDataUploading3 = false;
  List<FFUploadedFile> uploadedLocalFiles3 = [];
  List<String> uploadedFileUrls3 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
