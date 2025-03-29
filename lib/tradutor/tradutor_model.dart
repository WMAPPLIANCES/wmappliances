import '/flutter_flow/flutter_flow_util.dart';
import 'tradutor_widget.dart' show TradutorWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class TradutorModel extends FlutterFlowModel<TradutorWidget> {
  ///  Local state fields for this page.

  bool isRecording = false;

  bool isRecordingPT = false;

  String returnvoice = 'Tap a language button to start recording';

  bool recordwave = false;

  ///  State fields for stateful widgets in this page.

  AudioRecorder? audioRecorder1;
  String? audioRecorded123;
  FFUploadedFile recordedFileBytes1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // Stores action output result for [Custom Action - audioTranscriptionAndPlay] action in Container widget.
  String? return127889;
  AudioRecorder? audioRecorder2;
  String? audioRecordedPT;
  FFUploadedFile recordedFileBytes2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Custom Action - audioTranscriptionAndPlay] action in Container widget.
  String? ptrecird;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
