import '/flutter_flow/flutter_flow_util.dart';
import 'part_location_photo_widget.dart' show PartLocationPhotoWidget;
import 'package:flutter/material.dart';

class PartLocationPhotoModel extends FlutterFlowModel<PartLocationPhotoWidget> {
  ///  Local state fields for this component.

  String imagePhoto = 'image';

  Color? colorSelected;

  String colorString = 'colorString';

  String qrCodeScaned = 'qrcode';

  String qrCodeStockParts = 'qrcode';

  bool scanQrToStart = false;

  Color? colorSelectShelf2;

  String? colorSelectShelf2String;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
