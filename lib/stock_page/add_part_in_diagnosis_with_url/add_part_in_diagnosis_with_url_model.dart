import '/flutter_flow/flutter_flow_util.dart';
import 'add_part_in_diagnosis_with_url_widget.dart'
    show AddPartInDiagnosisWithUrlWidget;
import 'package:flutter/material.dart';

class AddPartInDiagnosisWithUrlModel
    extends FlutterFlowModel<AddPartInDiagnosisWithUrlWidget> {
  ///  Local state fields for this component.

  List<String> imagensPart = [];
  void addToImagensPart(String item) => imagensPart.add(item);
  void removeFromImagensPart(String item) => imagensPart.remove(item);
  void removeAtIndexFromImagensPart(int index) => imagensPart.removeAt(index);
  void insertAtIndexInImagensPart(int index, String item) =>
      imagensPart.insert(index, item);
  void updateImagensPartAtIndex(int index, Function(String) updateFn) =>
      imagensPart[index] = updateFn(imagensPart[index]);

  bool showImage = false;

  String? image =
      'https://api.wmappliances.cloud/storage/v1/object/public/photos/users/LOGO%20WM%20APPLIANCE%20NOVA%20casa%20alta%20reso.png';

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for quantity widget.
  FocusNode? quantityFocusNode;
  TextEditingController? quantityTextController;
  String? Function(BuildContext, String?)? quantityTextControllerValidator;
  // Stores action output result for [Custom Action - n8nApiCallAddPart] action in Button widget.
  String? sus;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    quantityFocusNode?.dispose();
    quantityTextController?.dispose();
  }
}
