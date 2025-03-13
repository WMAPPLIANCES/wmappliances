import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_appliance_widget.dart' show CreateApplianceWidget;
import 'package:flutter/material.dart';

class CreateApplianceModel extends FlutterFlowModel<CreateApplianceWidget> {
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

  List<String> updaloadModel = [];
  void addToUpdaloadModel(String item) => updaloadModel.add(item);
  void removeFromUpdaloadModel(String item) => updaloadModel.remove(item);
  void removeAtIndexFromUpdaloadModel(int index) =>
      updaloadModel.removeAt(index);
  void insertAtIndexInUpdaloadModel(int index, String item) =>
      updaloadModel.insert(index, item);
  void updateUpdaloadModelAtIndex(int index, Function(String) updateFn) =>
      updaloadModel[index] = updateFn(updaloadModel[index]);

  List<String> aiDiagnosis = [];
  void addToAiDiagnosis(String item) => aiDiagnosis.add(item);
  void removeFromAiDiagnosis(String item) => aiDiagnosis.remove(item);
  void removeAtIndexFromAiDiagnosis(int index) => aiDiagnosis.removeAt(index);
  void insertAtIndexInAiDiagnosis(int index, String item) =>
      aiDiagnosis.insert(index, item);
  void updateAiDiagnosisAtIndex(int index, Function(String) updateFn) =>
      aiDiagnosis[index] = updateFn(aiDiagnosis[index]);

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
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  DiagnosesRow? diagnosisID;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
