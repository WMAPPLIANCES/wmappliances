import '/appointment/pages/nav_bar1/nav_bar1_widget.dart';
import '/backend/supabase/supabase.dart';
import '/components/side_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'delivery_parts_arrived_page_widget.dart'
    show DeliveryPartsArrivedPageWidget;
import 'package:flutter/material.dart';

class DeliveryPartsArrivedPageModel
    extends FlutterFlowModel<DeliveryPartsArrivedPageWidget> {
  ///  Local state fields for this page.

  bool viewDetail = false;

  bool viewNotes = false;

  List<DeliveryRow> partQuery = [];
  void addToPartQuery(DeliveryRow item) => partQuery.add(item);
  void removeFromPartQuery(DeliveryRow item) => partQuery.remove(item);
  void removeAtIndexFromPartQuery(int index) => partQuery.removeAt(index);
  void insertAtIndexInPartQuery(int index, DeliveryRow item) =>
      partQuery.insert(index, item);
  void updatePartQueryAtIndex(int index, Function(DeliveryRow) updateFn) =>
      partQuery[index] = updateFn(partQuery[index]);

  List<DeliveryRow> partQueryOnPageLoad = [];
  void addToPartQueryOnPageLoad(DeliveryRow item) =>
      partQueryOnPageLoad.add(item);
  void removeFromPartQueryOnPageLoad(DeliveryRow item) =>
      partQueryOnPageLoad.remove(item);
  void removeAtIndexFromPartQueryOnPageLoad(int index) =>
      partQueryOnPageLoad.removeAt(index);
  void insertAtIndexInPartQueryOnPageLoad(int index, DeliveryRow item) =>
      partQueryOnPageLoad.insert(index, item);
  void updatePartQueryOnPageLoadAtIndex(
          int index, Function(DeliveryRow) updateFn) =>
      partQueryOnPageLoad[index] = updateFn(partQueryOnPageLoad[index]);

  Color? colorSelected;

  Color? colorSelect2;

  bool searchDate = false;

  ///  State fields for stateful widgets in this page.

  // Model for sideMenuView component.
  late SideMenuViewModel sideMenuViewModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  DateTime? datePicked;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<DeliveryRow>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<DeliveryRow>();
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
    textFieldFocusNode?.dispose();
    textController?.dispose();

    paginatedDataTableController1.dispose();
    paginatedDataTableController2.dispose();
    navBar1Model.dispose();
  }
}
