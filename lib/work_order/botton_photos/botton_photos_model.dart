import '/flutter_flow/flutter_flow_util.dart';
import 'botton_photos_widget.dart' show BottonPhotosWidget;
import 'package:flutter/material.dart';

class BottonPhotosModel extends FlutterFlowModel<BottonPhotosWidget> {
  ///  Local state fields for this component.

  bool hideIcon = false;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
