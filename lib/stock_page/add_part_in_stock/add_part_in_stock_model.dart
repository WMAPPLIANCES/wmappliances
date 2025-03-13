import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_part_in_stock_widget.dart' show AddPartInStockWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AddPartInStockModel extends FlutterFlowModel<AddPartInStockWidget> {
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

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for Replacement widget.
  FocusNode? replacementFocusNode;
  TextEditingController? replacementTextController;
  String? Function(BuildContext, String?)? replacementTextControllerValidator;
  // State field(s) for Price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    replacementFocusNode?.dispose();
    replacementTextController?.dispose();

    priceFocusNode?.dispose();
    priceTextController?.dispose();

    textFieldFocusNode3?.dispose();
    textController5?.dispose();
  }
}
