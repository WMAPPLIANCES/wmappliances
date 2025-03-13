import '/backend/supabase/supabase.dart';
import '/components/side_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/nav_bar1/nav_bar1_widget.dart';
import 'dashboard_dispatch_widget.dart' show DashboardDispatchWidget;
import 'package:flutter/material.dart';

class DashboardDispatchModel extends FlutterFlowModel<DashboardDispatchWidget> {
  ///  Local state fields for this page.

  bool viewDetail = false;

  bool viewNotes = false;

  String partDeliveryImage =
      'https://api.wmappliances.cloud/storage/v1/object/public/photos/users/LOGO%20WM%20APPLIANCE%20NOVA%20casa%20alta%20reso.png';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in dashboardDispatch widget.
  List<StockPartsRow>? queryStock;
  // Model for sideMenuView component.
  late SideMenuViewModel sideMenuViewModel;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // Stores action output result for [Gemini - Text From Image] action in Button widget.
  String? geminiTrack;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    sideMenuViewModel = createModel(context, () => SideMenuViewModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    sideMenuViewModel.dispose();
    navBar1Model.dispose();
  }
}
