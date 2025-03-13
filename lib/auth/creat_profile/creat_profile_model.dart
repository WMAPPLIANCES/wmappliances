import '/backend/supabase/supabase.dart';
import '/components/side_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'creat_profile_widget.dart' show CreatProfileWidget;
import 'package:flutter/material.dart';

class CreatProfileModel extends FlutterFlowModel<CreatProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideMenuView component.
  late SideMenuViewModel sideMenuViewModel;
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
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UsersRow? userCreate;

  @override
  void initState(BuildContext context) {
    sideMenuViewModel = createModel(context, () => SideMenuViewModel());
  }

  @override
  void dispose() {
    sideMenuViewModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}
