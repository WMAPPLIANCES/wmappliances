import '/flutter_flow/flutter_flow_util.dart';
import 'photo_uploadtes_widget.dart' show PhotoUploadtesWidget;
import 'package:flutter/material.dart';

class PhotoUploadtesModel extends FlutterFlowModel<PhotoUploadtesWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
