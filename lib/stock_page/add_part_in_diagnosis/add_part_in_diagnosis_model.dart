import '/flutter_flow/flutter_flow_util.dart';
import 'add_part_in_diagnosis_widget.dart' show AddPartInDiagnosisWidget;
import 'package:flutter/material.dart';

class AddPartInDiagnosisModel
    extends FlutterFlowModel<AddPartInDiagnosisWidget> {
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
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for quantity widget.
  FocusNode? quantityFocusNode;
  TextEditingController? quantityTextController;
  String? Function(BuildContext, String?)? quantityTextControllerValidator;
  // State field(s) for Price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // Stores action output result for [Custom Action - n8nApiCallAddPart] action in Button widget.
  String? test;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    quantityFocusNode?.dispose();
    quantityTextController?.dispose();

    priceFocusNode?.dispose();
    priceTextController?.dispose();

    textFieldFocusNode3?.dispose();
    textController5?.dispose();
  }
}
