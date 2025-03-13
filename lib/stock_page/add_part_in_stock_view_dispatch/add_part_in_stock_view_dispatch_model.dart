import '/flutter_flow/flutter_flow_util.dart';
import 'add_part_in_stock_view_dispatch_widget.dart'
    show AddPartInStockViewDispatchWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AddPartInStockViewDispatchModel
    extends FlutterFlowModel<AddPartInStockViewDispatchWidget> {
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

  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();
  }
}
