import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'voice_diagnosis_widget.dart' show VoiceDiagnosisWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class VoiceDiagnosisModel extends FlutterFlowModel<VoiceDiagnosisWidget> {
  ///  Local state fields for this component.

  bool isRecording = false;

  bool pt = false;

  bool us = false;

  String groqKey = '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';

  bool saveReport = false;

  int? estimateTime = 45;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  AudioRecorder? audioRecorder;
  String? audioRecorded;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Custom Action - audioTranscription] action in Container widget.
  String? audioTranscribe;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
