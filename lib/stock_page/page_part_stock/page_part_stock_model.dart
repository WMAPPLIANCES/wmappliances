import '/backend/supabase/supabase.dart';
import '/components/side_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/nav_bar1/nav_bar1_widget.dart';
import 'page_part_stock_widget.dart' show PagePartStockWidget;
import 'package:flutter/material.dart';

class PagePartStockModel extends FlutterFlowModel<PagePartStockWidget> {
  ///  Local state fields for this page.

  bool viewDetail = false;

  bool viewNotes = false;

  List<StockPartsRow> partQuery = [];
  void addToPartQuery(StockPartsRow item) => partQuery.add(item);
  void removeFromPartQuery(StockPartsRow item) => partQuery.remove(item);
  void removeAtIndexFromPartQuery(int index) => partQuery.removeAt(index);
  void insertAtIndexInPartQuery(int index, StockPartsRow item) =>
      partQuery.insert(index, item);
  void updatePartQueryAtIndex(int index, Function(StockPartsRow) updateFn) =>
      partQuery[index] = updateFn(partQuery[index]);

  List<StockPartsRow> partQueryOnPageLoad = [];
  void addToPartQueryOnPageLoad(StockPartsRow item) =>
      partQueryOnPageLoad.add(item);
  void removeFromPartQueryOnPageLoad(StockPartsRow item) =>
      partQueryOnPageLoad.remove(item);
  void removeAtIndexFromPartQueryOnPageLoad(int index) =>
      partQueryOnPageLoad.removeAt(index);
  void insertAtIndexInPartQueryOnPageLoad(int index, StockPartsRow item) =>
      partQueryOnPageLoad.insert(index, item);
  void updatePartQueryOnPageLoadAtIndex(
          int index, Function(StockPartsRow) updateFn) =>
      partQueryOnPageLoad[index] = updateFn(partQueryOnPageLoad[index]);

  Color? colorSelected;

  Color? colorSelect2;

  ///  State fields for stateful widgets in this page.

  // Model for sideMenuView component.
  late SideMenuViewModel sideMenuViewModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<StockPartsRow>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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

    paginatedDataTableController.dispose();
    navBar1Model.dispose();
  }
}
